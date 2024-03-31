
/* ----------------nav 바 기능 함수들 -----------------*/

$("#plus_button").on("click", function() { //캠페인생성하기
	location.href = "../main/create.do";
});

$("#new_mento").on("click", function() { //멘토 등록하기
	window.location.replace("../main/mentor.do");
});





/* 검색창 구현 */

$(function() {
	var $cp_searchbar = $('.campaign_searchbar');
	var $cp_slidebox = $('.campaign_searchbar_slidebox');
	var $main = $('.main');

	$cp_searchbar.on("propertychange change paste input", function() {
		$cp_slidebox.slideDown(0);
		if (!$cp_searchbar.val()) {
			$cp_slidebox.css("display", "none");
		}
	});
	$main.on("click", function(e) {
		$cp_slidebox.css("display", "none");
	});
});

// 검색창 필터 


function filter() {
	var value, name, item, i;
	value = document.getElementById("value").value.toUpperCase();
	item = document.getElementsByClassName("item");
	for (i = 0; i < item.length; i++) {
		name = item[i].getElementsByClassName("name");
		if (name[0].innerHTML.toUpperCase().indexOf(value) > -1) {
			item[i].style.display = "flex";
		} else {
			item[i].style.display = "none";
		}
	}
}



//검색창에 입력 후 검색 돋보기 아이콘 눌렀을 때
$("#campaign_search_button").on("click", function() {
	$("#campaign_searchbar").submit();
});

//검색창에 입력 후 엔터를 눌렀을 때
$(document).on('keypress', function(e) {
	if (e.which == 13) {
		$("#campaign_searchbar").submit();
	}
});


/* 캠페인 추가 */

$(function() {

	var $cp_button = $('.campaign_plus_button');

	$cp_button.click(function() {


	})
});

/* 캠페인 검색 */

$(function() {

	var $campaign_searchbar = $('.campaign_searchbar');
	var $campaign_searchbar_slidebox = $('.campaign_searchbar_slidebox');


	$campaign_searchbar.click(function() {



	})
});





