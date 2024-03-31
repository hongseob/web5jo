const applyButton = document.getElementById("applyButton");
const mentorReviewButton = document.getElementById("mentorReviewButton");
const stepName1 = document.getElementById("stepName1");
const stepName2 = document.getElementById("stepName2");
const stepName3 = document.getElementById("stepName3");
const stepName4 = document.getElementById("stepName4");
const stepName5 = document.getElementById("stepName5");
const applyCheckNum = campaignInfo[0].applyCheck;
const auth = campaignInfo[0].auth;
let campaignName = "";
let mentorName = "";
let mentorId = "";
let mentorPkId = 0;
let reviewCheck = 0;
let applyStatus = campaignInfo[0].applyStatus;
let tempStep = 0;


var map;

function loadMap(lon, lat){
	//지도
	map = new ol.Map({
		target : 'map',
		view : new ol.View({
			projection : 'EPSG:3857',
		    // 중심좌표
		    center : ol.proj.transform([lon,lat],'EPSG:4326','EPSG:3857'),
		    // 지도 zoom 단계
		    zoom : 15,
		    minZoom : 7,
		    maxZoom : 19,
		    }),
		layers : [
			// 뷰 style 관리
			new ol.layer.Tile({
				source : new ol.source.XYZ({
					url : 'http://xdworld.vworld.kr:8080/2d/Base/202002/{z}/{x}/{y}.png'
		            }),
		         })]
		   });
	//lkm 원 그리기 
     
     var circleSource = new ol.source.Vector({projection: 'EPSG:3857'});
     var pnt = new ol.geom.Point([lon,lat]).transform('EPSG:4326', 'EPSG:3857');
     var changePoints = pnt.getCoordinates();
     var circle = new ol.geom.Circle(changePoints, 1000);  //좌표, 반경 넓이
     var CircleFeature = new ol.Feature(circle); 
     circleSource.addFeatures(([CircleFeature]));
     
     var circleLayer =new ol.layer.Vector({  //추가할 벡터레이어
    	  source: circleSource,
    	  style: [
    	  new ol.style.Style({
    	      stroke: new ol.style.Stroke({   //두께
    	          color: '#4AA8D8',
    	          width: 2
    	      }),
    	      fill: new ol.style.Fill({  //채우기
    	          color: 'rgba(74, 168, 216, 0.4)'
    	      }),
    	  })]
    	});
     
     map.addLayer(circleLayer);

}

