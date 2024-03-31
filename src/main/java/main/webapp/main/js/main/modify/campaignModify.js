var count =0;
var index = 0;
var bttnNum = 4;
var fileNum = 0;
var lon_x;
var lat_y;
var stDate;
var edDate;
var day;
var existingFile = [];
var existingFileNum;
var d_num=0;

function getAddr(lat,lng){
    let geocoder = new kakao.maps.services.Geocoder();

    let coord = new kakao.maps.LatLng(lat, lng);
    let callback = function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
//            console.log(result[0].road_address.address_name);
            if(result[0].road_address != null){
				$('#campainJoinArea').val(result[0].road_address.address_name);
				$('.cam3_namebtn').trigger("click");
	            loginBox2.classList.add('existence'); 
			}
			else{
				$('#campainJoinArea').val(result[0].address.address_name);
				$('.cam3_namebtn').trigger("click");
	            loginBox2.classList.add('existence'); 
			}
        }
    }
    geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
}

//swiper 기본설정 
$(document).ready(function(){
	
	if($('#campainSetName').val() != ''){
		loginBox1.classList.add('existence'); 
	}
	if($('#campainLinkLoc').val() != ''){
		loginBox3.classList.add('existence'); 
	}
	
	if($("#pre_pic").attr("src") != undefined){
		$('.fa-cloud-arrow-up').css('display','none');
	}
	var esti = $('#full_money').val();
	esti = esti.replace(/[^0-9]/g,'').replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	$('#full_money').val(esti);
	
	const campaignId = $('#campaignId').val();
	$.ajax({
		url : '/main/modify/ajax/getCampaignInfo.do',
		data : {campaignId: campaignId},
		dataType : 'json',
		contentType : "application/json; charset=utf-8",
		async : false,
		type : 'GET',
		success : function(data) {
			var i = 1;
			var j = 0;
			var category;
			while($('#cam1_button' + i).length){
				for (j = 0; j < data.campaignCategory.length; j++) {
					category = data.campaignCategory[j].category;
					if(category == $('#cam1_button' + i).val()){
						campainCreateCategory(i);
					}
				}
				i++;
			}
			lon_x = data.campaignLocation[0].lonX;
			lat_y = data.campaignLocation[0].latY;
			getAddr(lat_y, lon_x);
			fileNum = data.campaignFile.length - 1;
			console.log(data.campaignCalender);
			stDate = new Date(data.campaignCalender[0].stDate);
			edDate = new Date(data.campaignCalender[0].edDate);
			calenderWeek();
			var k;
			var l;
			var thisWeek;
			var z = 0;
			for(k=0; k < data.campaignCalender.length; k++){
				thisWeek = data.campaignCalender[k].weekOf;
				if(k == 0){
					$('#selectDate1').val(data.campaignCalender[k].cDate);
					$('#selectDate1').parent().siblings().find("input[id=calenderHour]").val(data.campaignCalender[k].stHour);
					$('#selectDate1').parent().siblings().find("input[id=calenderInput]").val(data.campaignCalender[k].calendar);
				}
				else if(thisWeek == data.campaignCalender[z].weekOf){ // 일별 일정 경우의 수
					z++;
					// z는 일별 인덱스임
					$('i[id=plus' + thisWeek + ']').trigger('click'); // 해당 주의 추가 버튼을 강제클릭
					console.log(z);
					l = d_num*1 - 1;
					$('#addDate' + l).val(data.campaignCalender[z].cDate);
					$('#addDate' + l).parent().siblings().find("input[id=calenderHour]").val(data.campaignCalender[z].stHour);
					$('#addDate' + l).parent().siblings().find("input[id=calenderInput]").val(data.campaignCalender[z].calendar);
//					$('#selectDate' + isThisWeek).parent().siblings().find("i[id=plus" + isThisWeek + "]").trigger("click");
					
				}
				else{
					$('#selectDate' + thisWeek).val(data.campaignCalender[k].cDate);
					$('#selectDate' + thisWeek).parent().siblings().find("input[id=calenderHour]").val(data.campaignCalender[k].stHour);
					$('#selectDate' + thisWeek).parent().siblings().find("input[id=calenderInput]").val(data.campaignCalender[k].calendar);
					z++;
				}
			}
			
//			console.log(data.campaignCalender[l].weekOf);
//			d_num = new Array(data.campaignCalender[l].weekOf);
		},
		error : function(request, status, error) {
			console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	});
	
var swiper = new Swiper(".mySwiper", {
	pagination: {
		el: ".swiper-pagination",
		type: "progressbar",
	},
	navigation: {
		nextEl: ".swiper-button-next",
		prevEl: ".swiper-button-prev",
	},
	touchRatio: 0,
	allowTouchMove: false,
	allowSlideNext: false,
	on: {
		init: function() {
			//this.slideTo(2);
			this.allowSlideNext = false;
			var that = this;
			
			this.allowSlidePrev = false;
			$(".swiper-button-next").on("click", function() {
				
				if (swiper.activeIndex == 0) {
					if (count > 0) {
						that.allowSlideNext = true;
						that.slideTo(1);
					}
					else if(count == 0){
						$("#campainCreateCategory_alert").html('* 하나이상 선택해 주세요.');
						$("#campainCreateCategory_alert").css('color', 'red');
					}
				}
				else if (swiper.activeIndex == 1) {
					if(($("#campainSetName").val() != "" && $('.upload_btn')[0].files[0] !=null) || ($("#campainSetName").val() != "" && $("#pre_pic").attr("src") != '/images/egovframework/main/common/noImage.png')){
						console.log($('.upload_btn')[0].files[0]); // 기존이미지가 있으면 undefined
						console.log($("#pre_pic").attr("src")); // 
						that.allowSlideNext = true;
						that.slideTo(2);
					}
					else {
						if($("#campainSetName").val() == ""){
							$('#campainSetName_alert').html('* 캠페인 이름을 입력 후 확인 버튼을 눌러주세요.');
							$('#campainSetName_alert').css("color", 'red');
						}
						else if($('.upload_btn')[0].files[0] == null){
							alert("대표이미지를 선택해 주세요");
						}
					}
				}
				else if (swiper.activeIndex == 2){
					
					if($("#campain_personnel").val() == ""){
						$("#campain_personnel_alert").html("*참여 인원을 입력해 주세요");
						$("#campain_personnel_alert").css("color", 'red');
					}
					else{
						$("#campain_personnel_alert").html("");
					}
					
					if($(":input:radio[name=inter]:checked").val() == undefined){
						$("#campain_inter_alert").html("*캠페인 참여 방식을 설정해 주세요");
						$("#campain_inter_alert").css("color", "red");
					}
					else {
						$("#campain_inter_alert").html("");
					}
					if($("#full_money").val() == ""){
						$("#campain_pay_alert").html("*캠페인 견적 금액을 설정해 주세요");
						$("#campain_pay_alert").css("color", "red");
					}
					else{
						$("#campain_pay_alert").html("");
					}


					if($("#campain_personnel").val() != "" && $(":input:radio[name=inter]:checked").val() != null && $("#full_money").val() != ""){
						if($(":input:radio[name=inter]:checked").val() == '대면'){
							
							/*
							if($(":input:radio[name=cam_pay]:checked").val() == "시급" && $("#time_money").val() != ""){
								that.allowSlideNext = true;
								that.slideTo(3);
							}*/
//							if($("#full_money").val() != ""){
								that.allowSlideNext = true;
								that.slideTo(3);
//							}
						}
						else if($(":input:radio[name=inter]:checked").val() == '비대면'){
						/*	if($(":input:radio[name=cam_pay]:checked").val() == "시급" && $("#time_money").val() != ""){
								that.allowSlideNext = true;
								that.slideTo(4);
							}*/
//							if($("#full_money").val() != ""){
							$('#campainLinkLoc_alert').html("");
								that.allowSlideNext = true;
								that.slideTo(4);
//							}
						}
					}
				}
				else if (swiper.activeIndex == 3){
//					if($('#campainJoinArea').val() != ""){
//						that.allowSlideNext = true;
//						that.slideTo(5);
//					}
					//console.log(lon_x);
					//console.log(lat_y);
					if(lon_x != 0 && lat_y != 0){
						that.allowSlideNext = true;
						that.slideTo(5);
					}
					else{
						alert("장소를 선택해 주세요");
					}
					
				}
				else if (swiper.activeIndex == 4){
					//8.29 여기에 그 머냐 value가져와서 작업해야됨
					if($("#campainLinkLoc").val() != "" && $("#color option:selected").val() != 'ex) 줌, 디스코드'){
						$("#selectService_alert").html("");
						that.allowSlideNext = true;
						that.slideTo(5);
					}
					if($("#campainLinkLoc").val() == "") {
						$("#campainLinkLoc_alert").html("*링크를 입력하세요.");
						$("#campainLinkLoc_alert").css("color", "red");
					}
					if($("#color option:selected").val() == 'ex) 줌, 디스코드'){
						$("#selectService_alert").html("*선택해 주세요");
						$("#selectService_alert").css('color', 'red');
						
					}
				}
				else if(swiper.activeIndex == 5){
					//$('.ui-datepicker').css({ "margin-left" : "141px", "margin-top": "-223px"});
					var calender = [];
					$('#calenderTbody tr').each(function() {
						
						var newCalender = {
								calender: $(this).find('#calenderText').find("#calenderInput").val(),
								c_week: $(this).find("#stDate").html(),
								c_date: $(this).find("#selDate").find("#selectDate").val(),
								st_hour: $(this).find('#calenderStartHour').find("#calenderHour").val(),
								weekOf: ($(this).find("#weekOf").html()+"").substr(0,1),
						};
						
						if(newCalender.c_week != null && newCalender.weekOf != null){
							weekOf = ($(this).find("#weekOf").html()+"").substr(0,1);
							c_weekTemp = $(this).find("#stDate").html();
							
						}
						else{
							newCalender.c_week = c_weekTemp;
							newCalender.weekOf = weekOf;
						}
						
						calender.push(newCalender);
					 });
					var nextVar;
					for(var i=0; i<calender.length; i++){
						if(calender[i].calender == '' || calender[i].c_date =='' || calender[i].st_hour == ''){
							nextVar = false;
						}
					}
					if(nextVar == false){
						alert("정보를 모두 입력해 주세요.");
					}
					else{
						that.allowSlideNext = true;
						that.slideTo(6);
					}

				}
				
			});
			$(".swiper-button-prev").on("click", function() {
				if(swiper.activeIndex == 3){
					if($(":input:radio[name=inter]:checked").val() == '비대면'){
						that.slideTo(2);
					}
				}
				else if(swiper.activeIndex == 4){
					if($(":input:radio[name=inter]:checked").val() == '대면'){
						that.slideTo(3);
					}
				}
				
			});


		},
		slideChange: function() {
			var that = this;
			this.allowSlideNext = false;
			//this.allowSlidePrev = false;
			
		},
	}
});

});

//inputbox
var loginBox = document.querySelector('.outBox');
var loginInputBox = document.querySelector('#campainCreateName');
loginInputBox.addEventListener('keyup', function(){
    if(!loginInputBox.value == ''){
        loginBox.classList.add('existence');   
    }else{
        loginBox.classList.remove('existence');   
    }
});

var loginBox1 = document.querySelector('.outBox1');
var loginInputBox1 = document.querySelector('#campainSetName');
loginInputBox1.addEventListener('keyup', function(){
    if(!loginInputBox1.value == ''){
        loginBox1.classList.add('existence');   
    }else{
        loginBox1.classList.remove('existence');   
    }
});

var loginBox2 = document.querySelector('.outBox2');
var loginInputBox2 = document.querySelector('#campainJoinArea');
loginInputBox2.addEventListener('keyup', function(){
    if(!loginInputBox2.value == ''){
        loginBox2.classList.add('existence');   
    }else{
        loginBox2.classList.remove('existence');   
    }
});

var loginBox3 = document.querySelector('.outBox3');
var loginInputBox3 = document.querySelector('#campainLinkLoc');
loginInputBox3.addEventListener('keyup', function(){
    if(!loginInputBox3.value == '' || loginInputBox3.value == null){
        loginBox3.classList.add('existence');   
    }else{
        loginBox3.classList.remove('existence');   
    }
});

//1. 캠페인 카테고리 -> 등록할 캠페인 버튼 클릭시
function campainCreateCategory(className) {
	const parent = document.getElementById('bttn_inner');
	className = "cam1_button" + className;
	//선택시 이벤트 class "selected" 부여 + 색상변경.
	if ($("#" + className).hasClass("selected") === true) {
		$("#" + className).removeClass("selected");
		$("#" + className).css('background-color', 'var(--gm-chip-container-color, transparent)');
		$("#" + className).css('border', '1px solid #dadce0');
		count--;
	}
	else if ($("#" + className).hasClass("selected") === false) {
		$("#" + className).addClass("selected");
		$("#" + className).css('border', '2px solid #1a73e8');
		count++;
	}

	//2개이상 선택시 alert 
//	count = 0;
	
	
//	for (var i = 1; i <= parent.childElementCount; i++) {
//		if ($("#cam1_button" + i).hasClass('selected') == true) {
//			count++;
//		}
//	}

	if (count > 0) {
		$("#campainCreateCategory_alert").html('등록할 캠페인에 대한 카테고리를 설정합니다.');
		$("#campainCreateCategory_alert").css('color', 'rgba(0,0,0,.54)');
	}
}

//1. 캠페인 카테고리 -> 원하시는 다른 카테고리가 있나요? )) 켐페인 이름을 입력하세요. 생성 버튼 클릭시.
function campainCreateName() {
	const parent = document.getElementById('bttn_inner');
	
	
	var NewBtnName = $('#campainCreateName').val();
	
	//입력값 없을시 경고
	if ($('#campainCreateName').val() == "") {
		$('#campainCreateName_alert').html('*카테고리를 설정해주세요');
		$('#campainCreateName_alert').css('color', 'red');

	}
	else {
		$('#campainCreateName_alert').html("카테고리가 추가되었습니다.");
		$('#campainCreateName_alert').css('color', '#1a73e8');
		
	}
	
	var nextBtnNum = parent.childElementCount + 1;
	
	
	if($('#campainCreateName').val() !=""){
		
		$(".bttn_inner").append("<button id = 'cam1_button"+nextBtnNum +"' class='cam1_button"+nextBtnNum+" category_btn' onclick='campainCreateCategory("  + nextBtnNum +")' value='" + NewBtnName + "'>"+ '<i class="fa-solid fa-plus"></i>' + NewBtnName);
		//$(".bttn_inner").append("<button id = 'cam1_button"+nextBtnNum +"' class='cam1_button"+nextBtnNum+" btn btn-primary' onclick='campainCreateCategory("  + nextBtnNum +")'>" + NewBtnName);
		bttnNum ++;
		
	}
	
}

//2. 캠페인 이름 -> 캠페인 이름 설정
function campainSetName() {
	//입력값 없을시 경고
	if ($('#campainSetName').val() == "") {
		$('#campainSetName_alert').html('* 캠페인 이름을 입력 후 확인 버튼을 눌러주세요.');
		$('#campainSetName_alert').css("color", 'red');
		
	}
	else {
		$('#campainSetName_alert').html("캠페인 이름이 설정되었습니다");
		$('#campainSetName_alert').css('color', '#1a73e8');
		
	}
}



$(".upload_btn").change(function(e){	
	
	//alert($('input[type=file]')[0].files[0].name); //파일이름
	if($(".upload_btn").val() != ""){
		$('.fa-cloud-arrow-up').css('display','none');
		$('#img_exist').hide();
	}
	else {
		$('#img_exist').hide();
	}

 });

//6. 캠페인 참여 링크 -> 서비스명 입력
//function campainServiceName() {
//	//입력값 없을시 경고
//	if ($('#campainServiceName').val() == "") {
//		$('#campainServiceName_alert').html('* 서비스명을 입력해 주세요.');
//		$('#campainServiceName_alert').css('color', 'red');
//	}
//	else {
//		$('#campainServiceName_alert').html("");
//		
//		$('#campainServiceName_alert').css('color' ,'rgba(0,0,0,.54)')
//
//	}
//
//}

//6. 캠페인 참여 링크 -> 링크 입력
function campainLinkLoc() {
	//입력값 없을시 경고
	if ($('#campainLinkLoc').val() == "") {
		$('#campainLinkLoc_alert').html('* 링크를 입력해 주세요.');
		$('#campainLinkLoc_alert').css('color', 'red');
	}
	else {
		$('#campainLinkLoc_alert').html("");
		$('#campainLinkLoc_alert').css('color' ,'rgba(0,0,0,.54)');
		$('#campainLinkLoc_alert').html("링크가 확인되었습니다.");
		$('#campainLinkLoc_alert').css('color', '#1a73e8');
	}

}

//
/*$(":input:radio[name=cam_pay]").change(function(){
	if($(":input:radio[name=cam_pay]:checked").val() == '시급'){
		$(".campain_pay2 .pay_textbox, .campain_pay2 .pay_textboxAfter").remove();
		$(".campain_pay1").append('<input type="text" placeholder="0" id="time_money" class="pay_textbox"><span class="pay_textboxAfter">원 이상</span>');
	}
	else {
		$(".campain_pay1 .pay_textbox, .campain_pay1 .pay_textboxAfter").remove();
		$(".campain_pay2").append('<input type="text" placeholder="0" id="full_money" class="pay_textbox"><span class="pay_textboxAfter">원 이상</span>');
	}
})
*/
$(document).ready(function(){
    
    var select = $("select#color");
    
    select.change(function(){
        var select_name = $(this).children("option:selected").text();
        $(this).siblings("label").text(select_name);
    });
});


function addFile(){
//	console.log(fileNum); // 4
	if(fileNum < 5 ){
		fileNum++;
//		console.log(fileNum); //5
		$('#customFile'+(fileNum-1)).after('<div id="customFile'+fileNum+
				'" ><i class="far fa-file-image"style="font-size:24px"></i><input type="file" accept="image/jpg,image/png,image/jpeg,image/gif" id="profile_img_upload" name="profile_img_upload'+fileNum+'" /></i><i class="fa-sharp fa-solid fa-plus" style="font-size:24px" onclick="addFile()"></i><i class="fa fa-close" style="font-size:24px" onclick="deleteFile('+fileNum+
				')"></i></div>');
	}
	
	for(i = 0; i<= 5; i++){
		if(i == fileNum){
			//$("#customFile"+fileNum + "#profile_img_upload").after('<i class="fa-sharp fa-solid fa-plus" style="font-size:24px" onclick="addFile()"></i>');
			var l = $("#customFile"+i).children('.fa-sharp.fa-solid.fa-plus').css('display', 'block'); //.far.fa-file-image
		}
		else {
			var l = $("#customFile"+i).children('.fa-sharp.fa-solid.fa-plus').css('display', 'none'); 

		}
	}
	
	
	
}

function existFileChange(input, index){
	console.log(input);
	console.log(index);
	if (input.files && input.files[0]) {
		console.log("바뀜");
		if(!existingFile.includes($('#existingFile' + index).text()) && $('#existingFile' + index).text() != ''){
			existingFile.push($('#existingFile' + index).text());
			$('#existingFile' + index).hide();
			console.log(existingFile);
		}
	}
}

function deleteFile(f){
//	if($('#existingFile' + f).text());
	if($('#existingFile' + f).length){ // 기존의 있던 파일이 있는 ui를 삭제할 경우
		console.log("hi");
		if(!existingFile.includes($('#existingFile' + f).text())){ // 변경하지 않고 기존파일을 삭제했을때
			console.log("hi");
			existingFile.push($('#existingFile' + f).text());
			console.log($('#existingFile' + f).text());
			console.log(existingFile);
		}
	}
//	console.log(f);
	$("#customFile" +f).addClass("sel"); // 걍 구분용 같음
	
	for(var i =0; i<6; i++){
		if($("#customFile" + i).hasClass("sel") == true){
			$("#customFile" + i).remove();
			fileNum --;
			console.log(i); // i = 0
			for(i; i<=5; i++){
				var j = i+1; // j = 1
				$("#customFile" + j).addClass('temp');
				$('#existingFile' + j).addClass('temp2');
				$('input[name=profile_img_upload' + j + ']').addClass('temp3');
				$('input[name=profile_img_upload' + j + ']').attr('name', 'profile_img_upload' + i);
				$("#customFile" + j).removeAttr('id');
				$("#existingFile" + j).removeAttr('id');
				$('.temp3').removeAttr('onchange');
				$('.temp3').attr("onchange", "existFileChange(this, " + i + ")");
				var newID = 'customFile' + i; // 어느것이 지워질지 모르니 처음부터 다시 id를 설정함
				var newExistFileID = 'existingFile' + i;
				$(".temp").attr('id', newID);
				$(".temp2").attr('id', newExistFileID);
				$(".temp").children('.fa.fa-close').attr('onclick', "deleteFile(" + i + ")");
				//$(".temp").attr('onclick', "deleteFile(" + i + ")")
				$(".temp").removeClass('temp');
				$(".temp2").removeClass('temp2');
				$(".temp3").removeClass('temp3');
			}
		}
	}
	var l = $("#customFile" + fileNum).children('.fa-sharp.fa-solid.fa-plus').css('display', 'block'); //.far.fa-file-image
}

//function deleteExistingFile(i){
//	console.log(i);
//	console.log($('#existingFile' + i).text());
//	existingFile[i] = $('#existingFile' + i).text();
//	console.log(existingFile);
//}

function delete_exist_file(){
	
	
	if(existingFile.length != 0){
		let file = Object.assign({}, existingFile);

		console.log(file);
		
		$.ajax({
			url : '/main/modify/ajax/deleteExistFile.do',
			data : file,
			dataType : 'json',
			contentType : "application/json; charset=utf-8",
			async : false,
			type : 'GET',
			success : function(data) {
				console.log("업뎃 됨 개꿀");
				
			},
			error : function(request, status, error) {
				console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});
	}
}

function init(){
	$('#datePicker_start').datepicker({
		dateFormat: 'yy-mm-dd', //Input Display Format 변경
		dayNamesMin: ['일','월','화','수','목','금','토'],
		dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
		showOtherMonths: true, //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	    showMonthAfterYear:true, //년도 먼저 나오고, 뒤에 월 표시
	    changeYear: true, //콤보박스에서 년 선택 가능
	    changeMonth: true, //콤보박스에서 월 선택 가능   
	    beforeShow: function (input, inst) {
	        var rect = input.getBoundingClientRect();
	        setTimeout(function () {       	
		        inst.dpDiv.css({ top: rect.top - 8, left: rect.left + 222 });
	        }, 0);
	    }
		
	}).datepicker("setDate", "0");
	
	
	$('#datePicker_end').datepicker({
		dateFormat: 'yy-mm-dd', //Input Display Format 변경
		dayNamesMin: ['일','월','화','수','목','금','토'],
		dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
		showOtherMonths: true, //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	    showMonthAfterYear:true, //년도 먼저 나오고, 뒤에 월 표시
	    changeYear: true, //콤보박스에서 년 선택 가능
	    changeMonth: true, //콤보박스에서 월 선택 가능   
	    minDate: new Date($('#datePicker_start').val()),
	    beforeShow: function (input, inst) {
	        var rect = input.getBoundingClientRect();
	        setTimeout(function () {
		        inst.dpDiv.css({ top: rect.top - 8, left: rect.left + 222 });
	        }, 0);
	    }
	}).datepicker("setDate", $('#datePicker_start').val());
	
//	$('#datePicker_end').datepicker('option', { minDate: new Date($('#datePicker_start').val()),
//    });
//	$('#datePicker_start').datepicker('option', { maxDate: new Date($('#datePicker_end').val()),
//    });
				
	$('#datePicker_start').change(function(){
		$('#datePicker_end').datepicker('option', { minDate: new Date($('#datePicker_start').val()),
	         });
		calenderWeekCal();
	
	});
	
	$('#datePicker_end').change(function(){
		$('#datePicker_start').datepicker('option', { maxDate: new Date($('#datePicker_end').val()),
	    });
		calenderWeekCal();

	});
}
/*
$('#datePicker_start').focus(function(){
	$('#ui-datepicker-div').remove();
	$('#datePicker_start').datepicker({
		dateFormat: 'yy-mm-dd', //Input Display Format 변경
		dayNamesMin: ['일','월','화','수','목','금','토'],
		dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
		showOtherMonths: true, //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	    showMonthAfterYear:true, //년도 먼저 나오고, 뒤에 월 표시
	    changeYear: true, //콤보박스에서 년 선택 가능
	    changeMonth: true, //콤보박스에서 월 선택 가능   
	    beforeShow: function (input, inst) {
	        var rect = input.getBoundingClientRect();
	        setTimeout(function () {       	
		        inst.dpDiv.css({ top: rect.top - 8, left: rect.left + 222 });
	        }, 0);
	    }
		
	}).datepicker("setDate", "0");

	
})*/
	
function f_datepicker(obj) {
	//console.log(obj);
	
	var tr = $(obj).parent().parent();
	var td = tr.children();
	//console.log(td.eq(1).text().replace(/ /g, "").replace("~",""));
	
	var stringArr = td.eq(1).text().replace(/ /g, "").split('~');
	//console.log(stringArr);
	
	if(stringArr == ''){
		tr = tr.prev();
		td = tr.children();
		
		stringArr = td.eq(1).text().replace(/ /g, "").split('~');
		//console.log(stringArr);
	}
	
	//$('#ui-datepicker-div').remove();
	 $( obj ).datepicker({
			dateFormat: 'yy-mm-dd', //Input Display Format 변경
			dayNamesMin: ['일','월','화','수','목','금','토'],
			dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
			showOtherMonths: true, //빈 공간에 현재월의 앞뒤월의 날짜를 표시
		    showMonthAfterYear:true, //년도 먼저 나오고, 뒤에 월 표시
		    changeYear: true, //콤보박스에서 년 선택 가능
		    changeMonth: true, //콤보박스에서 월 선택 가능   
		    minDate: new Date(stringArr[0]),
		    maxDate: new Date(stringArr[1]),
		    beforeShow: function (input, inst) {
		        var rect = input.getBoundingClientRect();
		        setTimeout(function () {
			        inst.dpDiv.css({ top: rect.top - 8, left: rect.left + 225 });
		        }, 0);
		    },
		    onSelect:function(dateText, inst) {            
//		    	console.log(dateText); // 잘 찍힘        
		    	}
	}).datepicker("show");
	
}

function m_datepicker(obj){
	//console.log($(obj).attr("id"));
	
	if($(obj).attr("id") == "datePicker_start"){ // 시작일을 선택한 경우
	
		$(obj).datepicker({
			dateFormat: 'yy-mm-dd', //Input Display Format 변경
			dayNamesMin: ['일','월','화','수','목','금','토'],
			dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
			showOtherMonths: true, //빈 공간에 현재월의 앞뒤월의 날짜를 표시
		    showMonthAfterYear:true, //년도 먼저 나오고, 뒤에 월 표시
		    changeYear: true, //콤보박스에서 년 선택 가능
		    changeMonth: true, //콤보박스에서 월 선택 가능   
		    beforeShow: function (input, inst) {
		        var rect = input.getBoundingClientRect();
		        setTimeout(function () {       	
			        inst.dpDiv.css({ top: rect.top - 8, left: rect.left + 222 });
		        }, 0);
		    },
		    onSelect:function(dateText, inst) {            
//		    	console.log(dateText);        
		    	calenderWeekCal();
		    	}
			
		}).datepicker("show");
	}
	else { // 종료일을 시작한경우
		//console.log($('#datePicker_start').val());
		
		$(obj).datepicker({
			dateFormat: 'yy-mm-dd', //Input Display Format 변경
			dayNamesMin: ['일','월','화','수','목','금','토'],
			dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
			showOtherMonths: true, //빈 공간에 현재월의 앞뒤월의 날짜를 표시
		    showMonthAfterYear:true, //년도 먼저 나오고, 뒤에 월 표시
		    changeYear: true, //콤보박스에서 년 선택 가능
		    changeMonth: true, //콤보박스에서 월 선택 가능   
		    minDate: new Date($('#datePicker_start').val()),
		    beforeShow: function (input, inst) {
		    	$(obj).datepicker( "option", "minDate", new Date($('#datePicker_start').val()) );
		        var rect = input.getBoundingClientRect();
		        setTimeout(function () {
			        inst.dpDiv.css({ top: rect.top - 8, left: rect.left + 222 });
		        }, 0);
		    },
		    onSelect:function(dateText, inst) {           
		    	//console.log(dateText);        
		    	calenderWeekCal();
		    	}
		}).datepicker("show");
		
	}
}

function calenderWeek(){ // 디비전용 함수
		day =  stDate.getDay();
	
		var jucha = 1;
		$("#calenderTbody").children().remove();

		while (stDate <= edDate) {

			var sunday = new Date(stDate);
			sunday.setDate(stDate.getDate() + 6);

			if (sunday >= edDate) {
				sunday = edDate;
			}
			
			var datePickerSt = stDate.toISOString().substr(0, 10);
			
			var tbody = "<tr>"
					+ "<td id='weekOf'>"
					+ jucha
					+ "주차</td>"
					+ "<td id='stDate'>"
					+ stDate.toISOString().substr(0, 10) + " ~ " 
					+ "<td id='selDate'>"
					+ "<input id ='selectDate"+jucha+"' class='selectDate' type='text' name='selectDate' onclick='javascript:f_datepicker(this);'/>"
					+ "</td>"
					+ "</td>"
					+ "<td id='calenderStartHour'>"
					+ "<input id ='calenderHour' type='text'/>"
					+ "</td>"
					+ "<td id='calenderText'><input id ='calenderInput' type='text'/>" 
					+ "<i class='fa-solid fa-plus' id='plus" + jucha + "' onclick = 'addCalenderDate(this);'></i>"
					+"</td>"
					+ "</tr>";
			

			var startDate = stDate.getDate();
			// 주차
			var calcDate = stDate.getDate() - day + ((day == 0 ? 1 : 8) + 0);

			var nextDate;
			
			// 월요일 날짜구하기
			if(jucha == 1){
				nextDate = new Date(stDate.setDate(calcDate));
			}
			else{
				nextDate = new Date(stDate.setDate(stDate.getDate()+7));
			}
			$("#calenderTbody").append(tbody);
		
			nextDate.setDate(nextDate.getDate()-1);
			
			
			document.querySelectorAll('#stDate').forEach(function(list, index){
				
				if(index+1 == jucha){
					list.append(nextDate.toISOString().substr(0, 10));
				}
				
			});
			nextDate.setDate(nextDate.getDate()+1);

			stDate = nextDate;
			jucha++;
		}
}

function calenderWeekCal(){ // 테이블 생성 함수
	stDate = new Date($('#datePicker_start').val());
	edDate = new Date($('#datePicker_end').val());
	console.log("sdDate: " + stDate);
	console.log("edDate: " + edDate);
	day =  stDate.getDay();
	
		var jucha = 1;
		$("#calenderTbody").children().remove();

		while (stDate <= edDate) {

			var sunday = new Date(stDate);
			sunday.setDate(stDate.getDate() + 6);

			if (sunday >= edDate) {
				sunday = edDate;
			}
			
			var datePickerSt = stDate.toISOString().substr(0, 10);
			
			var tbody = "<tr>"
					+ "<td id='weekOf'>"
					+ jucha
					+ "주차</td>"
					+ "<td id='stDate'>"
					+ stDate.toISOString().substr(0, 10) + " ~ " 
					+ "<td id='selDate'>"
					+ "<input id ='selectDate"+jucha+"' class='selectDate' type='text' name='selectDate' onclick='javascript:f_datepicker(this);'/>"
					+ "</td>"
					+ "</td>"
					+ "<td id='calenderStartHour'>"
					+ "<input id ='calenderHour' type='text'/>"
					+ "</td>"
					+ "<td id='calenderText'><input id ='calenderInput' type='text'/>" 
					+ "<i class='fa-solid fa-plus' onclick = 'addCalenderDate(this);'></i>"
					+"</td>"
					+ "</tr>";
			

			var startDate = stDate.getDate();
			// 주차
			var calcDate = stDate.getDate() - day + ((day == 0 ? 1 : 8) + 0);

			var nextDate;
			
			// 월요일 날짜구하기
			if(jucha == 1){
				nextDate = new Date(stDate.setDate(calcDate));
			}
			else{
				nextDate = new Date(stDate.setDate(stDate.getDate()+7));
			}
			$("#calenderTbody").append(tbody);
		
			nextDate.setDate(nextDate.getDate()-1);
			
			
			document.querySelectorAll('#stDate').forEach(function(list, index){
				
				if(index+1 == jucha){
					list.append(nextDate.toISOString().substr(0, 10));
				}
				
			});
			nextDate.setDate(nextDate.getDate()+1);

			stDate = nextDate;
			jucha++;
		}
	
}

$("input[name='calender_date']:radio").change(function () {

	if(this.value == 'week'){
		$('#selectPeriod').html('주차');
		$("#calenderTbody").children().remove();
	}
	else if(this.value == '5days'){
		$('#selectPeriod').html('5일');
		$("#calenderTbody").children().remove();
	}
	
});

//const d_num;
function addCalenderDate(t){ // 일별 일정
	var n = $(t).parent().parent('tr');
	var tr;
	if($(t).parent().parent('tr').next().find('input[name=selectDate]').length || $(t).parent().parent('tr').next().length == 0){
		// 주차의 tr이 일별 일정 tr을 하나도 가지고 있지 않을경우 또는 마지막 주차의 tr일 경우
		tr = $(t).parent().parent('tr')[0];
	}else{ // 주차의 tr에 일별 일정 tr을 하나라도 가지고 있는 경우 + 주차의 마지막 tr인 경우
		while(n.next().find('input[name=selectDate]').length != 1 && n.next().length !=0 ){
			n = n.next();
		}
		tr = n;
		console.log(tr);
	}
	
	
	var append_tr = "<tr>"
		+ "<td></td>"
		+ "<td></td>"
		+ "<td id='selDate'>" 
		+ "<input id ='addDate"+d_num+"' class='addDate' type='text' onclick='javascript:f_datepicker(this);'/>"
		+ "</td>"
		+ "<td id='calenderStartHour'>"
		+ "<input id ='calenderHour' type='text'/>"
		+ "</td>"
		+ "<td id='calenderText'><input id ='calenderInput' type='text'/>" 
		+ "<i class='fa-solid fa-minus' onclick='removeCalenderDate(this);'></i>"
		+ "</td>"
		+ "</tr>";
	
	
	$(tr).after(append_tr);
	d_num++;
	
}

function removeCalenderDate(t){
	
	var tr = $(t).parent().parent('tr')[0];
	$(tr).remove();
	
}

const inputFullMoney = document.querySelector('#full_money');
inputFullMoney.addEventListener('keyup', function(e) {
	let value = e.target.value;   
	value = Number(value.replaceAll(',', ''));
	if (isNaN(value)) { // NaN인지 판별
		input.value = 0;
	} else { // NaN이 아닌 경우
		const formatValue = value.toLocaleString('ko-KR');
		inputFullMoney.value = formatValue;
	}
})

//파일 미리보기
function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('pre_pic').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('pre_pic').src = "";
	  }
	}