var globalPageNum; //목록으로 가기위해 사용할 전역변수
function loadAlarmList(i) {

	globalPageNum = i;

	var pageNum = i;
	var p = parseInt((i - 1) / 5) * 5 + 1;


	//ajax 전송에 필요한 데이터 
	var data = {
		pageNum: pageNum,
	}

	$.ajax({
		url: '/main/ajax/userAlarmList.do',
		dataType: 'json',
		contentType: "application/json; charset=utf-8",
		async: false,
		data: data,
		type: 'GET',
		success: function(data) {
			//pagination
			var pagination = $('.pagination');
			pagination.html('');
			var html = '';
			//html+='<a href="#" class="pprev" onclick="pprev('+(pageNum-1)+')"></a>';
			html += '<a href="#" class="prev" onclick="prevpage()"></a>';
			for (var i = p; (i < p + 5 && i <= data.totalPage); i++) {
				if (i == Number(pageNum))
					html += '<a href="#" onclick="loadAlarmList(' + i + ')" class="active">' + i + '</a>';
				else
					html += '<a href="#" onclick="loadAlarmList(' + i + ')" >' + i + '</a>';
			}
			html += '<a href="#" class="next" onclick="nextpage(' + data.totalPage + ')"></a>';
			//html+='<a href="#" class="nnext" onclick="nnext('+(pageNum-1)+','+data.totalPage+')"></a>';

			pagination.html(html);



			$(".content_bottom").html('');

			$(".content_bottom").css('display', 'block');

			console.log(data.alarmList);



			data.alarmList.forEach(function(e, i) {
				console.log(e.status);
				if (e.status === '3' || e.status === '2') {

					var alarmBody = '<div id="alarm_body" data-no="' + e.inqureId + '" data-num="' + e.num + '" >'
						+ '<i id="alarm_bottom_x" class="fa-solid fa-x" onclick="removeAlarmbyX(' + e.inqureId + ')"></i>'
						+ '<div class="alarm_title_inner" onclick="selectAlarmBoard(' + e.inqureId + ',' + e.num + ')">' + e.title + '</div>'
						+ '<div class="alarm_content_inner" onclick="selectAlarmBoard(' + e.inqureId + ',' + e.num + ')">' + e.contents + '</div>'
						+ '</div>';
					$(".content_bottom").append(alarmBody);

				} else if (e.status === '5') {

					var alarmBody = '<div id="alarm_body_read" data-no="' + e.inqureId + '" data-num="' + e.num + '" >'
						+ '<i id="alarm_bottom_x" class="fa-solid fa-x" onclick="removeAlarmbyX(' + e.inqureId + ')"></i>'
						+ '<div class="alarm_title_inner" onclick="selectAlarmBoard(' + e.inqureId + ',' + e.num + ')">' + e.title + '</div>'
						+ '<div class="alarm_content_inner" onclick="selectAlarmBoard(' + e.inqureId + ',' + e.num + ')">' + e.contents + '</div>'
						+ '</div>';
					$(".content_bottom").append(alarmBody);

				}
			});


		},
		error: function(request, status, error) {
			console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	});


}

$(function() {
	//----- OPEN

	var $n_button = $('.notice_icon');
	var $x_button = $('.slide_down_headbar_xbutton');

	var $slidedown = $('.slide_down');

	var $main = $('.main');

	var duration = 300;




	$n_button.click(function() {




		$slidedown.toggleClass('open');


		if ($slidedown.hasClass('open')) {
			$slidedown.slideDown(duration);

			$(".content_board").css('display', 'none');
			$(".alarm_nav").css('display', 'block');

			loadAlarmList(1);



		} else {
			$slidedown.slideUp(duration);
		};



	})


	$x_button.click(function() {

		var duration = 300;


		$slidedown.slideUp(duration);


	})

	$main.on("click", function(e) {
		if ($slidedown.hasClass('open')) {


			$slidedown.slideUp(duration);

			$slidedown.toggleClass('open');

		}
	});

});

/* id 표시 관련 함수들 */



$(function() {

	var $id_main_button = $('.idstatus_button_main');
	var $id_detail_button = $('.idstatus_button_detail');
	var $return_main_button = $('.idstatus');
	var $main = $('.main');


	$('body').on('click', '.idstatus_button_main', function() {

		$id_detail_button.toggleClass('idstatus_button_open');

		$id_main_button.replaceWith($id_detail_button);

	});


	$('body').on('click', '.idstatus', function() {

		$id_detail_button.replaceWith($id_main_button);

		$id_detail_button.toggleClass('idstatus_button_open');

	});

	$main.on("click", function(e) {
		if ($id_detail_button.hasClass('idstatus_button_open')) {


		}
		else {

			$id_detail_button.replaceWith($id_main_button);

			$id_detail_button.toggleClass('idstatus_button_open');

		}
	});



});



/* --------------------- 캠페인 카드 필터 기능들  ----------*/

/* 갤러리 상태에서, 생성중 , 예약중 , 진행중, 종료 캠페인 전환 기능 */

/* div 클릭 요소 처리하기 in JQUERY  -> 다른 요소들과 모두 동일하다. */

/* 리스트 상태에서의 페이지 이동, 각각 상태에 따른 리스트 불러오기 */

/* $('#target').click(function() {
 alert('Handler for .click() called.');
 }); */


/* 갤러리 카드 슬라이드 다운 함수 */
$(function() {
	//----- OPEN
	var $n_button1 = $('#gallery_card_icon_button01');
	var $slidedown1 = $('#gallery_slidedown_01');

	$n_button1.click(function() {
		var duration = 300;
		$slidedown1.toggleClass('open');
		// open 클래스가 없으면 추가하고, 있으면 빼버립니다. ( 작동확인 완료 )
		if ($slidedown1.hasClass('open')) {
			$slidedown1.slideDown(duration);
		} else {
			$slidedown1.slideUp(duration);
		}
	})
});

$(function() {
	//----- OPEN
	var $n_button1 = $('#gallery_card_icon_button02');
	var $slidedown1 = $('#gallery_slidedown_02');

	$n_button1.click(function() {
		var duration = 300;
		$slidedown1.toggleClass('open');
		// open 클래스가 없으면 추가하고, 있으면 빼버립니다. ( 작동확인 완료 )
		if ($slidedown1.hasClass('open')) {
			$slidedown1.slideDown(duration);
		} else {
			$slidedown1.slideUp(duration);
		}

	})
});

$(function() {
	//----- OPEN

	var $n_button1 = $('#gallery_card_icon_button03');
	var $slidedown1 = $('#gallery_slidedown_03');

	$n_button1.click(function() {
		var duration = 300;
		$slidedown1.toggleClass('open');
		// open 클래스가 없으면 추가하고, 있으면 빼버립니다. ( 작동확인 완료 )
		if ($slidedown1.hasClass('open')) {
			$slidedown1.slideDown(duration);
			// bgLayerOpen();
		} else {
			$slidedown1.slideUp(duration);
			// bgLayerClear();
		}
	})
});



/* 리스트 / 갤러리 형 변환 함수들  */



$(function() {

	// ---- 캠페인 카드 버튼

	var $wait_button_box = $('#wait_button_box');
	var $collect_button_box = $('#collect_button_box');
	var $ingA_button_box = $('#ingA_button_box');
	var $endA_button_box = $('#endA_button_box');

	// ----- 갤러리 영역 , 생성중 , 예약중, 진행중, 종료

	var $gallery_loading_area = $('#gallery_loading');
	var $gallery_reserving_area = $('#gallery_reserving');
	var $gallery_ing_area = $('#gallery_ing');
	var $gallery_end_area = $('#gallery_end');

	// ----- 전체 영역

	var $campaign_area = $('.campaign_list');

	var $campaign_list = $('.campaign_list_bar');
	var $campaign_gallery = $('.campaign_list_gallery');

	// -- 버튼 클릭횟수 status가 1이면 클릭영역, status가 0이면 다시 전체영역으로 복귀

	var status_loading = 0; // 0은 전체영역에 1은 특정영역
	var status_reserving = 0;
	var status_ing = 0;
	var status_end = 0;

	$wait_button_box.click(function() {

		status_reserving = 0;
		status_ing = 0;
		status_end = 0;

		if (status_loading == 0) {
			if ($campaign_area.hasClass('gallery')) {
				$gallery_loading_area.css("display", "block");
				$gallery_ing_area.css("display", "none");
				$gallery_reserving_area.css("display", "none");
				$gallery_end_area.css("display", "none");
				status_loading = 1;
			}
		} else if (status_loading == 1) {
			$gallery_loading_area.css("display", "block");
			$gallery_ing_area.css("display", "block");
			$gallery_reserving_area.css("display", "block");
			$gallery_end_area.css("display", "block");
			status_loading = 0;
		}
	})

	$collect_button_box.click(function() {

		status_loading = 0;
		status_ing = 0;
		status_end = 0;

		if (status_reserving == 0) {

			if ($campaign_area.hasClass('gallery')) {
				$gallery_loading_area.css("display", "none");
				$gallery_ing_area.css("display", "none");
				$gallery_reserving_area.css("display", "block");
				$gallery_end_area.css("display", "none");
				status_reserving = 1;
			}
		} else if (status_reserving == 1) {
			$gallery_loading_area.css("display", "block");
			$gallery_ing_area.css("display", "block");
			$gallery_reserving_area.css("display", "block");
			$gallery_end_area.css("display", "block");
			status_reserving = 0;
		}
	})

	$ingA_button_box.click(function() {

		status_loading = 0;
		status_reserving = 0;
		status_end = 0;

		if (status_ing == 0) {

			if ($campaign_area.hasClass('gallery')) {
				$gallery_loading_area.css("display", "none");
				$gallery_ing_area.css("display", "block");
				$gallery_reserving_area.css("display", "none");
				$gallery_end_area.css("display", "none");
				status_ing = 1;
			}
		} else if (status_ing == 1) {
			$gallery_loading_area.css("display", "block");
			$gallery_ing_area.css("display", "block");
			$gallery_reserving_area.css("display", "block");
			$gallery_end_area.css("display", "block");
			status_ing = 0;
		}
	})

	$endA_button_box.click(function() {

		status_loading = 0;
		status_reserving = 0;
		status_ing = 0;

		if (status_end == 0) {
			if ($campaign_area.hasClass('gallery')) {
				$gallery_loading_area.css("display", "none");
				$gallery_ing_area.css("display", "none");
				$gallery_reserving_area.css("display", "none");
				$gallery_end_area.css("display", "block");
				status_end = 1;
			}
		} else if (status_end == 1) {
			$gallery_loading_area.css("display", "block");
			$gallery_ing_area.css("display", "block");
			$gallery_reserving_area.css("display", "block");
			$gallery_end_area.css("display", "block");
			status_end = 0;
		}
	})

});

$(function() {

	// ---- 캠페인 카드 버튼

	var $reserving_button_box = $('#reserving_button_box');
	var $check_button_box = $('#check_button_box');
	var $ingB_button_box = $('#ingB_button_box');
	var $endB_button_box = $('#endB_button_box');

	// ----- 갤러리 영역 , 생성중 , 예약중, 진행중, 종료

	var $gallery_loading_area = $('#gallery_loading');
	var $gallery_reserving_area = $('#gallery_reserving');
	var $gallery_ing_area = $('#gallery_ing');
	var $gallery_end_area = $('#gallery_end');

	// ----- 전체 영역

	var $campaign_area = $('.campaign_list');

	var $campaign_list = $('.campaign_list_bar');
	var $campaign_gallery = $('.campaign_list_gallery');

	// -- 버튼 클릭횟수 status가 1이면 클릭영역, status가 0이면 다시 전체영역으로 복귀

	var status_loading = 0; // 0은 전체영역에 1은 특정영역
	var status_reserving = 0;
	var status_ing = 0;
	var status_end = 0;

	$reserving_button_box.click(function() {

		status_reserving = 0;
		status_ing = 0;
		status_end = 0;

		if (status_loading == 0) {
			if ($campaign_area.hasClass('gallery')) {
				$gallery_loading_area.css("display", "block");
				$gallery_ing_area.css("display", "none");
				$gallery_reserving_area.css("display", "none");
				$gallery_end_area.css("display", "none");
				status_loading = 1;
			}
		} else if (status_loading == 1) {
			$gallery_loading_area.css("display", "block");
			$gallery_ing_area.css("display", "block");
			$gallery_reserving_area.css("display", "block");
			$gallery_end_area.css("display", "block");
			status_loading = 0;
		}
	})

	$check_button_box.click(function() {

		status_loading = 0;
		status_ing = 0;
		status_end = 0;

		if (status_reserving == 0) {

			if ($campaign_area.hasClass('gallery')) {
				$gallery_loading_area.css("display", "none");
				$gallery_ing_area.css("display", "none");
				$gallery_reserving_area.css("display", "block");
				$gallery_end_area.css("display", "none");
				status_reserving = 1;
			}
		} else if (status_reserving == 1) {
			$gallery_loading_area.css("display", "block");
			$gallery_ing_area.css("display", "block");
			$gallery_reserving_area.css("display", "block");
			$gallery_end_area.css("display", "block");
			status_reserving = 0;
		}
	})

	$ingB_button_box.click(function() {

		status_loading = 0;
		status_reserving = 0;
		status_end = 0;

		if (status_ing == 0) {

			if ($campaign_area.hasClass('gallery')) {
				$gallery_loading_area.css("display", "none");
				$gallery_ing_area.css("display", "block");
				$gallery_reserving_area.css("display", "none");
				$gallery_end_area.css("display", "none");
				status_ing = 1;
			}
		} else if (status_ing == 1) {
			$gallery_loading_area.css("display", "block");
			$gallery_ing_area.css("display", "block");
			$gallery_reserving_area.css("display", "block");
			$gallery_end_area.css("display", "block");
			status_ing = 0;
		}
	})

	$endB_button_box.click(function() {

		status_loading = 0;
		status_reserving = 0;
		status_ing = 0;

		if (status_end == 0) {
			if ($campaign_area.hasClass('gallery')) {
				$gallery_loading_area.css("display", "none");
				$gallery_ing_area.css("display", "none");
				$gallery_reserving_area.css("display", "none");
				$gallery_end_area.css("display", "block");
				status_end = 1;
			}
		} else if (status_end == 1) {
			$gallery_loading_area.css("display", "block");
			$gallery_ing_area.css("display", "block");
			$gallery_reserving_area.css("display", "block");
			$gallery_end_area.css("display", "block");
			status_end = 0;
		}
	})

});

/* 캠페인 표 필터링 기능 함수들 */

function sortTablebystatusA(n) {

	var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
	var valuex = 0;
	var valuey = 0;

	table = document.getElementById("myTable");
	switching = true;
	// Set the sorting direction to ascending:
	dir = "asc";
	/* Make a loop that will continue until
	no switching has been done: */
	while (switching) {
		// Start by saying: no switching is done:
		switching = false;
		rows = table.rows;
		/* Loop through all table rows (except the
		first, which contains table headers): */
		for (i = 1; i < (rows.length - 1); i++) {
			// Start by saying there should be no switching:
			shouldSwitch = false;
			/* Get the two elements you want to compare,
			one from current row and one from the next: */
			x = rows[i].getElementsByClassName("icon_title")[n];
			y = rows[i + 1].getElementsByClassName("icon_title")[n];
			/* Check if the two rows should switch place,
			based on the direction, asc or desc: */
			/* 
					console.log(x);
					console.log(y); 
			 */

			innerx = x.innerHTML.toLowerCase();
			innery = y.innerHTML.toLowerCase();
			/* 
					console.log(innerx);
					console.log(innery); */

			if (innerx == '반려중') {
				valuex = 1;
			}
			else if (innerx == '신청중') {
				valuex = 2;
			}
			else if (innerx == '모집중') {
				valuex = 3;
			}
			else if (innerx == '진행중') {
				valuex = 4;
			}
			else if (innerx == '모집완료') {
				valuex = 5;
			}
			else if (innerx == '종료') {
				valuex = 6;
			}

			if (innery == '반려중') {
				valuey = 1;
			}
			else if (innery == '신청중') {
				valuey = 2;
			}
			else if (innery == '모집중') {
				valuey = 3;
			}
			else if (innery == '진행중') {
				valuey = 4;
			}
			else if (innery == '모집완료') {
				valuey = 5;
			}
			else if (innery == '종료') {
				valuey = 6;
			}
			/*  console.log(valuex);
			 console.log(valuey);
	  */

			if (dir == "asc") {
				if (valuex > valuey) {
					// If so, mark as a switch and break the loop:
					shouldSwitch = true;
					break;
				}
			} else if (dir == "desc") {
				if (valuex < valuey) {
					// If so, mark as a switch and break the loop:
					shouldSwitch = true;
					break;
				}
			}


		}


		if (shouldSwitch) {


			rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
			switching = true;
			// Each time a switch is done, increase this count by 1:
			switchcount++;
		} else {

			if (switchcount == 0 && dir == "asc") {
				dir = "desc";
				switching = true;
			}

		}
	}
}

function sortTablebystatusB(n) {

	var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
	var valuex = 0;
	var valuey = 0;

	table = document.getElementById("myTable");
	switching = true;
	// Set the sorting direction to ascending:
	dir = "asc";
	/* Make a loop that will continue until
	no switching has been done: */
	while (switching) {
		// Start by saying: no switching is done:
		switching = false;
		rows = table.rows;
		/* Loop through all table rows (except the
		first, which contains table headers): */
		for (i = 1; i < (rows.length - 1); i++) {
			// Start by saying there should be no switching:
			shouldSwitch = false;
			/* Get the two elements you want to compare,
			one from current row and one from the next: */
			x = rows[i].getElementsByClassName("icon_title")[n];
			y = rows[i + 1].getElementsByClassName("icon_title")[n];
			/* Check if the two rows should switch place,
			based on the direction, asc or desc: */
			/* 
					console.log(x);
					console.log(y); 
			 */

			innerx = x.innerHTML.toLowerCase();
			innery = y.innerHTML.toLowerCase();
			/* 
					console.log(innerx);
					console.log(innery); */

			if (innerx == '신청중') {
				valuex = 1;
			}
			else if (innerx == '승인') {
				valuex = 2;
			}
			else if (innerx == '확정') {
				valuex = 3;
			}
			else if (innerx == '진행') {
				valuex = 4;
			}
			else if (innerx == '종료') {
				valuex = 5;
			}
			else if (innerx == '거절') {
				valuex = 6;
			}

			if (innery == '신청중') {
				valuey = 1;
			}
			else if (innery == '승인') {
				valuey = 2;
			}
			else if (innery == '확정') {
				valuey = 3;
			}
			else if (innery == '진행') {
				valuey = 4;
			}
			else if (innery == '종료') {
				valuey = 5;
			}
			else if (innery == '거절') {
				valuey = 6;
			}
			/*  console.log(valuex);
			 console.log(valuey);
	  */

			if (dir == "asc") {
				if (valuex > valuey) {
					// If so, mark as a switch and break the loop:
					shouldSwitch = true;
					break;
				}
			} else if (dir == "desc") {
				if (valuex < valuey) {
					// If so, mark as a switch and break the loop:
					shouldSwitch = true;
					break;
				}
			}


		}


		if (shouldSwitch) {


			rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
			switching = true;
			// Each time a switch is done, increase this count by 1:
			switchcount++;
		} else {

			if (switchcount == 0 && dir == "asc") {
				dir = "desc";
				switching = true;
			}

		}
	}
}



function sortTablebystr(n) {

	var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
	table = document.getElementById("myTable");
	switching = true;
	// Set the sorting direction to ascending:
	dir = "asc";
	/* Make a loop that will continue until
	no switching has been done: */
	while (switching) {
		// Start by saying: no switching is done:
		switching = false;
		rows = table.rows;
		/* Loop through all table rows (except the
		first, which contains table headers): */
		for (i = 1; i < (rows.length - 1); i++) {
			// Start by saying there should be no switching:
			shouldSwitch = false;
			/* Get the two elements you want to compare,
			one from current row and one from the next: */
			x = rows[i].getElementsByTagName("TD")[n];
			y = rows[i + 1].getElementsByTagName("TD")[n];
			/* Check if the two rows should switch place,
			based on the direction, asc or desc: */
			if (dir == "asc") {
				if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
					// If so, mark as a switch and break the loop:
					shouldSwitch = true;
					break;
				}
			} else if (dir == "desc") {
				if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
					// If so, mark as a switch and break the loop:
					shouldSwitch = true;
					break;
				}
			}
		}
		if (shouldSwitch) {
			/* If a switch has been marked, make the switch
			and mark that a switch has been done: */
			rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
			switching = true;
			// Each time a switch is done, increase this count by 1:
			switchcount++;
		} else {
			/* If no switching has been done AND the direction is "asc",
			set the direction to "desc" and run the while loop again. */
			if (switchcount == 0 && dir == "asc") {
				dir = "desc";
				switching = true;
			}
		}
	}
}

