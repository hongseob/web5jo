

var min;
var max;

function calMinMax(){
	document.querySelectorAll("#chatData").forEach(function(e, i){

		if(i == 0){
			min = $(e).attr('data-no'); 
		}
		else{
			max = $(e).attr('data-no');
		}
	});
	console.log(min, max);
	
	return [min, max];
}

$(function() {
	
	//채팅창 맨 아래로 .. 나중에 안읽은거부터 표시?할듯싶은데
	//var bottom = $('#scrollBox').height() /2;
	
	//안읽은 메세지 중에 부모까지의 거리 계산할거임 그렇게해서 시작은 그걸로
	var alarmNum = $('input[name=alarmNum]').val();
	//$('#scrollBox').scrollTop($('#scrollBox').prop('scrollHeight'));
	
	document.querySelectorAll("#chatData").forEach(function(e, i){

		if(i == 0){
			min = $(e).attr('data-no'); //최소 num 저장
		}
		else{
			max = $(e).attr('data-no');
		}
		
		if( $(e).attr('data-no') == alarmNum){
			console.log($(e).position().top);
			$('#scrollBox').scrollTop($(e).position().top);
			//$('#scrollBox').scrollTop($('#scrollBox').prop('scrollHeight'));
		}
		//var relativeTop = getAbsoluteTop(e) - getAbsoluteTop($(e).parent());
	});
			
	console.log(min,max); //현재 있는 min max값
	
	//답변 입력시 button style
	$("#alarm_context").on("propertychange change keyup paste input", function(){
		
		console.log("11");
		
		if($("#alarm_context").val() != ''){
			
			console.log("22");
			
			$("#alarmSubmitBtn").css("background-color", "#fcb92c");
			$("#alarmSubmitBtn").css("border-color", "#fcb92c");
			$("#alarmSubmitBtn").css("color", "#fff");
			
		} else {
			
			$("#alarmSubmitBtn").css("background-color", "#f2f2f2");
			$("#alarmSubmitBtn").css("border-color", "#f2f2f2");
			$("#alarmSubmitBtn").css("color", "#c1c6d1");
			
		}
	});
});


function alarmAnswer(t){
	
	var email;
	var title;
	var id;
	var contents;
	var writeDate;

	console.log($(t).parent().children('div').children('strong'));

	email = $(t).parent().parent().children('span').html();
	title = $(t).parent().children('div').children('strong').html();
	id = $(t).parent().parent().attr('inqure-no');
	
	console.log(id);
	
	console.log(email, title, id);
	
	//수신자 및 제목 설정
	$('#alarm_email').html(email);
	$('#alarm_title').html(title);
	
	$('input[name=alarm_pk]').val('');
	$('input[name=alarm_pk]').val(id);
}