function cpn_submit(){
	var c_id = $('#campaignId').val();
	var selBtn = new Array();
	
	var category = $('.bttn_inner').children('.selected').each(function(){
		
		selBtn.push($(this).val());
	});
	
	
	
	var selLength = selBtn.length;
	
	var c_nm = $('#campainSetName').val();
	var c_img = null; //파일인데 아직 못함
	var c_mbr = $('#campain_personnel').val();
	
	var c_inter;
	
	var svc_nm = null;
	var svc_link = null;
	
	if($(":input:radio[name=inter]:checked").val() == '대면'){
		c_inter = 1;
	}
	else if($(":input:radio[name=inter]:checked").val() == '비대면'){
		c_inter = 2;
		svc_nm  = $("#color option:selected").val();

		svc_link = $('#campainLinkLoc').val();
		lon_x = 0;
		lat_y = 0;
	}
	

	
	//var svc_nm = $('#color').val();
	
	
	//datepicker 날짜 가져오기
	var st_date = $('#datePicker_start').val();
	var ed_date = $('#datePicker_end').val();
	
	
	
	
	var estimate;
	
		estimate = $('#full_money').val().replaceAll(',', '');
	

	var c_exp = $('.regi').val();
	var c_st = 1;
	
	//sample campagin calender data
	var calender = [];
	
	var c_weekTemp;
	var weekOf;
	var c_date;
	$('#calenderTbody tr').each(function() {
		
		var newCalender = {
				calender: $(this).find('#calenderText').find("#calenderInput").val(),
				c_week: $(this).find("#stDate").html(),
				c_date: $(this).find("#selDate").find(".selectDate").val(),
				st_hour: $(this).find('#calenderStartHour').find("#calenderHour").val(),
				weekOf: ($(this).find("#weekOf").html()+"").substr(0,1),
		};
		if(newCalender.c_date == undefined ){
			newCalender.c_date = $(this).find("#selDate").find(".addDate").val();
			console.log(newCalender.c_date);
		}
		if(newCalender.c_week != null && newCalender.weekOf != null){
			weekOf = ($(this).find("#weekOf").html()+"").substr(0,1);
			c_weekTemp = $(this).find("#stDate").html();
			
		}
		else{
			newCalender.c_week = c_weekTemp;
			newCalender.weekOf = weekOf;
		}
//		
//		
//		
//		
		calender.push(newCalender);
	 });
	console.log(calender);

	var data = {
			selBtn: JSON.stringify(selBtn),
			selLength: selLength,
			//u_id: u_id, // 임시데이터
			c_nm: c_nm,
			c_img: c_img,
			c_mbr: c_mbr,
			c_inter: c_inter,
			lon_x: lon_x,
			lat_y: lat_y,
			svc_nm: svc_nm,
			svc_link: svc_link,
			st_date: st_date,
			ed_date: ed_date,
			estimate: estimate,
			c_exp: c_exp,
			calender: JSON.stringify(calender),
			c_id: c_id,
		};

	$.ajax({
		url : '/main/modify/ajax/cpnSubmit.do',
		data : data,
		dataType : 'json',
		contentType : "application/json; charset=utf-8",
		async : false,
		type : 'GET',
		success : function(data) {
			console.log("업뎃 됨 개꿀");
			
		},
		error : function(request, status, error) {
			console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	});
	
	
	
}

function img_upload(){
	
	if($('.upload_btn')[0].files[0] == undefined){
		console.log("기존거 그대로, 업데이트 없음");
		return;
	}
	console.log("새로운 파일로 업데이트 완료");
	var form = new FormData($(".form0")[0]);
	console.log(form);
	form.append("cId", campaignId);
	console.log(form);
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";
	
	$.ajax({
	    url: "/main/modify/ajax/imgUpload.do",
	    type: "POST",
	    async: false,
	    data: new FormData($(".form0")[0]),
	    beforeSend: function(xhr) {
			xhr.setRequestHeader(header, token);
		},
	    enctype: 'multipart/form-data',
	    processData: false,
	    contentType: false,
	    cache: false,
	    success: function () {
	      console.log("suc");
	    },
	    error: function () {
	    	console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	    }
	  });
	
	
	
	
}


$(".formSubmit").on("click", function(){
	if(confirm("작성한 내용으로 수정하시겠습니까?")){
		cpn_submit();
		if($('.upload_btn')[0].files[0] != undefined){
			img_upload();
//			console.log("새로운 사진 업로드 할 때만 함수 호출");
		}
		delete_exist_file();
		$(".form1").submit();	
	}
	alert("성공적으로 수정되었습니다!");
});

//kakao api



var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
var marker = new kakao.maps.Marker({
	draggable: true,
});
infowindow = new kakao.maps.InfoWindow({});
    

mapOption = {
	center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	level : 3
// 지도의 확대 레벨
};

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption);