function sortTablebynum(n) {

	// alert("클릭확인")

	var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
	table = document.getElementById("myTable");
	switching = true;
	// Set the sorting direction to ascending:
	dir = "asc";
	/* Make a loop that will continue until
	no switching has been done: */
	while (switching) {
		// Start by saying: no switching is done:
		switching = false;
		rows = table.rows;
		/* Loop through all table rows (except the
		first, which contains table headers): */
		for (i = 1; i < (rows.length - 1); i++) {
			// Start by saying there should be no switching:
			shouldSwitch = false;
			/* Get the two elements you want to compare,
			one from current row and one from the next: */
			x = rows[i].getElementsByTagName("td")[n];
			y = rows[i + 1].getElementsByTagName("td")[n];
			/* Check if the two rows should switch place,
			based on the direction, asc or desc: */
			/* 
					console.log(x);
					console.log(y); */

			innerx = Number(x.innerHTML);
			innery = Number(y.innerHTML);

			/*   console.log(innerx);
			  console.log(innery); */

			if (dir == "asc") {
				if (Number(x.innerHTML) > Number(y.innerHTML)) {
					// If so, mark as a switch and break the loop:
					shouldSwitch = true;
					break;
				}
			} else if (dir == "desc") {
				if (Number(x.innerHTML) < Number(y.innerHTML)) {
					// If so, mark as a switch and break the loop:
					shouldSwitch = true;
					break;
				}
			}
		}
		if (shouldSwitch) {
			/* If a switch has been marked, make the switch
			and mark that a switch has been done: */
			rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
			switching = true;
			// Each time a switch is done, increase this count by 1:
			switchcount++;
		} else {
			/* If no switching has been done AND the direction is "asc",
			set the direction to "desc" and run the while loop again. */
			if (switchcount == 0 && dir == "asc") {
				dir = "desc";
				switching = true;
			}
		}
	}
}


