

function search_index(i){
	
	var pageNum=i;	
	var p=parseInt((i-1)/5)*5+1;
	let value = $('#search_campaign_index_select').val();
	let searchWord = $('#search_campaign_index_text').val();
	
	
	console.log(value);
	console.log(searchWord);
	
	if(searchWord == '' || searchWord == undefined){
		alert('키워드를 입력해주세요.');
	} else {
		
		let data = {
				pageNum:pageNum,
				value: value, 
				keyword: searchWord
				};
		
		$.ajax({
			url : '/admin/ajax/campaignApprove.do',
			data : data,
			dataType : 'json',
			contentType : "application/json; charset=utf-8",
			async : false,
			type : 'GET',
			success : function(data) {
				console.log('s');
				
			},
			error : function(request, status, error) {
				console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});	
	}

	
	
	
	
}

