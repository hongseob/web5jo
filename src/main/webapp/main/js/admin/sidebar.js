/**
 * 
 */
$(document).ready(function() {
	
	var $sidebar_item = $(".sidebar-item");

	var ctrpage;
	
//	alert(ctrpage);

	/* 현재 페이지 구분을 위해서 page 클래스에 index 붙여서 라벨링 하기 */

	/* a권한 기본페이지 페이지네이션 */
	$('.sidebar-item').each(function(index, item) {
		index = index + 1;
		$(item).addClass('item' + index);

		if (index == 1) {
			$(item).addClass('active');
		}
		else {
			$(item).addClass('nonactive');
		}

	});
	


	$sidebar_item.click(function(e) {
		
//		alert("클릭확인");
		
		var myClasses = this.classList;

		/* 각각의 페이지네이션 번호에 따라 page+index라는 클래스를 넣어 두었다 . */

		var nowitem = String(myClasses[1][4]);
		ctrpage = nowitem;
		
//		alert(ctrpage);



		itemnum = '.' + 'item' + ctrpage;

		var $nowitem = $(itemnum);

		var $everyitem = $(".active");

		$everyitem.removeClass('active');
		$nowitem.addClass('active');


	});
})

$(function() {
	//----- OPEN
	
})