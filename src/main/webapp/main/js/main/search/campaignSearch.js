var checkList = {distanceCheck: 'off', priceCheck:'off', dateCheck: 'off', interCheck: 'off', memberCheck: 'off', statusCheck: 'off'};

$(document).ready(function() {
	
	
	
//	필터체크 유무 및 유효성 검사
	$( '#distanceCheck' ).change( function() {
		if ( $( '#distanceCheck' ).is( ':checked' ) ) {
			$("#distanceCheckName").addClass('pick');
			$("#distanceFilter").show(200);
        } else {
        	$('.campaignDistance').removeAttr('required');
        	$("#distanceCheckName").removeClass('pick');
        	$("#distanceFilter").hide(200);
        }
    	}
	);
	$( '#priceCheck' ).change( function() {
		 if( $( '#priceCheck' ).is( ':checked' ) ) {
			 
			$("#priceCheckName").addClass('pick');
			$("#priceFilter").show(200);
			$( '#campaignMinPrice' ).attr( 'required', 'required' );
			$( '#campaignMaxPrice' ).attr( 'required', 'required' );
			console.log("hi");
          } else {
        	$('#campaignMinPrice').removeAttr('required');
        	$('#campaignMaxPrice').removeAttr('required');
        	$("#priceCheckName").removeClass('pick');
        	$("#priceFilter").hide(200);
          }
    	}
	);
	$( '#dateCheck' ).change( function() {
		if ( $( '#dateCheck' ).is( ':checked' ) ) {
			$("#dateCheckName").addClass('pick');
			$("#dateFilter").show(200);
			$( '#startDate' ).attr( 'required', 'required' );
			$( '#endDate' ).attr( 'required', 'required' );
          } else {
        	$('#startDate').removeAttr('required');
        	$('#endDate').removeAttr('required');
        	$("#dateCheckName").removeClass('pick');
        	$("#dateFilter").hide(200);
          }
    	}
	);
	$( '#interCheck' ).change( function() {
		if ( $( '#interCheck' ).is( ':checked' ) ) {
			$("#interCheckName").addClass('pick');
			$("#interFilter").show(200);
          } else {
        	$("#interCheckName").removeClass('pick');
        	$("#interFilter").hide(200);
          }
    	}
	);
	$( '#memberCheck' ).change( function() {
		if ( $( '#memberCheck' ).is( ':checked' ) ) {
			$("#memberCheckName").addClass('pick');
			$("#memberFilter").show(200);
          } else {
        	$("#memberCheckName").removeClass('pick');
        	$("#memberFilter").hide(200);
          }
    	}
	);
	
	$( '#statusCheck' ).change( function() {
		if ( $( '#statusCheck' ).is( ':checked' ) ) {
			$("#statusCheckName").addClass('pick');
			$("#statusFilter").show(200);
          } else {
        	$("#statusCheckName").removeClass('pick');
        	$("#statusFilter").hide(200);
          }
    	}
	);
	
	
//	$("#filter_submit_button").click(function() {
//		if ( $( '#distanceCheck' ).is( ':checked' ) ) {
//    		checkList.distanceCheck = 'on';
//    	}
//    	if ( $( '#priceCheck' ).is( ':checked' ) ) {
//    		checkList.priceCheck = 'on';
//    	}
//    	if ( $( '#dateCheck' ).is( ':checked' ) ) {
//    		checkList.dateCheck = 'on';
//    	}
//    	if ( $( '#interCheck' ).is( ':checked' ) ) {
//    		checkList.interCheck = 'on';
//    	}
//    	if ( $( '#memberCheck' ).is( ':checked' ) ) {
//    		checkList.memberCheck = 'on';
//    	}
//    	$("#filter_submit").submit();
//    });
// 이렇게 되면 전역변수가 다시 초기화됨 	
	
	// 삭제 버튼이 존재하면~
	if ($('#distance_filter_delete').length) {
		  var campaignDistance = $('#distance_filter_delete').attr('name');
		  $("#distanceCheck").attr("checked", "checked");
		  $("#distanceCheckName").addClass('pick');
		  $("#distanceFilter").show();
		  $("#campaignDistance").attr("value", campaignDistance);
		  $("#distance").html(campaignDistance);
		  checkList.distanceCheck = 'on';
	}
	if ($('#price_filter_delete').length) {
		  var campaignPrice = $('#price_filter_delete').attr('name').split('/');
		  console.log(campaignPrice[0]);
		  $("#priceCheck").attr("checked", "checked");
		  $("#priceFilter").show();
		  $("#campaignMinPrice").attr("value", campaignPrice[0].replace(/[^0-9]/g,'').replace(/\B(?=(\d{3})+(?!\d))/g, ','));
		  $("#campaignMaxPrice").attr("value", campaignPrice[1].replace(/[^0-9]/g,'').replace(/\B(?=(\d{3})+(?!\d))/g, ','));
		  checkList.priceCheck = 'on';
	}
	if ($('#date_filter_delete').length) {
		  var campaignDate = $('#date_filter_delete').attr('name').split(',');
		  console.log(campaignDate);
		  $("#dateCheck").attr("checked", "checked");
		  $("#dateFilter").show();
		  $("#startDate").attr("value", campaignDate[0]);
		  $("#endDate").attr("value", campaignDate[1]);
		  checkList.dateCheck = 'on';
	}
	if ($('#inter_filter_delete').length) {
		  var inter = $('#inter_filter_delete').attr('name');
		  $("#interCheck").attr("checked", "checked");
		  $("#interFilter").show();
		  if (inter == '2'){
			  $("#inter2").attr("checked", "checked");
		  }else{
			  $("#inter1").attr("checked", "checked");
		  }
		  checkList.interCheck = 'on';
	}
	if ($('#member_filter_delete').length) {
		  var campaignMember = $('#member_filter_delete').attr('name');
		  $("#memberCheck").attr("checked", "checked");
		  $("#memberFilter").show();
		  if (campaignMember == '1'){
			  $("#campaignMember1").attr("checked", "checked");
		  }else{
			  $("#campaignMember2").attr("checked", "checked");
		  }
		  checkList.memberCheck = 'on';
	}
	
	// status관련 삭제 함수 만들어줘야함
	if ($('#status_filter_delete').length) {
		  var campaignStatus = $('#status_filter_delete').attr('name');
		  $("#statusCheck").attr("checked", "checked");
		  $("#statusFilter").show();
		  if (campaignStatus == '1'){
			  $("#campaignStatus1").attr("checked", "checked");
		  }else if(campaignStatus == '2'){
			  $("#campaignStatus2").attr("checked", "checked");
		  }else if(campaignStatus == '3'){
			  $("#campaignStatus3").attr("checked", "checked");
		  }else if(campaignStatus == '4'){
			  $("#campaignStatus4").attr("checked", "checked");
		  }else{
			  $("#campaignStatus5").attr("checked", "checked");
		  }
		  checkList.statusCheck = 'on';
	}
	
//	취소버튼 동작
	$("#distance_filter_delete").click(function() {
		$("#distanceCheck").removeAttr("checked");
		reviseCheckbox();
		$("#filter_submit").submit();
    });
	$("#price_filter_delete").click(function() {
		$("#priceCheck").removeAttr("checked");
		reviseCheckbox();
		$("#filter_submit").submit();
    });
	$("#date_filter_delete").click(function() {
		$("#dateCheck").removeAttr("checked");
		reviseCheckbox();
		$("#filter_submit").submit();
	});
	$("#inter_filter_delete").click(function() {
		$("#interCheck").removeAttr("checked");
		reviseCheckbox();
		$("#filter_submit").submit();
	});
	$("#member_filter_delete").click(function() {
		$("#memberCheck").removeAttr("checked");
		reviseCheckbox();
		$("#filter_submit").submit();
	});
	$("#status_filter_delete").click(function() {
		$("#statusCheck").removeAttr("checked");
		reviseCheckbox();
		$("#filter_submit").submit();
	});
	
	
	
	if($("#pageNum").length){
		var page = $("#pageNum").val();
		$('#page' + page).addClass("active");
	}else{
		$('#page1').addClass("avtive");
	}

	// info페이지로 넘어가는 버튼
	
	$(".goCampaignInfo1").click(function() {
		var cId = $("#campaignId1").val();
		$("#campaignId").attr("value", cId);
		$("#goInfoPage").submit();
    });
	$(".goCampaignInfo2").click(function() {
		var cId = $("#campaignId2").val();
		$("#campaignId").attr("value", cId);
		$("#goInfoPage").submit();
    });
	$(".goCampaignInfo3").click(function() {
		var cId = $("#campaignId3").val();
		$("#campaignId").attr("value", cId);
		$("#goInfoPage").submit();
    });
	$(".goCampaignInfo4").click(function() {
		var cId = $("#campaignId4").val();
		$("#campaignId").attr("value", cId);
		$("#goInfoPage").submit();
    });
	$(".goCampaignInfo5").click(function() {
		var cId = $("#campaignId5").val();
		$("#campaignId").attr("value", cId);
		$("#goInfoPage").submit();
    });
	$(".goCampaignInfo6").click(function() {
		var cId = $("#campaignId6").val();
		$("#campaignId").attr("value", cId);
		$("#goInfoPage").submit();
    });
	$(".goCampaignInfo7").click(function() {
		var cId = $("#campaignId7").val();
		$("#campaignId").attr("value", cId);
		$("#goInfoPage").submit();
    });
	$(".goCampaignInfo8").click(function() {
		var cId = $("#campaignId8").val();
		$("#campaignId").attr("value", cId);
		$("#goInfoPage").submit();
    });
	$(".goCampaignInfo9").click(function() {
		var cId = $("#campaignId9").val();
		$("#campaignId").attr("value", cId);
		$("#goInfoPage").submit();
    });
	
	$("#startDate").change(function(){
	    console.log($("#startDate").val());
	    $("#endDate").attr("min", $("#startDate").val());
	});
	
	$("#endDate").change(function(){
		$("#startDate").attr("max", $("#endDate").val());
	});
	
	$("#filter_submit_button").click(function() {
		if( $( '#dateCheck' ).is( ':checked' )){
			if($('#startDate').val() == "" || $('#endDate').val() == ""){
				$("input:checkbox[id='dateCheck']").prop("checked", false);
			}
		}
		if(  $( '#priceCheck' ).is( ':checked' )){
			if($('#campaignMinPrice').val() == "" || $('#campaignMaxPrice').val() == ""){
				$("input:checkbox[id='priceCheck']").prop("checked", false);
			}
		}
		if(uncomma($("#campaignMinPrice").val())*1 > uncomma($("#campaignMaxPrice").val())*1){
			var campaignMinPrice = $("#campaignMinPrice").val();
			$("#campaignMinPrice").val($("#campaignMaxPrice").val());
			$("#campaignMaxPrice").val(campaignMinPrice);
			console.log($("#campaignMinPrice").val());
			console.log($("#campaignMaxPrice").val());
		}
		$("#filter_submit").submit();
	});
	
});



