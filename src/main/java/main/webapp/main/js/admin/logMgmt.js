window.onload = init;

function init(){

	logList_ajax(1);
}

function logList_ajax(i){
	

	var pageNum=i;	
	var p=parseInt((i-1)/5)*5+1;
	var searchTitle=$('#searchTitle').val();
	var searchCont=$('#searchCont').val();
	
	
	//ajax 전송에 필요한 데이터 
	var data = {
		pageNum:pageNum,
		searchTitle:searchTitle,
		searchCont:searchCont
	}
	
	//ajax 전송
	$.ajax({
		url : '/admin/ajax/accessLogList.do',
		data : data,
		dataType : 'json',
		contentType : "application/json; charset=utf-8",
		async : false,
		type : 'GET',
		success : function(data) {
			//pagination
			var pagination=$('.pagination');
			pagination.html('');
			var html='';
			html+='<a href="#" class="pprev" onclick="pprev('+(pageNum-1)+')"></a>';
			html+='<a href="#" class="prev" onclick="prevpage()"></a>';
			for(var i=p;(i<p+5&&i<=data.totalPage);i++){
				if(i==Number(pageNum))
					html+='<a href="#" onclick="logList_ajax('+i+')" class="active">'+i+'</a>';
				else
					html+='<a href="#" onclick="logList_ajax('+i+')" >'+i+'</a>';
			}
			html+='<a href="#" class="next" onclick="nextpage('+data.totalPage+')"></a>';
			html+='<a href="#" class="nnext" onclick="nnext('+(pageNum-1)+','+data.totalPage+')"></a>';
			
			pagination.html(html);
			
			$('.logListTable').empty();
			var accessLogList=data.accessLogList;
			
			for(var idx in data.accessLogList){
				var ListHTML='<tr class="odd gradeX">';
				var contHTML='<td>'+accessLogList[idx].uId+'</td>';
				contHTML+='<td>'+accessLogList[idx].accessUrl+'</td>';
				contHTML+='<td>'+accessLogList[idx].accessTime+'</td>';
				ListHTML+=contHTML;
				ListHTML+='</tr>';
				
				$('.logListTable').append(ListHTML);
			}		

		},
		error : function(request, status, error) {
			console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	});
}

function pprev(i){
	if(parseInt(i/5)==0){
		logList_ajax(1);
	}
	else{
		logList_ajax(parseInt(i/5)*5-4);
	}
}

function nnext(i,total){
	if(parseInt(i/5)==parseInt((total-1)/5)){
		logList_ajax((parseInt(i/5)*5+1));
	}
	else{
		logList_ajax((parseInt(i/5)*5+1)+5);
	}
}

function prevpage(){
	var current=Number($(".pagination a.active").text());
	current--;
	if(current==0){
		current=1;
	}
	logList_ajax(current);
}

function nextpage(totalPage){
	var current=Number($(".pagination a.active").text());
	current++;
	if(current>totalPage){
		current=totalPage;
	}
	logList_ajax(current);
}