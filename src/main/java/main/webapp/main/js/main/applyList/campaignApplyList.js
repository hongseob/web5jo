$(document).ready(function() {
	$("#approved_list_wrapper").hide();
	$("#rejected_list_wrapper").hide();
	$("#confirmed_list_wrapper").hide();
});


function changeAppliedUserStatus(count){
	var applyStatus = $('#applyStatus' + count + ' option:selected').val();
	console.log(applyStatus);
	var userId = $('#userId' + count).val();
	var campaignId = $('#campaignId').val();
	var campaignEstimate = $('#campaignEstimate').val().substring(2);
	console.log($('#approvedStudentCount').val());
	if($('#approvedStudentCount').val() == $('#campaignMemberCount').val()){
		alert("인원이 다 찼습니다.");
	}else{
		$.ajax({
			url:'/main/apply/ajax/modifyStatus.do?applyStatus=' + applyStatus + '&' + 'campaignId=' + campaignId + '&' + 'uId=' + userId + '&' +'campaignEstimate=' + campaignEstimate,
			type: 'GET',
			async: false,
			success:function(){
				alert("적용되었습니다.");
				location.href = "/main/apply.do?campaignId=" + campaignId; // 키워드 뒤에 붙일것, 상필이 페이지에서 get요청으로 한다음에 뒤에 캠페인 아이디 붙여서 ㄱ
			},error : function(request, status, error) {
				console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});
	}
}

function confirmCampaign(num){
	var campaignId = $('#campaignId').val();
	if(confirm("캠페인 인원 모집을 완료하시겠습니까?")){
		if(num == 2){
			if(confirm("정원이 미달입니다. 그래도 인원 모집 완료하갰습니까?")){
				$.ajax({
					url:'/main/apply/ajax/confirmCampaign.do?campaignId=' + campaignId,
					type: 'GET',
					async: false,
					success:function(){
						alert("적용되었습니다.");
						location.href = "/main/apply.do?campaignId=" + campaignId;; // 키워드 뒤에 붙일것, 상필이 페이지에서 get요청으로 한다음에 뒤에 캠페인 아이디 붙여서 ㄱ
					},error : function(request, status, error) {
						console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
					}
				});
			}
		}else{
			$.ajax({
				url:'/main/apply/ajax/confirmCampaign.do?campaignId=' + campaignId,
				type: 'GET',
				async: false,
				success:function(){
					alert("적용되었습니다.");
					location.href = "/main/apply.do?campaignId=" + campaignId;; // 키워드 뒤에 붙일것, 상필이 페이지에서 get요청으로 한다음에 뒤에 캠페인 아이디 붙여서 ㄱ
				},error : function(request, status, error) {
					console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			});
		}
	}
}

$("#nav_applied_list").on("click", function(){
	$('#list_name').text('신청 명단');
	$("#applied_list_wrapper").show();
	$("#drop_nav_list").hide('fast');
	$("#approved_list_wrapper").hide();
	$("#rejected_list_wrapper").hide();
	$("#confirmed_list_wrapper").hide();
	$("#nav_applied_list").addClass("nav_clicked_list");
	$("#nav_approved_list").removeClass("nav_clicked_list");
	$("#nav_rejected_list").removeClass("nav_clicked_list");
	$("#nav_confirmed_list").removeClass("nav_clicked_list");
});

$("#nav_approved_list").on("click", function(){
	$('#list_name').text('승인 명단');
	$("#approved_list_wrapper").show();
	$("#drop_nav_list").hide('fast');
	$("#applied_list_wrapper").hide();
	$("#rejected_list_wrapper").hide();
	$("#confirmed_list_wrapper").hide();
	$("#nav_approved_list").addClass("nav_clicked_list");
	$("#nav_applied_list").removeClass("nav_clicked_list");
	$("#nav_rejected_list").removeClass("nav_clicked_list");
	$("#nav_confirmed_list").removeClass("nav_clicked_list");
});

$("#nav_rejected_list").on("click", function(){
	$('#list_name').text('거절 명단');
	$("#rejected_list_wrapper").show();
	$("#drop_nav_list").hide('fast');
	$("#applied_list_wrapper").hide();
	$("#approved_list_wrapper").hide();
	$("#confirmed_list_wrapper").hide();
	$("#nav_rejected_list").addClass("nav_clicked_list");
	$("#nav_approved_list").removeClass("nav_clicked_list");
	$("#nav_applied_list").removeClass("nav_clicked_list");
	$("#nav_confirmed_list").removeClass("nav_clicked_list");
});

$("#nav_confirmed_list").on("click", function(){
	$('#list_name').text('예약확정 명단');
	$("#confirmed_list_wrapper").show();
	$("#drop_nav_list").hide('fast');
	$("#approved_list_wrapper").hide();
	$("#applied_list_wrapper").hide();
	$("#rejected_list_wrapper").hide();
	$("#nav_confirmed_list").addClass("nav_clicked_list");
	$("#nav_approved_list").removeClass("nav_clicked_list");
	$("#nav_rejected_list").removeClass("nav_clicked_list");
	$("#nav_applied_list").removeClass("nav_clicked_list");
});

/*$(".list_button").on("click", function(){
	if($("#drop_nav_list").hasClass("non_active")){
		$("#drop_nav_list").show(40);
		$("#drop_nav_list").removeClass("non_active");
	}else{
		$("#drop_nav_list").hide(40);
		$("#drop_nav_list").addClass("non_active");
	}
});
*/
$(".list_button").click( function() {
    $("#drop_nav_list").toggle( 'fast' );
  });

/*function confirmUser(count){
	var userId = $('#cuserId' + count).val();
	console.log(userId);
	var campaignId = $('#campaignId').val();
	$.ajax({
		url:'/main/apply/ajax/modifyStatus.do?applyStatus=3' + '&' + 'cId=' + campaignId + '&' + 'uId=' + userId,
		type: 'GET',
		async: false,
		success:function(){
			alert("적용되었습니다.");
		},error : function(request, status, error) {
			console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	});
}*/