function sortTablebydate(n) {

	// alert("클릭확인")

	var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
	var innerx, innery, x_1, y_1, x_2, y_2
	table = document.getElementById("myTable");
	switching = true;
	// Set the sorting direction to ascending:
	dir = "asc";
	/* Make a loop that will continue until
	no switching has been done: */


	while (switching) {
		// Start by saying: no switching is done:
		switching = false;
		rows = table.rows;
		/* Loop through all table rows (except the
		first, which contains table headers): */
		for (i = 1; i < (rows.length - 1); i++) {
			// Start by saying there should be no switching:
			shouldSwitch = false;
			/* Get the two elements you want to compare,
			one from current row and one from the next: */
			x = rows[i].getElementsByTagName("td")[n];
			y = rows[i + 1].getElementsByTagName("td")[n];
			/* Check if the two rows should switch place,
			based on the direction, asc or desc: */
			//			
			//					console.log(x);
			//					console.log(y); 

			innerx = x.innerHTML;
			innery = y.innerHTML;

			//			console.log(innerx);
			//			console.log(innery);

			//			console.log(typeof(innerx));
			//			console.log(typeof(innery));
			//
			x_1 = innerx.substr(0, 100);
			y_1 = innery.substr(0, 100);
			//
			//			console.log(x_1);
			//			console.log(y_1);
			//

			x_2 = x_1.replace(/\./g, "");
			y_2 = y_1.replace(/\./g, "");

			console.log(x_2);
			console.log(y_2);



			if (dir == "asc") {
				if (x_2 > y_2) {
					// If so, mark as a switch and break the loop:
					shouldSwitch = true;
					break;
				}
			} else if (dir == "desc") {
				if (x_2 < y_2) {
					// If so, mark as a switch and break the loop:
					shouldSwitch = true;
					break;
				}
			}
		}
		if (shouldSwitch) {
			/* If a switch has been marked, make the switch
			and mark that a switch has been done: */
			rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
			switching = true;
			// Each time a switch is done, increase this count by 1:
			switchcount++;
		} else {
			/* If no switching has been done AND the direction is "asc",
			set the direction to "desc" and run the while loop again. */
			if (switchcount == 0 && dir == "asc") {
				dir = "desc";
				switching = true;
			}
		}
	}
}