//map.setDraggable(true);    



var address;




function selectAddress(){
	//console.log('주소:' + $('#campainJoinArea').val());
	address = $('#campainJoinArea').val();
	
	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	//주소로 좌표를 검색합니다
	geocoder.addressSearch(address, function(result, status) {//제주특별자치도 제주시 첨단로 242

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        marker.setMap(map);
	        marker.setPosition(coords);
//	        console.log(result[0]);
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
//	        console.log(address);
//        	console.log(result[0].address.address_name);
        	if(address == result[0].address.address_name){
//        		console.log("지번");
	        	infowindow.setContent('<div id="enjoyMapPopup" style="text-align:center;padding:6px 0;">'+result[0].address.address_name+'</div>');
	        	infowindow.open(map, marker);
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
        	}
        	else{
		        if(result[0].road_address!=null){
		      
		        	if(address == result[0].road_address.address_name){
		//		        	console.log("불러온 도로명 이름이 같을때");
			        	infowindow.setContent('<div id="enjoyMapPopup" style="text-align:center;padding:6px 0;">'+result[0].road_address.address_name+'</div>');
			        	infowindow.open(map, marker);
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
		        	}else{
		//	        	console.log("도로명 검색했을때");
//		        		console.log("도로명");
			        	infowindow.setContent('<div id="enjoyMapPopup" style="text-align:center;padding:6px 0;">'+result[0].road_address.address_name+'</div>');
			        	infowindow.open(map, marker);
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
		        	}
		        }
		        else{
//		        	console.log("지번");
		        	infowindow.setContent('<div id="enjoyMapPopup" style="text-align:center;padding:6px 0;">'+result[0].address.address_name+'</div>');
		        	infowindow.open(map, marker);
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
		        }
        	}
	    } else{
	    	alert("주소를 정확히 입력해 주세요.");
	    } 
	     
	     
	     //console.log("좌표계" + coords);
	     lon_x = result[0].x;
	     lat_y = result[0].y;
	});    
}


