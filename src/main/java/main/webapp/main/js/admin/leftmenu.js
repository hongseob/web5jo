$(document).ready(function() {
	
	var first = 0


	var mainmenu = new Array();
	var submenu = new Array();


		//		alert("클릭확인");

		if (first == 0) {


			var data = {
			}

			//ajax 전송
			$.ajax({
				url: '/admin/ajax/getLeftMainmenu.do',
				data: data,
				dataType: 'json',
				contentType: "application/json; charset=utf-8",
				async: false,
				type: 'GET',
				success: function(data) {
					mainmenu = data;

				},
				error: function(request, status, error) {
					console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			});


			$.ajax({
				url: '/admin/ajax/getLeftSubmenu.do',
				data: data,
				dataType: 'json',
				contentType: "application/json; charset=utf-8",
				async: false,
				type: 'GET',
				success: function(data) {
					submenu = data;

				},
				error: function(request, status, error) {
					console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			});


			renderLeftMenu(mainmenu, submenu);

			first = 1;

		}




});

$(document).ready(function() {

	/* 사이드바 메뉴구성 */

	$('.sidebar_menu_button').each(function(index, item) {
		//		alert("사이드바 준비완료");
		index = index + 1;
		$(item).addClass('menu' + index);

	});

	$('.sidebar_slidedown').each(function(index, item) {
		//		alert("사이드바 준비완료");
		index = index + 1;
		$(item).addClass('slidedown' + index);

	});


});


$(function() {


	var $sidebar_menu_button = $(".sidebar_menu_button");


	$(document).on("click", ".sidebar_menu_button", function() {

		var myClasses = this.classList;


		/* 각각의 페이지네이션 번호에 따라 page+index라는 클래스를 넣어 두었다 . */

		var nowPage = String(myClasses[2][4]);
		check_ctrpage = nowPage;

		//		console.log(nowPage);

		slidedownnum = '.slidedown' + check_ctrpage;

		//		console.log(slidedownnum);

		var $slidedownnum = $(slidedownnum);

		$slidedownnum

		var duration = 300;

		$slidedownnum.toggleClass('open');


		if ($slidedownnum.hasClass('open')) {
			$slidedownnum.slideDown(duration);
		} else {
			$slidedownnum.slideUp(duration);
		};

		//		if ($icon1.hasClass('fa-chevron-down')) {
		//			$icon1.removeClass('fa-chevron-down');
		//			$icon1.addClass('fa-angle-up');
		//
		//			// bgLayerOpen();
		//		} else if ($icon1.hasClass('fa-angle-up')) {
		//			$icon1.removeClass('fa-angle-up');
		//			$icon1.addClass('fa-chevron-down');
		//		};



	});


});




/* 사이드바 메인메뉴 수정 ajax */

$(function() {

	var $mainmenu_edit = $("#mainmenu_edit");
	var $mainmenu_del = $("#mainmenu_del");
	var $mainmenu_add = $("#mainmenu_add");




	$mainmenu_edit.click(function() {

		var mainmenu = $("#select_medit option:selected").val();
		var name = $("input[name=mainmenu_name]").val();

		var icon = $("input[name=mainmenu_icon]").val();

		var id = $("input[name=mainmenu_id]").val();

		var fn = 1;

		//		console.log(mainmenu);
		//		console.log(name);
		//		console.log(icon);
		//		console.log(id);


		var data = {
			editmenuname: mainmenu,
			menuname: name,
			icon: icon,
			id: id,
			fn: fn
		}

		//ajax 전송
		$.ajax({
			url: '/admin/ajax/editSidebar.do',
			data: data,
			dataType: 'json',
			contentType: "application/json; charset=utf-8",
			async: false,
			type: 'GET',
			success: function(data) {
				alert(data);

			},
			error: function(request, status, error) {
				console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});

		location.reload();


	});


	$mainmenu_del.click(function() {

		var mainmenu = $("#select_medit option:selected").val();

		var name = $("input[name=mainmenu_name]").val();

		var icon = $("input[name=mainmenu_icon]").val();

		var id = $("input[name=mainmenu_id]").val();

		var fn = 2;


		var data = {
			editmenuname: mainmenu,
			menuname: name,
			icon: icon,
			id: id,
			fn: fn
		}

		//ajax 전송
		$.ajax({
			url: '/admin/ajax/editSidebar.do',
			data: data,
			dataType: 'json',
			contentType: "application/json; charset=utf-8",
			async: false,
			type: 'GET',
			success: function() {

			},
			error: function(request, status, error) {
				console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});

		location.reload();


	});


	$mainmenu_add.click(function() {


		var mainmenu = $("#select_medit option:selected").val();

		var name = $("input[name=mainmenu_name]").val();

		var icon = $("input[name=mainmenu_icon]").val();

		var id = $("input[name=mainmenu_id]").val();

		var fn = 3;

		var data = {
			editmenuname: mainmenu,
			menuname: name,
			icon: icon,
			id: id,
			fn: fn
		}


		//ajax 전송
		$.ajax({
			url: '/admin/ajax/editSidebar.do',
			data: data,
			dataType: 'json',
			contentType: "application/json; charset=utf-8",
			async: false,
			type: 'GET',
			success: function() {

			},
			error: function(request, status, error) {
				console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});

		location.reload();

	});

});


/* 사이드바 서브메뉴 수정 ajax */

$(function() {

	var $submenu_edit = $("#submenu_edit");
	var $submenu_del = $("#submenu_del");
	var $submenu_add = $("#submenu_add");


	$submenu_edit.click(function() {

		var editsubname = $("#select_sedit option:selected").val();
		var mainmenu = $("#s_mainmenu_name option:selected").val();
		var subname = $("input[name=s_menu_name]").val();

		var icon = $("input[name=s_menu_icon]").val();

		var id = $("input[name=s_menu_id]").val();

		var fn = 4;

		//		console.log(editsubname);
		//		console.log(mainmenu);
		//		console.log(subname);
		//		console.log(icon);


		var data = {
			editmenuname: editsubname,
			mainmenu: mainmenu,
			menuname: subname,
			icon: icon,
			id: id,
			fn: fn
		}

		//ajax 전송
		$.ajax({
			url: '/admin/ajax/editSidebar.do',
			data: data,
			dataType: 'json',
			contentType: "application/json; charset=utf-8",
			async: false,
			type: 'GET',
			success: function(data) {
				alert(data);

			},
			error: function(request, status, error) {
				console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});

		location.reload();


	});


	$submenu_del.click(function() {

		var editsubname = $("#select_sedit option:selected").val();
		var mainmenu = $("#s_mainmenu_name option:selected").val();
		var subname = $("input[name=s_menu_name]").val();

		var icon = $("input[name=s_menu_icon]").val();

		var id = $("input[name=s_menu_id]").val();

		var fn = 5;

		//		console.log(editsubname);
		//		console.log(mainmenu);
		//		console.log(subname);
		//		console.log(icon);


		var data = {
			editmenuname: editsubname,
			mainmenu: mainmenu,
			menuname: subname,
			icon: icon,
			id: id,
			fn: fn
		}

		//ajax 전송
		$.ajax({
			url: '/admin/ajax/editSidebar.do',
			data: data,
			dataType: 'json',
			contentType: "application/json; charset=utf-8",
			async: false,
			type: 'GET',
			success: function(data) {
				alert(data);

			},
			error: function(request, status, error) {
				console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});

		location.reload();


	});



	$submenu_add.click(function() {

		var editsubname = $("#select_sedit option:selected").val();
		var mainmenu = $("#s_mainmenu_name option:selected").val();
		var subname = $("input[name=s_menu_name]").val();

		var icon = $("input[name=s_menu_icon]").val();

		var id = $("input[name=s_menu_id]").val();

		var fn = 6;

		//		console.log(editsubname);
		//		console.log(mainmenu);
		//		console.log(subname);
		//		console.log(icon);


		var data = {
			editmenuname: editsubname,
			mainmenu: mainmenu,
			menuname: subname,
			icon: icon,
			id: id,
			fn: fn
		}

		//ajax 전송
		$.ajax({
			url: '/admin/ajax/editSidebar.do',
			data: data,
			dataType: 'json',
			contentType: "application/json; charset=utf-8",
			async: false,
			type: 'GET',
			success: function(data) {
				alert(data);

			},
			error: function(request, status, error) {
				console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});

		location.reload();


	});


});





/* 셀렉트박스 이벤트 ajax 값 전송 */

/*메인메뉴*/
$(function() {

	var $select_medit = $("#select_medit");
	var $mainmenu_name = $("#mainmenu_name");
	var $mainmenu_icon = $("#mainmenu_icon");
	var $mainmenu_id = $("#mainmenu_id");


	$select_medit.on("change", function() {

		//		alert("chaneg");

		var mainmenu = $("#select_medit option:selected").val();
		var menuinfo;

		//		console.log(mainmenu);


		if (mainmenu == '대메뉴 선택') {

			$mainmenu_name.val('');

			$mainmenu_icon.val('');

			$mainmenu_id.val('');

		}
		else {

			var data = {
				mainmenu: mainmenu
			}

			//ajax 전송
			$.ajax({
				url: '/admin/ajax/getmainmenuinfo.do',
				data: data,
				dataType: 'json',
				contentType: "application/json; charset=utf-8",
				async: false,
				type: 'GET',
				success: function(data) {
					menuinfo = data;

				},
				error: function(request, status, error) {
					console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			});

			//			console.log(menuinfo.icon);
			$mainmenu_name.val(menuinfo.name);

			$mainmenu_icon.val(menuinfo.icon);

			$mainmenu_id.val(menuinfo.mId);

		}

	});

});


/*서브메뉴*/
$(function() {

	var $select_sedit = $("#select_sedit");
	var $s_mainmenu_name = $("#s_mainmenu_name");
	var $s_menu_name = $("#s_menu_name");
	var $s_menu_icon = $("#s_menu_icon");
	var $s_menu_id = $("#s_menu_id");



	$select_sedit.on("change", function() {

		//				alert("chaneg");

		var submenu = $("#select_sedit option:selected").val();
		var menuinfo;

		//		console.log(mainmenu);


		if (submenu == '소메뉴 선택') {

			$s_mainmenu_name.val('');

			$s_menu_name.val('');

			$s_menu_icon.val('');

			$s_menu_id.val('');


		}
		else {

			var data = {
				submenu: submenu
			}

			//ajax 전송
			$.ajax({
				url: '/admin/ajax/getsubmenuinfo.do',
				data: data,
				dataType: 'json',
				contentType: "application/json; charset=utf-8",
				async: false,
				type: 'GET',
				success: function(data) {
					//					console.log(data);
					menuinfo = data;

				},
				error: function(request, status, error) {
					console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			});

			//			console.log(menuinfo.icon);
			$s_mainmenu_name.val(menuinfo.mName);

			$s_menu_name.val(menuinfo.name);

			$s_menu_icon.val(menuinfo.icon);

			$s_menu_id.val(menuinfo.sId);


		}

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

/* left 메뉴 구성 */

function renderLeftMenu(mainmenu, submenu) {
	var $sidebar = $(".main_sidebar");
	var $sidebar_content = $(".sidebar_menu_main");

	var html;


	for (let i = 0; i < mainmenu.length; i++) {

		html = '<div class="sidebar_main_menu">';

		html += '<div class="sidebar_main_text">'

		html += '<i class=' + '"' + mainmenu[i].icon + ' menu_icon' + '"' + '>' + '</i>'
		html += mainmenu[i].name;

		html += '</div>'

		for (let j = 0; j < submenu.length; j++) {
			if (mainmenu[i].name == submenu[j].mName) {
				html += '<div class="sidebar_sub_text">'
				html += '<i class=' + '"' + submenu[j].icon + ' menu_icon' + '"' + '>' + '</i>'
				html += submenu[j].name;
				html += '</div>'
			}

		}
		html += '<div>';


		$sidebar_content.append(html);


	}
}