function sortTablebyratio(n) {

	// alert("클릭확인")

	var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
	table = document.getElementById("myTable");
	switching = true;
	// Set the sorting direction to ascending:
	dir = "asc";
	/* Make a loop that will continue until
	no switching has been done: */
	while (switching) {
		// Start by saying: no switching is done:
		switching = false;
		rows = table.rows;
		/* Loop through all table rows (except the
		first, which contains table headers): */
		for (i = 1; i < (rows.length - 1); i++) {
			// Start by saying there should be no switching:
			shouldSwitch = false;
			/* Get the two elements you want to compare,
			one from current row and one from the next: */
			x = rows[i].getElementsByTagName("td")[n];
			y = rows[i + 1].getElementsByTagName("td")[n];
			/* Check if the two rows should switch place,
			based on the direction, asc or desc: */

			innerx = x.innerHTML;
			innery = y.innerHTML;


			x_1 = innerx.replace(/\:/g, "");
			y_1 = innery.replace(/\:/g, "");


			if (dir == "asc") {
				if (x_1 > y_1) {
					// If so, mark as a switch and break the loop:
					shouldSwitch = true;
					break;
				}
			} else if (dir == "desc") {
				if (x_1 < y_1) {
					// If so, mark as a switch and break the loop:
					shouldSwitch = true;
					break;
				}
			}
		}
		if (shouldSwitch) {
			/* If a switch has been marked, make the switch
			and mark that a switch has been done: */
			rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
			switching = true;
			// Each time a switch is done, increase this count by 1:
			switchcount++;
		} else {
			/* If no switching has been done AND the direction is "asc",
			set the direction to "desc" and run the while loop again. */
			if (switchcount == 0 && dir == "asc") {
				dir = "desc";
				switching = true;
			}
		}
	}
}


/* 테이블캠페인 클릭시 동작 */


$(document).on("click", ".goCampaignInfo0", function() {
	var cId = $("#campaignId0").val();
	$("#campaignId").attr("value", cId);
	$("#goInfoPage").submit();
});
$(document).on("click", ".goCampaignInfo1", function() {
	var cId = $("#campaignId1").val();
	$("#campaignId").attr("value", cId);
	$("#goInfoPage").submit();
});
$(document).on("click", ".goCampaignInfo2", function() {
	var cId = $("#campaignId2").val();
	$("#campaignId").attr("value", cId);
	$("#goInfoPage").submit();
});
$(document).on("click", ".goCampaignInfo3", function() {
	var cId = $("#campaignId3").val();
	$("#campaignId").attr("value", cId);
	$("#goInfoPage").submit();
});
$(document).on("click", ".goCampaignInfo4", function() {
	var cId = $("#campaignId4").val();
	$("#campaignId").attr("value", cId);
	$("#goInfoPage").submit();
});
$(document).on("click", ".goCampaignInfo5", function() {
	var cId = $("#campaignId5").val();
	$("#campaignId").attr("value", cId);
	$("#goInfoPage").submit();
});
$(document).on("click", ".goCampaignInfo6", function() {
	var cId = $("#campaignId6").val();
	$("#campaignId").attr("value", cId);
	$("#goInfoPage").submit();
});
$(document).on("click", ".goCampaignInfo7", function() {
	var cId = $("#campaignId7").val();
	$("#campaignId").attr("value", cId);
	$("#goInfoPage").submit();
});
$(document).on("click", ".goCampaignInfo8", function() {
	var cId = $("#campaignId8").val();
	$("#campaignId").attr("value", cId);
	$("#goInfoPage").submit();
});
$(document).on("click", ".goCampaignInfo9", function() {
	var cId = $("#campaignId9").val();
	$("#campaignId").attr("value", cId);
	$("#goInfoPage").submit();
});