kakao.maps.event.addListener(marker, 'dragstart', function() {
	infowindow.close();
});

kakao.maps.event.addListener(marker, 'dragend', function() {
		   
	var callback = function(result, status) {
		if (status === kakao.maps.services.Status.OK) {
			if(result[0].road_address != null){
				//console.log(result[0]);
				infowindow.open(map, marker);
				infowindow.setContent('<div id="enjoyMapPopup" style="text-align:center;padding:6px 0;">' + result[0].road_address.address_name+'</div>');	
				$('#campainJoinArea').val(result[0].road_address.address_name);
			}
			else{
				//console.log(result[0]);
				infowindow.open(map, marker);
				infowindow.setContent('<div id="enjoyMapPopup" style="text-align:center;padding:6px 0;">' + result[0].address.address_name + '</div>');	
				$('#campainJoinArea').val(result[0].address.address_name);
			}
		}
	};
	
	let coord = new kakao.maps.LatLng(marker.getPosition().Ma, marker.getPosition().La);
	
	var geocoder = new kakao.maps.services.Geocoder();
	geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);  
	
	//console.log("좌표계" + coord);
	lat_y = coord.getLat();
	lon_x = coord.getLng();
	//console.log("lon_X   " + lon_x + "    "  + "lat_y    " + lat_y)
	
});