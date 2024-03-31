<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="/css/egovframework/admin/app.css" rel="stylesheet" type='text/css'>
<link href="/css/egovframework/admin/styles.css" rel="stylesheet" type='text/css'>
<link href="/css/egovframework/admin/sidebar.css" rel="stylesheet" type='text/css'>


<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="shortcut icon" href="img/icons/icon-48x48.png" />
<link rel="canonical" href="https://demo-basic.adminkit.io/" />
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">

<script src="https://kit.fontawesome.com/f350009f47.js" crossorigin="anonymous"></script>



</head>
<body>

	<div class="wrapper">
		<%@ include file="sidebar.jsp"%>
		<div class="main">
			<%@ include file="adminHeader.jsp"%>
			<main class="content">
			<div class="container-fluid p-0">


				<div class="out_box">

					<div class="sidebar_show">
						<%@ include file="../leftMenu.jsp"%>
					</div>

					<div class="sidebar_blank"></div>

					<div class="sidebar_edit">

						<div class="sidebar_nav">

							<div class="sidebar_text_2">Edit SIDEBAR</div>

							<div class="menu_info">대메뉴 수정</div>
							<div class="menu_info">소메뉴 수정</div>


							<div class="mainmenu-edit">

								<div class="menu">
									<select name="mainmenu" id="select_medit">
										<option value="대메뉴 선택">대메뉴 선택</option>
										<c:forEach var="item" items="${mainmenu}">
											<option value=${item.name}>${item.name}(${item.mId})</option>
										</c:forEach>
									</select>
								</div>

								<div class="menu">
									<div class="menu_name">메뉴 이름</div>
									<div class="menu_diff_input">
										<input type="TEXT" Name="mainmenu_name" id="mainmenu_name">
									</div>
								</div>
								<div class="menu">
									<div class="menu_icon">메뉴 아이콘</div>
									<div class="menu_diff_input">
										<input type="TEXT" Name="mainmenu_icon" id="mainmenu_icon">
									</div>
								</div>
								<div class="menu">
									<div class="menu_id">우선순위(id)</div>
									<div class="menu_diff_input">
										<input type="TEXT" Name="mainmenu_id" id="mainmenu_id">
									</div>
								</div>

								<div class="menu">
									<button class="btn_no" id="mainmenu_add">추가</button>
									<button class="btn_no" id="mainmenu_edit">수정</button>
									<button class="btn_no" id="mainmenu_del">삭제</button>
								</div>

							</div>

							<div class="mainmenu-edit">


								<div class="menu">
									<select name="submenu" id="select_sedit">
										<option value="소메뉴 선택">소메뉴 선택</option>
										<c:forEach var="item" items="${submenu}">
											<option value=${item.name}>${item.name}(${item.sId})</option>
										</c:forEach>
									</select>
								</div>

								<div class="menu">
									<select name="mainmenu" id="s_mainmenu_name">
										<option value="대메뉴 선택">대메뉴 선택</option>
										<c:forEach var="item" items="${mainmenu}">
											<option value=${item.name}>${item.name}(${item.mId})</option>
										</c:forEach>
									</select>
								</div>

								<div class="menu">
									<div class="menu_name">메뉴 이름</div>
									<div class="menu_diff_input">
										<input type="TEXT" Name="s_menu_name" id="s_menu_name">
									</div>
								</div>
								<div class="menu">
									<div class="menu_icon">메뉴 아이콘</div>
									<div class="menu_diff_input">
										<input type="TEXT" Name="s_menu_icon" id="s_menu_icon">
									</div>
								</div>
								<div class="menu">
									<div class="menu_id">우선순위(id)</div>
									<div class="menu_diff_input">
										<input type="TEXT" Name="s_menu_id" id="s_menu_id">
									</div>
								</div>

								<div class="menu">
									<button class="btn_no" id="submenu_add">추가</button>
									<button class="btn_no" id="submenu_edit">수정</button>
									<button class="btn_no" id="submenu_del">삭제</button>
								</div>

							</div>


							<div class="mainmenu-edit"></div>

						</div>

						<div></div>
					</div>


				</div>

			</div>
			</main>

			<%@ include file="adminFooter.jsp"%>
		</div>
	</div>

	<script src="/main/js/admin/app.js"></script>
	<script src="/main/js/admin/leftmenu.js"></script>



	<script src="/main/js/admin/adminIndex.js"></script>
	<script src="/main/js/admin/userMenu1.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4cd6acb67135d6b60671b0b2bb4257cb&libraries=services"></script>


</body>
</html>