/* 캠페인 이미지 클릭시 동작사항  */

$(document).on("click", ".waitIndex0", function() {
	var cId = $("#waitCampaignId0").val();
	$("#campaignId").attr("value", cId);
	$("#goInfoPage").submit();
});
$(document).on("click", ".waitIndex1", function() {
	var cId = $("#waitCampaignId1").val();
	$("#campaignId").attr("value", cId);
	$("#goInfoPage").submit();
});
$(document).on("click", ".waitIndex2", function() {
	var cId = $("#waitCampaignId2").val();
	$("#campaignId").attr("value", cId);
	$("#goInfoPage").submit();
});

$(document).on("click", ".collectIndex0", function() {
	var cId = $("#collectCampaignId0").val();
	$("#campaignId").attr("value", cId);
	$("#goInfoPage").submit();
});
$(document).on("click", ".collectIndex1", function() {
	var cId = $("#collectCampaignId1").val();
	$("#campaignId").attr("value", cId);
	$("#goInfoPage").submit();
});
$(document).on("click", ".collectIndex2", function() {
	var cId = $("#collectCampaignId2").val();
	$("#campaignId").attr("value", cId);
	$("#goInfoPage").submit();
});

$(document).on("click", ".ingAIndex0", function() {
	var cId = $("#ingAcampaignId0").val();
	$("#campaignId").attr("value", cId);
	$("#goInfoPage").submit();
});
$(document).on("click", ".ingAIndex1", function() {
	var cId = $("#ingAcampaignId1").val();
	$("#campaignId").attr("value", cId);
	$("#goInfoPage").submit();
});
$(document).on("click", ".ingAIndex2", function() {
	var cId = $("#ingAcampaignId2").val();
	$("#campaignId").attr("value", cId);
	$("#goInfoPage").submit();
});

$(document).on("click", ".endAIndex0", function() {
	var cId = $("#endACampaignId0").val();
	$("#campaignId").attr("value", cId);
	$("#goInfoPage").submit();
});
$(document).on("click", ".endAIndex1", function() {
	var cId = $("#endACampaignId1").val();
	$("#campaignId").attr("value", cId);
	$("#goInfoPage").submit();
});
$(document).on("click", ".endAIndex2", function() {
	var cId = $("#endACampaignId2").val();
	$("#campaignId").attr("value", cId);
	$("#goInfoPage").submit();
});


$(document).on("click", ".reserveIndex0", function() {
	var cId = $("#reserveCampaignId0").val();
	$("#campaignId").attr("value", cId);
	$("#goInfoPage").submit();
});
$(document).on("click", ".reserveIndex1", function() {
	var cId = $("#reserveCampaignId1").val();
	$("#campaignId").attr("value", cId);
	$("#goInfoPage").submit();
});
$(document).on("click", ".reserveIndex2", function() {
	var cId = $("#reserveCampaignId2").val();
	$("#campaignId").attr("value", cId);
	$("#goInfoPage").submit();
});

$(document).on("click", ".checkIndex0", function() {
	var cId = $("#checkCampaignId0").val();
	$("#campaignId").attr("value", cId);
	$("#goInfoPage").submit();
});
$(document).on("click", ".checkIndex1", function() {
	var cId = $("#checkCampaignId1").val();
	$("#campaignId").attr("value", cId);
	$("#goInfoPage").submit();
});
$(document).on("click", ".checkIndex2", function() {
	var cId = $("#checkCampaignId2").val();
	$("#campaignId").attr("value", cId);
	$("#goInfoPage").submit();
});

$(document).on("click", ".ingBIndex0", function() {
	var cId = $("#ingBcampaignId0").val();
	$("#campaignId").attr("value", cId);
	$("#goInfoPage").submit();
});
$(document).on("click", ".ingBIndex1", function() {
	var cId = $("#ingBcampaignId1").val();
	$("#campaignId").attr("value", cId);
	$("#goInfoPage").submit();
});
$(document).on("click", ".ingBIndex2", function() {
	var cId = $("#ingBcampaignId2").val();
	$("#campaignId").attr("value", cId);
	$("#goInfoPage").submit();
});

$(document).on("click", ".endBIndex0", function() {
	var cId = $("#endBCampaignId0").val();
	$("#campaignId").attr("value", cId);
	$("#goInfoPage").submit();
});
$(document).on("click", ".endBIndex1", function() {
	var cId = $("#endBCampaignId1").val();
	$("#campaignId").attr("value", cId);
	$("#goInfoPage").submit();
});
$(document).on("click", ".endBIndex2", function() {
	var cId = $("#endBCampaignId2").val();
	$("#campaignId").attr("value", cId);
	$("#goInfoPage").submit();
});








/* 갤러리 화면 전환시에 링크 없애기 */

/* 사이드 메뉴 구성 함수 */