function reviseCheckbox(){
	if( $( '#distanceCheck' ).is( ':checked' ) && checkList.distanceCheck == 'off'){
		$("input:checkbox[id='distanceCheck']").prop("checked", false);
	}
	if( $( '#priceCheck' ).is( ':checked' ) && checkList.priceCheck == 'off'){
		$("input:checkbox[id='priceCheck']").prop("checked", false);
	}
	if( $( '#dateCheck' ).is( ':checked' ) && checkList.dateCheck == 'off'){
		$("input:checkbox[id='dateCheck']").prop("checked", false);
	}
	if( $( '#interCheck' ).is( ':checked' ) && checkList.interCheck == 'off'){
		$("input:checkbox[id='interCheck']").prop("checked", false);
	}
	if( $( '#memberCheck' ).is( ':checked' ) && checkList.memberCheck == 'off'){
		$("input:checkbox[id='memberCheck']").prop("checked", false);
	}
	if( $( '#statusCheck' ).is( ':checked' ) && checkList.statusCheck == 'off'){
		$("input:checkbox[id='statusCheck']").prop("checked", false);
	}
}

//가격 콤마 3자리마다 찍는 함수 3개
function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
} 

function inputNumberFormat(obj) {
    obj.value = comma(uncomma(obj.value));
}


function paging(e){
	var page = $(e).text();
	$('#pageNum').attr("value", page);
	console.log(page);
	reviseCheckbox();
	$("#filter_submit").submit();
}

function nextPage(){
	var cp = $('#pageNum').val();
	var np = cp*1 + 1;
	console.log(np);
	if($('#page' + np).length){
		$('#pageNum').attr("value", np);
		reviseCheckbox();
		$("#filter_submit").submit();
	}else{
		alert('마지막 페이지입니다.');
	}
}

function prevPage(){
	var cp = $('#pageNum').val();
	var np = cp*1 - 1;
	console.log(np);
	if($('#page' + np).length){
		$('#pageNum').attr("value", np);
		reviseCheckbox();
		$("#filter_submit").submit();
	}else{
		alert('첫번쩨 페이지입니다.');
	}
}

function startPage(){
	$('#pageNum').attr("value", 1);
	reviseCheckbox();
	$("#filter_submit").submit();
}

function endPage(){
	$('#pageNum').attr("value", $('#endPage').val());
	reviseCheckbox();
	$("#filter_submit").submit();
}
