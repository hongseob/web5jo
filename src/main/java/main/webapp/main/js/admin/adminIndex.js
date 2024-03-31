//캠페인 승인 페이지 / 캠페인 리스트 클릭시 오른쪽 정보 표출
function selectCampaginInfo(cId){
	
	var data = {cId: cId};
	
	$.ajax({
		url : '/admin/ajax/selectCampaignBoard.do',
		data : data,
		dataType : 'json',
		contentType : "application/json; charset=utf-8",
		async : false,
		type : 'GET',
		success : function(data) {
			
			//초기화
			$("#campaignCategory").html("");
			$("#campaignFile").html("");
			$("#campaignImg").attr("src", "");
			$("#cId").attr("value", "");
			
			//
			
			$("#cId").attr("value", data.list.cId);
			
			data.list.category.forEach(function(item, index){
				var category = '<a href="#" class="badge bg-primary me-1 my-1">'+item.category+'</a>'
				$("#campaignCategory").append(category);
			});
			
			(async () => {
				try {
					const result = await locToAddress(data.list.latY, data.list.lonX);
					
					$("#location").html(result);
				} catch (e) {
					
				}
			})();
			
			$("#campaignInfo").html(data.list.cExp);
			
			data.list.file.forEach(function(item, index){
				
				var File = '<li class="mb-1"><a href="'+'/admin/download/ajax/campaignDownloadFile.do?fileSvrName='+item.fileSvrName+'">'+item.fileOrgName+'</a></li>';
				$("#campaignFile").append(File);
			});

			const image = document.getElementById('campaignImg');
			image.src = "/imgpath/"+ data.list.img.fileSvrName;
			
		},
		error : function(request, status, error) {
			console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	});
	
}

//좌표 -> 주소 변환
function locToAddress(lonX, latY){
	var address;
	
	return new Promise((resolve, reject)=> {
		
		let coord = new kakao.maps.LatLng(lonX, latY);
		var geocoder = new kakao.maps.services.Geocoder();
		
		geocoder.coord2Address(coord.getLng(), coord.getLat(), function(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				if(result[0].road_address != null){
					address =  result[0].road_address.address_name;
					resolve(address);
				}
				else{
					address =  result[0].address.address_name;
					resolve(address);
				}
			}
		});
		
		
	});
}


