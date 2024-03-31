window.onload = init; // 로드와 함께 init 함수 호출 

var end = 0;

function init() {
	logList_ajax(1);
}

function logList_ajax(i) {

	var pageNum = i;

	var loglist = new Array();

	//ajax 전송에 필요한 데이터 
	var data = {
		pageNum: pageNum,
	}

    if(end == 0){
	//ajax 전송
	$.ajax({
		url: '/admin/ajax/schedulerLogList.do',
		data: data,
		dataType: 'json',
		contentType: "application/json; charset=utf-8",
		async: false,
		type: 'GET',
		success: function(data) {
			loglist = data
			if(loglist.length==0){
				end=1;
				alert("마지막 로그입니다.");
			}
			plus_loglist(loglist);

		},
		error: function(request, status, error) {
			console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	});
	
	}
	else{
		alert("마지막 로그입니다.");
	}
}

function plus_loglist(list) {

	var $logbox = $(".logbox");

	for (let i = 0; i < list.length; i++) {

		if (list[i].updateFail == 0) {
			var html = '<div class="loglist">업데이트 일자 : ' + list[i].date + ' 성공 : ' + list[i].updateSuccess + ' 	실패 : ' + list[i].updateFail + ' 정상 처리되었습니다.</div>';
		}
		else {

			var html = '<div class="loglist_error">업데이트 일자 : ' + list[i].date + ' 성공 : ' + list[i].updateSuccess + ' 	실패 : ' + list[i].updateFail + ' 오류 발생 .</div>';
		}

		$logbox.append(html);
	}

}

var pagenum = 1;

$(document).ready(function() {


	//스크롤 발생 이벤트 처리
	$('.logbox').scroll(function() {
		
	    var scrollTop = $(this).scrollTop();
        var innerHeight = $(this).innerHeight();
        var scrollHeight = $(this).prop('scrollHeight');
		
	    if (scrollTop + innerHeight >= scrollHeight) {
		pagenum = pagenum + 1;
		logList_ajax(pagenum);
        } 
	});
});