function campaignInfoAjax(){
	
	$.ajax({
		url : '/main/info/ajax/campaignInfoList.do',
		dataType : 'json',
		data : {
			cId : campaignInfo[0].id,
			/*cId : 201,*/
		},
		contentType : "application/json; charset=utf-8",
		async : false,
		type : 'GET',
		success : function(data) {
			/*console.log(data);
			console.log(applyCheckNum);*/
			const campaign = data.infoList.find(isCampaign);
			const campaignList = data.infoList;
			
			campaignName = campaign.cNm;
			mentorName = campaign.uNm;
			mentorId = campaign.uId;

			$('.campaignName').text(campaign.cNm);
			$('.cpnStart').text(campaign.stDate);
			$('.cpnEnd').text(campaign.edDate);
			$('.cpnPnum').text(campaign.cMbr);
			$('.campaignCreater').text(campaign.uNm);
			$('.phonenumber').text(campaign.uHp.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`));			
			$('.campaign_Info').text(campaign.cExp);
			
			mentorPkId = data.mentorPkId;
			reviewCheck = data.reviewCheck;
			document.getElementById("mentorPkId").value = mentorPkId;
			if(data.reviewCheck == 1) {
				reviewView(data.reviewAverage);
			}
			
			stepperBarNameView(campaign.cSt);
			campaignStepMove(campaign.cSt);
			meetBtnChange(campaign);
			estimateView(campaign);
			fileListAdd(campaignList);
			categoryListAdd(campaignList);
			noFaceToLink(campaign);
			addressFind(campaign);
			campaignCalenderAdd(campaignList);
			
			if(campaign.cSt == '3' || campaign.cSt == '5'){
				$('#go_modify_btn').hide();
				document.getElementById("modifyButtonBox").style.display = "none";
				document.getElementById("applyButtonBox").style.cssText = "margin-right: 0px";
			}
				//let applyButtonBox = document.getElementsByClassName("applyButtonBox")[0];
				
				//applyButtonBox.style.margin-left = "550px";*/
				// applyButtonBox.style.cssText = "margin-left: 550px";
				// newA.style.cssText = "color: cornflowerblue";
			
			if(campaign.cInter == '1'){ //대면
				$('#imageAndMap').html('Location Info');
				$('#img_body').empty();
				let gisDiv = '<div id=map class=map></div>';	
				$('#img_body').append(gisDiv);
				
				let lon_x = campaign.lonX;
				let lat_y = campaign.latY;
				loadMap(lon_x, lat_y); //지도표출
				
			} else{
//				$('.box_name').html('Image');
				$('#img_body').empty();
				let imgDiv = '<img id="campaignImage" class="campaign_image" src="" alt="사진">';
				$('#img_body').append(imgDiv);
				imgChange(campaign);	
			}
			
			
		},
		error : function(request, status, error) {
			console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	});
}

function isCampaign(element) {
		return true;
}



function downloadFile(fileSName, fileOName) {

	$.ajax({
		url: '/main/download/ajax/download.do',
		method:"GET",
		data : {
			fileSvrName : fileSName
		},
		async : false,
		success : function(data) {
			/*console.log("a link onclick ajax success");*/
		},
		error : 
			function(request, status, error) {
			console.log("파일데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	})
	filedownURI(fileSName, fileOName);
}

function allDownloadFiles(fileArr) {
	$.ajax({
		url: '/main/alldownload/ajax/alldownload.do',
		method:"GET",
		traditional: true,
		data : {
			"fileArr": fileArr
		},
		async : false,
		success : function(data) {
			/*console.log("all download link onclick ajax success");*/
		},
		error : 
			function(request, status, error) {
			console.log("파일데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	})
	filedownAllURI(fileArr);
}


function filedownAllURI(fileArr) {
	var link = document.createElement('a');
	document.body.appendChild(link);
	var href = "/main/alldownload/ajax/alldownload.do?";
	fileArr.forEach((fileName, i) => {
		href += `fileArr=${fileName}&`
	})
	href = href.slice(0, href.length - 1);
	link.href = href;
	link.setAttribute('download', "files.zip");
	link.click();
	document.body.removeChild(link);
}



function filedownURI(fileSName, fileOName) {
	var link = document.createElement('a');
	document.body.appendChild(link);
	link.href = `/main/download/ajax/download.do?fileSvrName=${fileSName}`;
	link.setAttribute('download', fileOName);
	link.click();
	document.body.removeChild(link);
}

function stepperBarNameView(step) {
	if(auth == 'A' && campaignInfo[0].createrCheck != 0) {
		stepName1.innerText = "신청중";
		stepName2.innerText = "모집중";
		stepName3.innerText = "모집완료";
		stepName4.innerText = "진행중";
		stepName5.innerText = "종료";
	} else {
		stepName1.innerText = "신청";
		stepName2.innerText = "승인";
		stepName3.innerText = "예약확정";
		stepName4.innerText = "진행중";
		stepName5.innerText = "종료";
	}
}

function campaignStepMove(step) {
	
	if(auth == 'A' && campaignInfo[0].createrCheck != 0) {
		if(step == '0') {
			document.getElementById('status_name').innerText = "반려";
			document.getElementById('status_icon').className += 'fa-solid fa-file-circle-xmark';
			tempStep = 0;
		} else if(step == '1') {
			document.getElementById('status_name').innerText = "신청중";
			document.getElementById('status_icon').className += 'bi bi-pencil-square';
			tempStep = 1;
		} else if(step == '2') {
			document.getElementById('status_name').innerText = "모집중";
			document.getElementById('status_icon').className += 'fa-solid fa-cart-plus';
			tempStep = 2;
		} else if(step == '4') {
			document.getElementById('status_name').innerText = "모집완료";
			document.getElementById('status_icon').className += 'fa-solid fa-user-check';
			tempStep = 3;
		} else if(step == '3') {
			document.getElementById('status_name').innerText = "진행중";
			document.getElementById('status_icon').className += 'fa-solid fa-spinner';
			tempStep = 4;
		} else if(step == '5') {
			document.getElementById('status_name').innerText = "종료";
			document.getElementById('status_icon').className += 'fa-regular fa-calendar-minus';
			tempStep = 5;
		}
		
	} else {
		
		document.getElementById("modifyButtonBox").style.display = "none";
		document.getElementById("applyButtonBox").style.cssText = "margin-right: 0px";
		
		if(applyCheckNum == 1) {
			let applyStatus = campaignInfo[0].applyStatus;
			applyStatus *= 1;
			
			if(applyStatus == 1) {
				document.getElementById('status_name').innerText = "신청";
				document.getElementById('status_icon').className += 'bi bi-pencil-square';
			} else if(applyStatus == 2) {
				document.getElementById('status_name').innerText = "승인";
				document.getElementById('status_icon').className += 'fa-solid fa-person-circle-check';
			} else if(applyStatus == 3) {
				document.getElementById('status_name').innerText = "예약확정";
				document.getElementById('status_icon').className += 'bi bi-bookmark-check-fill status_icon';
			} else if(applyStatus == 4) {
				document.getElementById('status_name').innerText = "진행중";
				document.getElementById('status_icon').className += 'fa-solid fa-spinner';
			} else if(applyStatus == 5) {
				document.getElementById('status_name').innerText = "종료";
				document.getElementById('status_icon').className += 'fa-regular fa-calendar-minus';
			} else if(applyStatus == 6) {
				document.getElementById('status_name').innerText = "거절";
				document.getElementById('status_icon').className += 'fa-solid fa-user-large-slash';
			}
			
			if(applyStatus != 6) {
				tempStep = applyStatus;
			} else {
				tempStep = 0;
			}
			
			
		} else {
			if(step == '0') {
				document.getElementById('status_name').innerText = "반려";
				document.getElementById('status_icon').className += 'fa-solid fa-file-circle-xmark';
				tempStep = 0;
			} else if(step == '1') {
				document.getElementById('status_name').innerText = "신청중";
				document.getElementById('status_icon').className += 'bi bi-pencil-square';
				tempStep = 1;
			} else if(step == '2') {
				document.getElementById('status_name').innerText = "모집중";
				document.getElementById('status_icon').className += 'fa-solid fa-cart-plus';
				tempStep = 2;
			} else if(step == '4') {
				document.getElementById('status_name').innerText = "모집완료";
				document.getElementById('status_icon').className += 'fa-solid fa-user-check';
				tempStep = 3;
			} else if(step == '3') {
				document.getElementById('status_name').innerText = "진행중";
				document.getElementById('status_icon').className += 'fa-solid fa-spinner';
				tempStep = 4;
			} else if(step == '5') {
				document.getElementById('status_name').innerText = "종료";
				document.getElementById('status_icon').className += 'fa-regular fa-calendar-minus';
				tempStep = 5;
			}
			
		}
	}
	
	if(tempStep != 0) {
		document.getElementById(`step${tempStep}`).className += ' active';
		
		for(i=1; i<tempStep; i++) {
			document.getElementById(`step${i}`).className += ' completed';
		}
	}
	
}

function btnActive() {
	const target = document.getElementById('meetBtn');
	target.disabled = false;
	const target2 = document.getElementById('notMeetBtn');
	target2.disabled = true;
}

function btnDisabled() {
	const target = document.getElementById('meetBtn');
	target.disabled = true;
	const target2 = document.getElementById('notMeetBtn')
	target2.disabled = false;
}

function meetBtnChange(campaign) {
	if(campaign.cInter === '1') {
		btnActive();
	} else {
		btnDisabled();
	}
}

function estimateView(campaign) {
	const estimate = campaign.estimate;
	
	var	estimateSort = "총";

	estimateValue = estimate.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	
	$('.campaignEstimateSort').text(estimateSort);
	$('.campaignEstimateValue').text(estimateValue);
}


function reviewView(reviewAverage) {
	if(Number.isInteger(reviewAverage)) {
		reviewAverage += ".0";
	}
	document.getElementById("reviewGrade").innerText = reviewAverage;
}

function imgChange(campaign) {
	
	const campaignId = campaign.cId;
	
	$.ajax({
		url : '/main/download/ajax/imageDownload.do',
		dataType : 'json',
		data : {
			cId: campaignId,
		},
		contentType : "application/json; charset=utf-8",
		async : false,
		type : 'GET',
		success : function(data) {
			/*console.log("ajax success")*/;
			const imageData = data.imageInfolist[0];
			imageSrcInput(imageData);
			
		},
		error : function(request, status, error) {
			console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	})
}

function imageSrcInput(imageData) {
	const image = document.getElementById('campaignImage');
	var imageSvrName = imageData.fileSvrName;
	image.src = `/imgpath/${imageSvrName}`;
}

function categoryListAdd(campaignList) {
	let CategoryBox = document.getElementById('categoryList');
	let categoryArr = campaignList.map(row=>row.category);
	const set = new Set(categoryArr);
	const reCategoryArr = [...set];
	
	for(i=0; i<reCategoryArr.length; i++) {
		const newA = document.createElement("a");
		newA.setAttribute("id",`campaignCategory${i}`);
		newA.style.margin="2px";
		const newText = document.createTextNode(reCategoryArr[i]);
		newA.appendChild(newText);		
		CategoryBox.appendChild(newA);
		document.getElementById(`campaignCategory${i}`).className = 'btn btn-outline-secondary btn-sm mb-1';
	}
}

function fileListAdd(campaignList) {
	const tableBody = document.getElementById('fileBox');
	
	const FileOrgArr = campaignList.map(row=>row.fileOrgName);
	const FileSvrNameArr = campaignList.map(row=>row.fileSvrName);
	const FileDateArr = campaignList.map(row=>row.regiDate);
	
	const resultObj = FileOrgArr.reduce((acc, curr, idx) => {
		acc[curr] = FileDateArr[idx];
		return acc;
	}, new Object);
	
	const result2Obj = FileSvrNameArr.reduce((acc, curr, idx) => {
		acc[curr] = FileDateArr[idx];
		return acc
	}, new Object)
	
	newFileOrgNameArr = Object.keys(resultObj);
	newFileSvrNameArr = Object.keys(result2Obj);
	newFileDateArr = Object.values(resultObj);
	
	for(i=0; i<newFileOrgNameArr.length; i++) {
		const newRow = tableBody.insertRow();
		const newCell1 = newRow.insertCell(0);
		const newCell2 = newRow.insertCell(1);
		/*const newCell3 = newRow.insertCell(2);*/
		
		newCell1.innerText = newFileOrgNameArr[i];
		newCell2.innerText = newFileDateArr[i];
		
		/*const newA = document.createElement("a");
		newA.setAttribute("download", newFileOrgNameArr[i]);
		newA.setAttribute("class","fileButton");
		newA.setAttribute("onclick",`downloadFile("${newFileSvrNameArr[i]}", "${newFileOrgNameArr[i]}")`);

		newA.style.cssText = "margin: 2px; color: cornflowerblue";
		const newI = document.createElement("i");
		newI.setAttribute("class","bi bi-plus-circle");
		
		newA.appendChild(newI);
		newCell3.appendChild(newA);*/
	}
	
	const allDownload = document.getElementById('allDownload');
	allDownload.setAttribute("onclick", "allDownloadFiles(newFileSvrNameArr)");
}

function addressFind(campaign) {
	if(campaign.cInter == '1') {
//		const x = 37.5566803113882;
//		const y = 126.904501286522;
		const x = campaign.lonX;
		const y = campaign.latY;
		const result = getAddr(x, y);
	}
}

function getAddr(lat, lon){
	const addressBox = document.getElementById('addressMap');
    let geocoder = new kakao.maps.services.Geocoder();
    let coord = new kakao.maps.LatLng(lon, lat);
    let callback = function(result, status) {
    	if (status === kakao.maps.services.Status.OK) {
    		addressBox.innerText = result[0].address.address_name;
        }
    }
    geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
}

function noFaceToLink(campaign) {
	
	if(campaign.cInter == '2') {
		$('.participation').text("비대면 캠페인 링크");
		
		let meetBox = document.getElementsByClassName("range_body")[0];
		
		const rangeDiv = document.getElementById('range1');
		const rangeDiv2 = document.getElementById('range2');
		rangeDiv.style.display = 'none';
		rangeDiv2.style.display = 'none';
		const newDiv = document.createElement("div");
		const addDiv = document.createElement("div");
		meetBox.appendChild(newDiv);
		meetBox.appendChild(addDiv);
		newDiv.innerText = "아래 링크를 클릭하여 서비스 이동";
		addDiv.style.cssText = "font-size: 12px; color: red;";
		newDiv.innerText = "아래 링크를 클릭하여 서비스 이동";
		addDiv.innerText = "*캠페인이 진행단계로 업데이트시 활성화 됩니다.";
		const newA = document.createElement("a");


		if(tempStep == 4) {
			newA.setAttribute("href", campaign.svcLink);
			newA.setAttribute("class", "btn btn-outline-secondary imageAtag mt-2");
			newA.style.cssText = "color: cornflowerblue";
		} else {
			newA.setAttribute("class", "disable btn btn-outline-secondary imageAtag mt-2");
			newA.setAttribute("style", "color: grey;");
		}
		meetBox.appendChild(newA);
		
		if(campaign.svcNm == "ZOOM") {
			newA.innerHTML = '<img id="linkImage" class="linkImage" src="/images/egovframework/index/zoom.png" alt="사진">';
		} else {
			newA.innerHTML = '<img id="linkImage" class="linkImage" src="/images/egovframework/index/discord.png" alt="사진">';
		}
		/*$('#img_body').append(imgDiv);*/

		
		
	}
}

function campaignCalenderAdd(campaignList) {
	const tableBody = document.getElementById('calenderListBox');

	let calenderArr = campaignList.map(row=>row.calendar);
	let calenderDateArr = campaignList.map(row=>row.cDate);
	let calenderTimeArr = campaignList.map(row=>row.stHour);
	
	const resultObj = calenderDateArr.reduce((acc, curr, idx) => {
		acc[curr] = calenderArr[idx];
		return acc;
	}, new Object);
	
	const resultObj2 = calenderDateArr.reduce((acc, curr, idx) => {
		acc[curr] = calenderTimeArr[idx];
		return acc;
	}, new Object);

	
	const newresultObj = sortObject(resultObj);
	const newresultObj2 = sortObject(resultObj2);
	
	const newCalenderArr = Object.values(newresultObj);
	const newCalenderDateArr = Object.keys(newresultObj);
	const newCalenderTimeArr = Object.values(newresultObj2);
	
	for(i=0; i<newCalenderArr.length; i++) {
		
		const tableBody = document.getElementById('calenderListBox');
		const newRow = document.createElement("tr");
		newRow.setAttribute("id",`calenderTr${i}`);
		tableBody.appendChild(newRow);
		
		/*const newTh = document.createElement("th");
		newTh.setAttribute("scope","row");
		newTh.innerText = `${i+1}`;
		document.getElementById(`calenderTr${i}`).appendChild(newTh);*/
		
		const newCell1 = document.createElement("td");
		const newCell2 = document.createElement("td");
		const newCell3 = document.createElement("td");
		newCell1.innerText = newCalenderArr[i];
		newCell2.innerText = newCalenderDateArr[i];
		newCell3.innerText = newCalenderTimeArr[i];
		document.getElementById(`calenderTr${i}`).appendChild(newCell1);
		document.getElementById(`calenderTr${i}`).appendChild(newCell2);
		document.getElementById(`calenderTr${i}`).appendChild(newCell3);
	}
	
	/*객체의 키값인 날짜를 기준으로 객체 순서 정렬 함수*/
	function sortObject(resultObj) {
		var sorted = {};
		var a = [];
		
		for(key in resultObj) {
			if(resultObj.hasOwnProperty(key)) {
				a.push(key);
			}
		}
		a.sort(function compare(a, b) {
			let x = new Date(a);
			let y = new Date(b);
			return x - y;
		});
		
		for(i=0; i<a.length; i++) {
			sorted[a[i]] = resultObj[a[i]];
		}
		
		return sorted;
	}
		
}

function applyCheck() {
	
	if(campaignInfo[0].createrCheck != 0) {
		applyButton.innerText = "신청정보 확인";
		$("#go_modify_btn").css('display', 'block');
	}
	
	if(applyCheckNum == 1) {
		applyButton.innerText = "캠페인 신청취소";
	}
	
	if(applyStatus == 5) {
		applyButton.innerText = "멘토 리뷰페이지";
	}
}

function clickApply() {
	
	if(campaignInfo[0].createrCheck != 0) {
		
		/*var campaignId = campaignInfo[0].id;*/
		/*var campaignId = 166;*/
		/*$("#campaignId").attr("value", campaignId);*/
		$("#goApplyListPage").submit();
		
	} else if(applyCheckNum != 0) {
		if(applyStatus != 5) {
			if(window.confirm("캠페인을 취소하시겠습니까?")) {
				cancelCampaign();
			} else {
				
			}
		} else {
			$("#goReviewPage").submit();
		}
	} else {
		if (window.confirm("캠페인을 신청하시겠습니까?")) {
	        applyCampaign();
	    } else {
	        /*console.log("취소. 변화 없음");*/
	    }
	}
	
}

function applyCampaign() {

	var campaignId = campaignInfo[0].id;
	var estimate = document.querySelector(".campaignEstimateValue").innerText;
	estimate = estimate.replaceAll(",", "");
	estimate *= 1;
	
	let offset = new Date().getTimezoneOffset() * 60000;
    let dateOffset = new Date(Date.now() - offset);
    const date = dateOffset.toISOString().substring(0, 10);
	
	$.ajax({
		url : '/main/info/ajax/campaignApply.do',
		dataType : 'json',
		data : {
			imp_uid: '캠페인 신청',
			merchant_uid: `캠페인:${campaignId}`,
			sort: 2,
			p_dt: date,
			amount: estimate,
			cId : campaignId,
			/*cId : 166,*/
			estimate : estimate,
		},
		contentType : "application/json; charset=utf-8",
		async : false,
		type : 'GET',
		success : function(data) {
			if(data.creditCheck) {
				var msg = "캠페인 신청이 완료되었습니다.";
				alert(msg);
				location.href = "/mainBTable.do"
			} else {
				var msg = "크레딧 잔액이 부족합니다.";
				alert(msg);
			}
		},
		error : function(request, status, error) {
			console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	});
}

function cancelCampaign() {
	let applyStatus = campaignInfo[0].applyStatus;
	applyStatus *= 1;
	
	if(applyStatus > 2) {
		var msg = "캠페인확정이 된 이후에는 캠페인 취소가 불가능합니다.";
		alert(msg);
		return;
	}
	
	let offset = new Date().getTimezoneOffset() * 60000;
    let dateOffset = new Date(Date.now() - offset);
    const date = dateOffset.toISOString().substring(0, 10);
	
	var campaignId = campaignInfo[0].id;
	var estimate = document.querySelector(".campaignEstimateValue").innerText;
	estimate = estimate.replaceAll(",", "");
	estimate *= 1;

	
	$.ajax({
		url : '/main/info/ajax/campaignCancel.do',
		dataType : 'json',
		data : {
			imp_uid: '캠페인 취소',
			merchant_uid: `캠페인:${campaignId}`,
			sort: 3,
			p_dt: date,
			amount: estimate,
			cId : campaignId,
			/*cId : 166,*/
			estimate : estimate,
		},
		contentType : "application/json; charset=utf-8",
		async : false,
		type : 'GET',
		success : function(data) {
			var msg = "캠페인 취소가 완료되었습니다.";
			alert(msg);
			location.href = "/mainBTable.do"
		},
		error : function(request, status, error) {
			console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	});
}

function clickMentorReview() {
	if(reviewCheck != 0) {
		$("#goMentorReviewPage").submit();
	} else {
		var msg = "멘토에게 작성된 리뷰가 없습니다.";
		alert(msg);
		return;
	}
	
}

applyCheck();
campaignInfoAjax();
mentorReviewButton.addEventListener("click", clickMentorReview);
applyButton.addEventListener("click", clickApply);