$(function() {
	//----- OPEN
	var $sidemenu_button = $(".sidemenu_button");

	var $side_menu = $("#main_sidebar");
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";
	var mainmenu = new Array();
	var submenu = new Array();
	var first = 0

	$sidemenu_button.hover(function() {

		$side_menu.slideDown();
		$(".sidebar_background").show(); // 배경 어둡게


		if (first == 0) {


			$.ajax({
				url: "/main/main/ajax/getLeftMainmenu.do",
				type: "POST",
				async: false,
				data: {
				},
				beforeSend: function(xhr) {
					xhr.setRequestHeader(header, token);
				},
				success: function(data) {
					jsondata = listtojson(data);
					mainmenu = jsondata;
				},
				error: function() {
					console.log("request error");
				}
			});

			$.ajax({
				url: "/main/main/ajax/getLeftSubmenu.do",
				type: "POST",
				async: false,
				data: {
				},
				beforeSend: function(xhr) {
					xhr.setRequestHeader(header, token);
				},
				success: function(data) {
					jsondata = listtojson(data);
					submenu = jsondata;

				},
				error: function() {
					console.log("request error");
				}
			});

			renderLeftMenu(mainmenu, submenu);

			first = 1;

		}

	}, function() {

	});

	$side_menu.hover(function() {

	}, function() {

		$side_menu.slideUp();

		$(".sidebar_background").hide(); // 배경 어둡게

	});

});


/* 버튼 클릭 처리하기 */

$(function() {
	//----- OPEN

	$(document).on('click', '.sidebar_menu_button', function() {

		var button_id = $(this).attr("id");

		var button_num = button_id[11];

		var slidedown = '#' + 'sidebar_slidedown' + button_num;

		var duration = 300;

		var $slidedown = $(slidedown);



		$slidedown.toggleClass('open');

		if ($slidedown.hasClass('open')) {
			$slidedown.slideDown(duration);
		} else {
			$slidedown.slideUp(duration);
		};
	})

});


/* 캠페인카드 호버시에 영역 반전시키기 */

$(function() {
	//----- OPEN

	$('#wait_button_box').hover(function() {
		//        alert("웨잇호버")
		$('.wait_circle').css('background-color', 'white');
		$('.icon_wait').removeClass('icon_white');
		$('.icon_wait').addClass('icon_blue');




	}, function() {
		//        alert("웨잇아웃")
		$('.wait_circle').css('background-color', '#4153FF');
		$('.icon_wait').removeClass('icon_blue');
		$('.icon_wait').addClass('icon_white');


	});

	$('#collect_button_box').hover(function() {
		//        alert("웨잇호버")
		$('.collect_circle').css('background-color', 'white');
		$('.icon_collect').removeClass('icon_white');
		$('.icon_collect').addClass('icon_blue');




	}, function() {
		//        alert("웨잇아웃")
		$('.collect_circle').css('background-color', '#4153FF');
		$('.icon_collect').removeClass('icon_blue');
		$('.icon_collect').addClass('icon_white');


	});

	$('#ingA_button_box').hover(function() {
		//        alert("웨잇호버")
		$('.ingA_circle').css('background-color', 'white');
		$('.icon_ingA').removeClass('icon_white');
		$('.icon_ingA').addClass('icon_blue');




	}, function() {
		//        alert("웨잇아웃")
		$('.ingA_circle').css('background-color', '#4153FF');
		$('.icon_ingA').removeClass('icon_blue');
		$('.icon_ingA').addClass('icon_white');


	});

	$('#endA_button_box').hover(function() {
		//        alert("웨잇호버")
		$('.endA_circle').css('background-color', 'white');
		$('.icon_endA').removeClass('icon_white');
		$('.icon_endA').addClass('icon_blue');




	}, function() {
		//        alert("웨잇아웃")
		$('.endA_circle').css('background-color', '#4153FF');
		$('.icon_endA').removeClass('icon_blue');
		$('.icon_endA').addClass('icon_white');


	});


	$('#reserving_button_box').hover(function() {
		//        alert("웨잇호버")
		$('.reserve_circle').css('background-color', 'white');
		$('.icon_reserve').removeClass('icon_white');
		$('.icon_reserve').addClass('icon_blue');




	}, function() {
		//        alert("웨잇아웃")
		$('.reserve_circle').css('background-color', '#4153FF');
		$('.icon_reserve').removeClass('icon_blue');
		$('.icon_reserve').addClass('icon_white');


	});


	$('#check_button_box').hover(function() {
		//        alert("웨잇호버")
		$('.check_circle').css('background-color', 'white');
		$('.icon_check').removeClass('icon_white');
		$('.icon_check').addClass('icon_blue');




	}, function() {
		//        alert("웨잇아웃")
		$('.check_circle').css('background-color', '#4153FF');
		$('.icon_check').removeClass('icon_blue');
		$('.icon_check').addClass('icon_white');


	});

	$('#ingB_button_box').hover(function() {
		//        alert("웨잇호버")
		$('.ingB_circle').css('background-color', 'white');
		$('.icon_ingB').removeClass('icon_white');
		$('.icon_ingB').addClass('icon_blue');




	}, function() {
		//        alert("웨잇아웃")
		$('.ingB_circle').css('background-color', '#4153FF');
		$('.icon_ingB').removeClass('icon_blue');
		$('.icon_ingB').addClass('icon_white');


	});

	$('#endB_button_box').hover(function() {
		//        alert("웨잇호버")
		$('.endB_Circle').css('background-color', 'white');
		$('.icon_endB').removeClass('icon_white');
		$('.icon_endB').addClass('icon_blue');




	}, function() {
		//        alert("웨잇아웃")
		$('.endB_Circle').css('background-color', '#4153FF');
		$('.icon_endB').removeClass('icon_blue');
		$('.icon_endB').addClass('icon_white');


	});



});

/* 리스트 -> json 파서 함수 */
function listtojson(data) {


	let list = data;

	list = list.slice(1, -1);

	var cplists = list.split('},');

	var jsonlistArray = new Array();



	for (let i = 0; i < cplists.length - 1; i++) {
		cplists[i] = cplists[i] + '}'
	}


	for (let i = 0; i < cplists.length; i++) {

		jsonlistArray.push(JSON.parse(cplists[i]));
	}

	return jsonlistArray;

}