//캠페인 승인
function approveCampaign(){
	
	
	
	if($('input[name=cId]').val() == undefined || $('input[name=cId]').val() == ''){
		alert("승인할 캠페인을 선택해 주세요");
		return;
	}
	
	if(!confirm("캠페인을 승인하시겠습니까?")){
		
	}
	else{
		
		var data = {cId: $('input[name=cId]').val()};
		
		$.ajax({
			url : '/admin/ajax/approveCampaign.do',
			data : data,
			dataType : 'json',
			contentType : "application/json; charset=utf-8",
			async : false,
			type : 'GET',
			success : function(data) {
				location.reload();
				
			},
			error : function(request, status, error) {
				console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});
		
	}
	
}


//캠페인 거절
function refuseCampaign(){
	
	
	
	
	if($('input[name=cId]').val() == undefined || $('input[name=cId]').val() == ''){
		alert("거절할 캠페인을 선택해 주세요");
		return;
	}
	
	
	if(!confirm("캠페인을 거절하시겠습니까?")){
		
	}
	else{
		var data = {cId: $('input[name=cId]').val()};
		
		$.ajax({
			url : '/admin/ajax/refuseCampaign.do',
			data : data,
			dataType : 'json',
			contentType : "application/json; charset=utf-8",
			async : false,
			type : 'GET',
			success : function(data) {
				location.reload();
				
			},
			error : function(request, status, error) {
				console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});
		
		
	}
}

//캠페인 삭제
function deleteCampaign(){
	
	
	
	
	if($('input[name=cId]').val() == undefined || $('input[name=cId]').val() == ''){
		alert("삭제할 캠페인을 선택해 주세요");
		return;
	}
	
	
	if(!confirm("캠페인을 삭제하시겠습니까?")){
		
	}
	else{
		var data = {cId: $('input[name=cId]').val()};
		
		$.ajax({
			url : '/admin/ajax/deleteCampaign.do',
			data : data,
			dataType : 'json',
			contentType : "application/json; charset=utf-8",
			async : false,
			type : 'GET',
			success : function(data) {
				location.reload();
				
			},
			error : function(request, status, error) {
				console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});
		
		
	}
}
//유져관리에서 인증신청한 사용자 클릭시 우측 정보 표출
function selectApproveMemberInfo(id){
	
var data = {id: id};
	
	$.ajax({
		url : '/admin/ajax/selectApplyMemberBoard.do',
		data : data,
		dataType : 'json',
		contentType : "application/json; charset=utf-8",
		async : false,
		type : 'GET',
		success : function(data) {
			
			//초기화
			$("#campaignCategory").html("");
			$("#campaignFile").html("");
			$("#userName").html("");
			$("#mId").attr("value", "");
			$("#location").html("");
			$("#campaignInfo").html("");
			
			//
			
			
			$("#userName").append("<div>" + data.list.uNm + "<div>");
			$("#userName").append("<div>" + data.list.job + "</div>");
			$("#location").append(data.list.uAddr);
			
			
//			
			$("#mId").attr("value", data.list.id);
			data.list.category.forEach(function(item, index){
			var category = '<a href="#" class="badge bg-primary me-1 my-1">'+item.category+'</a>'
			$("#campaignCategory").append(category);
			});
			
			$("#campaignInfo").append("<div>" + data.list.information + "</div>");
			
			//파일
			data.list.file.forEach(function(item, index){
	
				var File = '<li class="mb-1"><a href="'+'/admin/download/ajax/campaignDownload.do?fileSvrName='+item.fileSvrName+'">'+item.fileOrgName+'</a></li>';
				$("#campaignFile").append(File);
			});

		},
		error : function(request, status, error) {
			console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	});
	
	
	
	
}
//유저관리에서 인증된 사용자 클릭시 우측 정보 표출
function selectMemberInfo(id){
	
	var data = {id: id};
	
	$.ajax({
		url : '/admin/ajax/selectMemberBoard.do',
		data : data,
		dataType : 'json',
		contentType : "application/json; charset=utf-8",
		async : false,
		type : 'GET',
		success : function(data) {
			
			
			//초기화
			$("#campaignCategory").html("");
			$("#campaignFile").html("");
			$("#userName").html("");
			$("#mId").attr("value", "");
			$("#location").html("");
			$("#campaignInfo").html("");
			
			//
			$("#userName").append("<div>" + data.list.uNm + "<div>");
			$("#userName").append("<div>" + data.list.cNm + "</div>");
			$("#location").append(data.list.uAddr);
			
			data.list.category.forEach(function(item, index){
				var category = '<a href="#" class="badge bg-primary me-1 my-1">'+item.category+'</a>'
				$("#campaignCategory").append(category);
			});

			$("#mId").attr("value", data.list.id);
			data.list.file.forEach(function(item, index){
			
				var File = '<li class="mb-1"><a href="'+'/admin/download/ajax/campaignDownload.do?fileSvrName='+item.fileSvrName+'">'+item.fileOrgName+'</a></li>';
				$("#campaignFile").append(File);
			});
//
//			const image = document.getElementById('campaignImg');
//			image.src = "/filepath/"+ data.list.img.fileSvrName;*/
			
		},
		error : function(request, status, error) {
			console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	});
	
	
	
}

//일반사용자 승인 -> 인증된 사용자
function approveMember(){
	
	
	
	
	if($('input[name=mId]').val() == undefined || $('input[name=mId]').val() == ''){
		alert("승인할 유저를 선택해 주세요");
		return;
	}
	
	if(!confirm("인증된 사용자로 변경하시겠습니까?")){
		
	}
	else{
		
		var data = {mId: $('input[name=mId]').val()};
		
		$.ajax({
			url : '/admin/ajax/approveMember.do',
			data : data,
			dataType : 'json',
			contentType : "application/json; charset=utf-8",
			async : false,
			type : 'GET',
			success : function(data) {
				location.reload();
				
			},
			error : function(request, status, error) {
				console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});
		
	}
	
	
	
}


//인증된 사용자 -> 일반 사용자 변경
function approveNormalMember(mId){
	
	
	
	
	if($('input[name=mId]').val() == undefined || $('input[name=mId]').val() == ''){
		alert("승인할 유저를 선택해 주세요");
		return;
	}
	
	if(!confirm("일반 사용자로 변경하시겠습니까?")){
		
	}
	else{
		
		var data = {mId: $('input[name=mId]').val()};
		
		$.ajax({
			url : '/admin/ajax/approveNormalMember.do',
			data : data,
			dataType : 'json',
			contentType : "application/json; charset=utf-8",
			async : false,
			type : 'GET',
			success : function(data) {
				location.reload();
				
			},
			error : function(request, status, error) {
				console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});
		
	}
	
}