function alarm_submit(){
	
	if($('#alarm_email').html() == '' || $('#alarm_title').html() == ''){
		alert('수신 메세지를 선택해 주세요.');
		return;
	}
	
	const email = $('#alarm_email').html();
	const title = "[수신]: " + $('#alarm_title').html(); //답변은 제목 같은걸로 갈까...?
	const context = $('#alarm_context').val();
	const id = $('input[name=alarm_pk]').val();
	if(context == ''){
		alert('답변을 입력해 주세요.');
	}
	
	console.log(email, title, context, id);
	
	//ajax
	data = {
			email: email,
			title: title,
			context: context,
			id: id
			}
	
	$.ajax({
		url : '/admin/ajax/alarmSubmit.do',
		data : data,
		dataType : 'json',
		contentType : "application/json; charset=utf-8",
		async : false,
		type : 'GET',
		success : function(data) {
			//답변창 초기화
			$("#alarm_email").html('');
			$("#alarm_title").html('');
			$("#alarm_context").val('');
			
			//location.reload(); // -> 이거 나중에 ajax로 메세지 그리도록 할거임
			var calMax = calMinMax();
			dataNo = calMax[1];
			
			var adminMsg =  '<div id="chatData" class="d-flex align-items-start adminMsg" data-no="'+ (parseInt(dataNo)+1) +'">'	
								+'<div class="flex-grow-1">'
									//+'<small class="text-navy adminMsgTime">30m ago</small>'
									//+'<small class="text-navy adminMsgTime">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</small>';
									+'<strong>'+title+'</strong>'
									+'<br />'
									+'<div class="border text-sm text-muted p-2 mt-1 bollonA">'
										+context
									+'</div>'
								+'</div>'
							+'</div>';

			$('#scrollBox').append(adminMsg); 
			
			//$('#scrollBox').scrollTop($('#scrollBox').prop('scrollHeight'));
			


		},
		error : function(request, status, error) {
			console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	});
	
}



//이전 스크롤 좌표
var lastScrollTop = 0;

//채팅창 스크롤
$('#scrollBox').scroll(function(){
	
	//console.log($('#scrollBox').scrollTop());
	//console.log($('#scrollBox').height() /2);
	
	
	//현재 스크롤 좌표
	var currentScrollTop = $('#scrollBox').scrollTop();
	//다운 스크롤
	if(currentScrollTop - lastScrollTop > 0){
		//현재 스크롤 좌표를 이전 스크롤 좌표로 할당
		lastScrollTop = currentScrollTop;
		//console.log("down");
		//console.log(min, max);
		
		//console.log($(document).height(), $('#scrollBox').height(), $('#scrollBox').scrollTop());
		/*if($('#scrollBox').scrollTop() == $('#scrollBox').prop('scrollHeight')){
			console.log("제일하단");
		}*/
		if(Math.ceil($('#scrollBox').scrollTop() + $('#scrollBox').height()) >= $('#scrollBox').prop('scrollHeight')-1) {

			calMinMax();
			min = Number(max) + 1;
			max = Number(min) + 30;
			
			
			
			
			data = {
					min: min,
					max: max,
					sender: $('input[name=sender]').val(),
					email : $('input[name=email]').val(),
					}
			console.log(min, max);
			//ajax   
			$.ajax({
				url : '/admin/ajax/alarmScroll.do',
				data : data,
				dataType : 'json',
				contentType : "application/json; charset=utf-8",
				async : false,
				type : 'GET',
				success : function(data) {
					
					console.log(data);
					//여기서 채팅방 append
					
					data.alarm.forEach(function(e, i){
						if(e.email == 'admin'){
							var userMsg = '<div id="chatData" class="align-items-start userMsg" data-no="'+e.num+'" inqure-no="'+e.inqureId+'">'
							+'<img src="/images/egovframework/main/profile.png" width="36" height="36" class="rounded-circle me-2" alt="Vanessa Tucker">'
							+'<span>'+e.uId+'</span>'
							+'<div class="flex-grow-1">'
								+'<div class="border text-sm text-muted p-2 mt-1 bollon">'
								+'<strong>'+e.title+'</strong><br/><br/>'
								+ e.contents
								+'</div>'
								//+'<small class="text-navy userMsgTime">30m ago</small>';
								+'<small class="text-navy userMsgTime">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</small>';
								
								console.log(e.status);
								if(e.status == '1'){
									userMsg = userMsg 
										+'<a id="answerBtn" href="#" class="btn btn-sm btn-danger mt-1" onclick="alarmAnswer(this);">'
										+'답변'
										+'</a>';
								}
								else if(e.status == '2' || e.status == '4' || e.status == '5'){ //user 에게 답변 or user가 삭제한거
									userMsg = userMsg
										+'<a id="reAnswerBtn" href="#" class="btn btn-sm btn-success mt-1" onclick="alarmAnswer(this);">'
										+'재답변'
										+'</a>';
								}
								userMsg = userMsg 			
							+'</div>'
						+'</div>';
							

							$('#scrollBox').append(userMsg); 
						}
						else if(e.email != 'admin'){
							var adminMsg = '<div id="chatData" class="d-flex align-items-start adminMsg" data-no="'+e.num+'">'	
							+'<div class="flex-grow-1">'
								//+'<small class="text-navy adminMsgTime">30m ago</small>'
								+'<strong>'+e.title+'</strong>'
								+'<br />'
								+'<div class="border text-sm text-muted p-2 mt-1 bollonA">'
									+e.contents
								+'</div>'
							+'</div>'
						+'</div>';
		
							$('#scrollBox').append(adminMsg); 
						}
					});
				},
				error : function(request, status, error) {
					console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			});
			
			
		}
	}
	//업스크롤
	else {
		// 현재 스크롤 좌표레ㅡㄹ 이전 스크롤 좌표로 할등
		lastScrollTop = currentScrollTop;
		console.log("up");
		//제일 위에 닿았을때 페이징
		if($('#scrollBox').scrollTop() == 0){
	
			calMinMax();
			
			max = min - 1;
			if(min - 30 <= 0){
				min = 1;
			}
			console.log(min,max); //현재 있는 min max값
			
			if(max >= 1){  //max 가 1이상일때
				data = {
						min: min,
						max: max,
						sender: $('input[name=sender]').val(),
						email : $('input[name=email]').val(),
						}
				//ajax    
				$.ajax({
					url : '/admin/ajax/alarmScroll.do',
					data : data,
					dataType : 'json',
					contentType : "application/json; charset=utf-8",
					async : false,
					type : 'GET',
					success : function(data) {
						
						
						var svg = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-corner-down-right feather-sm">'
									+ '<polyline points="15 10 20 15 15 20"></polyline>'
									+ '<path d="M4 4v7a4 4 0 0 0 4 4h12"></path>'
									+ '</svg>'
						console.log(data);
						//여기서 채팅방 append
						
						data.alarm.reverse().forEach(function(e, i){
							if(e.email == 'admin'){ //사용자가 보낸 메세지
								var userMsg = '<div id="chatData" class="align-items-start userMsg" data-no="'+e.num+'">'
								+'<img src="/images/egovframework/main/profile.png" width="36" height="36" class="rounded-circle me-2" alt="Vanessa Tucker">'
								+'<span>'+e.uId+'</span>'
								+'<div class="flex-grow-1">'
									+'<div class="border text-sm text-muted p-2 mt-1 bollon">'
										+'<strong>'+e.title+'</strong><br/><br/>'
										+ e.contents
									+'</div>'
									//+' <small class="text-navy userMsgTime">30m ago</small>';
									+'<small class="text-navy userMsgTime">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</small>';
									console.log(e.status);
									if(e.status == '1'){
										userMsg = userMsg 
											+'<a id="answerBtn" href="#" class="btn btn-sm btn-danger mt-1" onclick="alarmAnswer(this);">'
												+'답변'
											+'</a>';
									}
									else if(e.status == '2' || e.status == '4' || e.status == '5'){ //user 에게 답변 or user가 삭제한거
										userMsg = userMsg
											+'<a id="reAnswerBtn" href="#" class="btn btn-sm btn-success mt-1" onclick="alarmAnswer(this);">'
												+'재답변'
											+'</a>';
									}
									userMsg = userMsg 			
								+'</div>'
							+'</div>';
								
							}
							else if(e.email != 'admin'){ //관리자가 보낸 메세지
								var adminMsg = '<div id="chatData" class="d-flex align-items-start adminMsg" data-no="'+e.num+'">'	
								+'<div class="flex-grow-1">'
									//+'<small class="text-navy adminMsgTime">30m ago</small>'
									+'<small class="text-navy userMsgTime">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</small>'
									+'<strong>'+e.title+'</strong>'
									+'<br />'
									+'<div class="border text-sm text-muted p-2 mt-1 bollonA">'
										+e.contents
									+'</div>'
								+'</div>'
							+'</div>';
								
								$('#scrollBox').prepend(adminMsg); 
				
							}
							
							
						});
						
						
						
					},
					error : function(request, status, error) {
						console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
					}
				});
				
			} else {
				
				alert("채팅방 최상단 입니다.");
				
			}
			
			
		}
	}
	
	
});


function userRecentMessage(email){
	
	console.log(email);
	
}