function renderLeftMenu(mainmenu, submenu) {
	var $sidebar = $("#main_sidebar");
	var $sidebar_content = $(".sidebar_menu_main");

	var max = 1;

	var html;


	for (let i = 0; i < mainmenu.length; i++) {

		var count = 1;


		html = '<div class="sidebar_main_menu">';
		html += '<div class="sidebar_main_box">'
		html += '<div class="sidebar_main_text">'
		html += '<i class=' + '"' + mainmenu[i].icon + ' menu_icon' + '"' + '>' + '</i>'
		html += mainmenu[i].name;
		html += '</div>'
		html += '</div>'
		for (let j = 0; j < submenu.length; j++) {
			if (mainmenu[i].name == submenu[j].mName) {
				html += '<div class="sidebar_sub_box"' + 'onclick=' + 'location.href=' + "'.." + '/' + 'main/search.do?keyword=' + submenu[j].name + "';" + '>'
				html += '<div class="sidebar_sub-text">'
				html += '<i class=' + '"' + submenu[j].icon + ' menu_icon' + '"' + '>' + '</i>'
				html += submenu[j].name;
				html += '</div>'
				html += '</div>'

				count = count + 1;
			}

		}

		html += '<div>';

		if (count >= max) {
			max = count;
		}

		$sidebar_content.append(html);
	}
	var height = 20 + max * 50;

	//	$("#main_sidebar").css("height", "100px");

	//	$("#main_sidebar").css("background-color", "red");


	//	alert("안료11");



}



/*문의하기 전송시*/
function inquireSend() {
	$("#inquireForm").submit();
	alert("문의하기가 성공적으로 완료되었습니다.");

}

/*알람창에서 클릭시 board*/
function selectAlarmBoard(num, num2) {

	$(document.querySelectorAll(".content_bottom div")).attr('data-no')

	document.querySelectorAll(".content_bottom div").forEach(function(e, i) {
		if ($(e).attr('data-no') == num) {
			$(e).attr('id', 'alarm_body_read');
		}
	});

	$(".content_bottom").css('display', 'none');
	$(".content_board").css('display', 'block');
	$(".alarm_nav").css('display', 'none');
	//ajax

	console.log(num2);
	var data = { inqureId: num };

	$.ajax({
		url: '/main/ajax/userAlarmBoard.do',
		data: data,
		dataType: 'json',
		contentType: "application/json; charset=utf-8",
		async: false,
		type: 'GET',
		success: function(data) {

			console.log(data.alarmBoard);

			$(".content_board_title").html('');
			$(".content_board_date").html('');
			$(".content_board_content").html('');

			$(".boardId").val(data.alarmBoard.inqureId);
			$(".alNum").val(num2);

			$(".content_board_title").html(data.alarmBoard.title);
			$(".content_board_date").html(data.alarmBoard.writeDate);
			$('.content_board_content').html(data.alarmBoard.contents);

		},
		error: function(request, status, error) {
			console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	});


}

//목록으로 돌아가기
function toAlarmList() {
	$(".content_bottom").css('display', 'block');
	$(".content_board").css('display', 'none');
	$(".alarm_nav").css('display', 'block');
	loadAlarmList(globalPageNum);
}

//목록에서 x눌렀을때 삭제
function removeAlarmbyX(num) {
	document.querySelectorAll(".content_bottom div").forEach(function(e, i) {
		console.log($(e).attr('data-no'));
		if ($(e).attr('data-no') == num) {

			var data = { inqureId: num };
			//사용자 쪽 알람삭제 ajax
			$.ajax({
				url: '/main/ajax/deleteAlarmUser.do',
				data: data,
				dataType: 'json',
				contentType: "application/json; charset=utf-8",
				async: false,
				type: 'GET',
				success: function(data) {
					//loadAlarmList(globalPageNum);
					toAlarmList();
				},
				error: function(request, status, error) {
					console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			});

		}

	});

}


//board에서 알람삭제
function removeAlarm() {

	var data = { inqureId: $(".boardId").val() };
	//사용자 쪽 알람삭제 ajax
	$.ajax({
		url: '/main/ajax/deleteAlarmUser.do',
		data: data,
		dataType: 'json',
		contentType: "application/json; charset=utf-8",
		async: false,
		type: 'GET',
		success: function(data) {
			//loadAlarmList(globalPageNum);
			toAlarmList();
		},
		error: function(request, status, error) {
			console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	});
}

function alarmLeftIcon() {

	//console.log($(".alNum").val());
	//console.log($(".boardId").val());

	var alNum = Number($(".alNum").val());
	var inqureId = Number($(".boardId").val());

	if (alNum - 1 != 0) {
		var data = {
			num: alNum - 1,
			inqureId: inqureId,
		};

		$.ajax({
			url: '/main/ajax/alarmLeftIcon.do',
			data: data,
			dataType: 'json',
			contentType: "application/json; charset=utf-8",
			async: false,
			type: 'GET',
			success: function(data) {
				$(".alNum").val(alNum - 1);

				if (alNum - 1 != 0) {
					$(".content_board_title").html('');
					$(".content_board_content").html('');
					$(".boardId").val(data.alarmBoard.inqureId);
					$(".content_board_title").html(data.alarmBoard.title);
					$('.content_board_content').html(data.alarmBoard.contents);
				}
			},
			error: function(request, status, error) {
				console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});
	}
}


function alarmRightIcon() {

	//console.log($(".alNum").val());

	var alNum = Number($(".alNum").val());
	var inqureId = Number($(".boardId").val());

	var data = {
		num: alNum + 1,
	};

	$.ajax({
		url: '/main/ajax/alarmRightIcon.do',
		data: data,
		dataType: 'json',
		contentType: "application/json; charset=utf-8",
		async: false,
		type: 'GET',
		success: function(data) {
			//console.log(data);

			if (data.totCount != $(".alNum").val()) {
				$(".alNum").val(alNum + 1);
				$(".content_board_title").html('');
				$(".content_board_content").html('');
				$(".boardId").val(data.alarmBoard.inqureId);
				$(".content_board_title").html(data.alarmBoard.title);
				$('.content_board_content').html(data.alarmBoard.contents);
			}
		},
		error: function(request, status, error) {
			console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	});
}



function prevpage() {
	var current = Number($(".pagination a.active").text());
	current--;
	if (current == 0) {
		current = 1;
	}
	loadAlarmList(current);
}

function nextpage(totalPage) {
	var current = Number($(".pagination a.active").text());
	current++;
	if (current > totalPage) {
		current = totalPage;
	}
	loadAlarmList(current);
}







