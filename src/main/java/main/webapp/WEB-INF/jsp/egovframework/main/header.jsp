<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<!--  JQUERY  -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!--  Bootstrap  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<!--  fontawesome -->
<script src="https://kit.fontawesome.com/f350009f47.js" crossorigin="anonymous"></script>
<!--  font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<div class="nav">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<!-- 홈 버튼 / 클릭시 홈으로 이동 -->

	<c:choose>
		<c:when test="${auth eq 'A' }">
			<button class="home_button icon_white btn_no" id="home_button" onClick="location.href='../mainATable.do'">
				<i class="fa-solid fa-house"></i>
			</button>
		</c:when>
		<c:when test="${auth eq 'B' }">
			<button class="home_button icon_white btn_no" id="home_button" onClick="location.href='../mainBTable.do'">
				<i class="fa-solid fa-house"></i>
			</button>
		</c:when>
	</c:choose>


	<!-- 사이드 메뉴 버튼 / 클릭시 사이드 메뉴 슬라이드-->
	<button class="sidemenu_button icon_white btn_no">
		<i class="fa-solid fa-list"></i>
	</button>

	<!-- 캠페인 추가   -->

	<!-- <div class="nav_blank1"></div> -->

	<c:set var="auth" value="${auth}" />

	<c:choose>
		<c:when test="${auth eq 'A' }">
			<button class="campaign_plus_button button_effect2 icon_white btn_no" id="plus_button">
				<i class="fa-solid fa-circle-plus"></i> <span class="newcamp">새 캠페인</span>
			</button>
		</c:when>
		<c:when test="${auth eq 'B' }">
			<button class="campaign_plus_button button_effect2 icon_white btn_no" id="new_mento">
				<i class="fa-solid fa-id-badge"></i> <span class="newcamp">멘토 등록</span>
			</button>
		</c:when>
	</c:choose>



	<!-- 캠페인 검색-->

	<div class="campaign_searchbar_box">
		<form type="hidden" action="/main/search.do" method="get">
			<input class="campaign_searchbar" id="campaign_searchbar" name="keyword" required="required" onkeyup="filter()" id="value" type="text" placeholder="캠페인 검색" />
			<button type="submit" class="campaign_search_button" id="campaign_search_button">
				<i class="fa fa-search campaign_search_icon icon_black" aria-hidden="true"></i>
			</button>
		</form>
	</div>

	<div class="nav_blank2"></div>




	<!-- 이메일 버튼 / 클릭시 문의 창 팝업   -->

	<button class="email_icon icon_white btn_no" data-toggle="modal" data-target="#inquireModal" href="#" data-popup-open="example">
		<i class="fa-solid fa-square-envelope"></i>
	</button>


	<!-- 알림 버튼 / 클릭시 알림 창 슬라이드 다운  -->

	<button class="notice_icon icon_white btn_no">
		<i class="fa-solid fa-bell"></i> <span class="alarmCount">${alarmCount}</span>
	</button>



	<!-- 로그인 버튼 / 클릭시 로그인 상태창과 로그인 디테일 상태창 토글  -->

	<c:choose>
		<c:when test="${auth eq 'A'}">
			<button class="idstatus_button_main btn_no">${userId}</button>
			<div class="idstatus_button_detail idstatus_button_open">
				<button class="idstatus btn_no">${userId}</button>
				<button class="member_info btn_no" id="member_change_auth" onclick="location.href='/mainATable.do' ">멘토 페이지</button>
				<button class="member_info btn_no" id="member_change_auth" onclick="location.href='/mainBTable.do' ">학생 페이지</button>
				<button class="member_info btn_no" id="member_info_modify_btn">회원정보수정</button>
				<button class="member_info btn_no" onClick="location.href='/main/credit.do'">크레딧 충전</button>
				<form type="hidden" action="/logout.do?_csrf=${_csrf.token }" method="post">
					<button type="submit" class="logout btn_no">로그아웃</button>
				</form>
			</div>
		</c:when>
		<c:when test="${auth eq 'B'}">
			<button class="idstatus_button_main btn_no">${userId}</button>

			<div class="idstatus_button_detail idstatus_button_open">
				<button class="idstatus btn_no">${userId}</button>
				<button class="member_info btn_no" id="member_info_modify_btn">회원정보수정</button>
				<button class="member_info btn_no" onClick="location.href='/main/credit.do'">크레딧 충전</button>
				<form type="hidden" action="/logout.do?_csrf=${_csrf.token }" method="post">
					<button type="submit" class="logout btn_no">로그아웃</button>
				</form>
			</div>
		</c:when>
	</c:choose>


	<!-- 회원정보수정 사이드 팝업 창 -->
	<div class="sub-window shadow" id="member_info_modify">
		<div class="fixed-window12">
			<a type="button" class="closebtn" id="closebtn1" aria-label="Close"> <span>&times;</span>
			</a>
		</div>
		<div class="create-window-part-info-modify">
			<div class="form-group">
				<div class="member_info_modify_font">
					<b class="ml-4">회원정보 수정</b>
				</div>
				<br>
				<div class="member_info_modify_welcome">
					<p class="ml-4">
						<c:choose>
							<c:when test="${auth eq 'A' }">
								연락처, 주소 혹은 회사 및 부서가 바뀌었을 경우<br>해당 정보를 수정해주세요.
							</c:when>
							<c:when test="${auth eq 'B' }">
								연락처 혹은 주소가 바뀌었을 경우<br>해당 정보를 수정해주세요.
							</c:when>
						</c:choose>
					</p>
				</div>
				<div class="ml-4 modify_userId">${userId}</div>
				<br>
				<form id="member_info_modify_form" name="member_info_modify_form" action="/member/change/modifyInfo.do?_csrf=${_csrf.token }" method="POST">
					> <input type="hidden" id="pwChange_id" name="pwChange_id" value="${userId}">
					<div class="info_body mb-3">
						<div class="mb-2 ml-1">

							<div class="float-left w-100 mb-2">
								<input type="password" class="form-control input-underline" id="change_pw" name="change_pw" placeholder="비밀번호 (6자리이상 소문자/숫자/특수기호를 사용해주세요)">
							</div>

							<div class="float-left w-100 mb-2">
								<input type="password" class="form-control input-underline" id="change_pwchk" name="change_pwchk" placeholder="비밀번호 재입력">
							</div>
							<c:if test="${auth eq 'A' }">
								<div class="float-left w-60 mb-2 pr-1">
									<input type="text" class="form-control input-underline" id="cNm" name="cNm" placeholder="회사명">
								</div>
	
								<div class="float-left w-40 mb-2 pl-1">
									<select id="cCtgrNo" name="cCtgrNo" class="form-select input-underline">
										<option value=0>category</option>
										<option value=1>사기업</option>
										<option value=2>공기업</option>
										<option value=3>프리랜서</option>
										<option value=4>개인</option>
									</select>
								</div>
							</c:if>

							<div class="float-left w-100 mb-2">
								<input type="text" class="form-control input-underline" id="uHp" name="uHp" placeholder="휴대전화 (-를 제외하고 입력해 주세요)" required>
							</div>

							<div class="float-left w-100 mb-2 address_input_form">
								<input type="text" id="uAddr" name="uAddr" class="form-control input-underline" placeholder="주소를 입력하세요" readonly> <input type="hidden" name="uLonX" id="uLonX"> <input type="hidden" name="uLatY" id="uLatY">
								<div class="float-left address_find_btn_form">
									<a class="form-control w-100 float-left text-center address_find_btn" id="addressSearch" onclick="sample6_execDaumPostcode()">검색</a>
								</div>
							</div>
						</div>
					</div>
				</form>
				<div class="float-left w-100 mt-4">
					<button class="btn1 btm-primary-login btn-lg btn-no-radius w-40 font-11" id="submit_info_modify_form">확인</button>
				</div>
			</div>
		</div>
	</div>


	<!-- <div class="nav_blank"></div> -->



	<!-- 알림  슬라이드 다운 입니다. -->

	<div class="slide_down">
		<div class="content">
			<div class="slide_down_headbar">
				<div class="slide_down_headbar_text">알림</div>
				<!-- <div class="slide_down_headbar_blank"></div> -->
				<button class="slide_down_headbar_xbutton btn_no">
					<i class="fa-solid fa-x alarmList_X"></i>
				</button>
			</div>
			<hr class="alarmHr">

			<!-- 			<div class="alarm_title">알림 타이틀</div> -->

			<!-- 			<div class="alarm_body">알림 바디</div> -->
			<div class="content_bottom">
				<!-- 				<div id="alarm_body" style="position:relative; border: 1px solid black; height: 60px; border-radius: 7px 10px 7px 10px; margin:10px;">
					<i id="alarm_bottom_x" class="fa-solid fa-x"></i>
					<div class="alarm_title_inner">제목</div>
					<div class="alarm_content_inner">내용</div>
				</div> -->
			</div>

			<div class="content_board">
				<input class="boardId" type="hidden" value="" /> <input class="alNum" type="hidden" value="" />
				<div class="content_board_title"></div>
				<div class="content_board_content"></div>
				<div class="content_board_date"></div>
				<div class="content_buttonBox">
					<span class="leftArrow" onclick="alarmLeftIcon()"> <i class="fa-solid fa-chevron-left">&nbsp;이전</i>
					</span>
					<button class="to_content_bottom" onclick="toAlarmList()">목록</button>
					|
					<button class="to_content_bottom" onclick="removeAlarm()">삭제</button>
					<span class="rightArrow" onclick="alarmRightIcon()"> 다음&nbsp;<i class="fa-solid fa-chevron-right"></i>
					</span>
				</div>
			</div>


			<div class="alarm_nav">
				<!-- 				<div class="alarm_blank"></div>
<				<div class="alarm_button_box">
					<button class="alarm_button btn_no">
						<i class="fa-solid fa-circle-arrow-left"></i>
					</button>
				</div>
				<div class="alarm_button_box">
					<button class="alarm_button btn_no">
						<i class="fa-solid fa-circle-arrow-right"></i>
					</button>
				</div>
				<div class="alarm_blank"></div> -->
				<div class="pagination"></div>
				<div></div>
			</div>

		</div>
	</div>
</div>
<!-- 문의하기 modal -->

<div class="modal fade" id="inquireModal" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-labelledby="inquireModalLabel" aria-modal="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content no-border-radius">
			<div class="modal-header no-border-bottom">
				<h2 class="modal-title mx-auto fw-bold" id="inquireModalLabel">문의하기</h2>
			</div>
			<div class="modal-body">
				<form id="inquireForm" action="/main/inquire.do?_csrf=${_csrf.token }" method="post" name="inquireForm">
					<div class="container-fluid">
						<!-- 						<div class="row">
							<div class="col-2 no-padding-right">
								<p class="inquire-p">ID(이메일)</p>
							</div>
							<div class="col-10 form-group">
								<input type="email" class="form-control no-border-radius border-color-primary" id="inq-email" name="email" aria-describedby="emailHelp">
							</div>
						</div> -->
						<div class="row">
							<div class="col-2 no-padding-right">
								<p class="inquire-p">제목</p>
							</div>
							<div class="col-10 form-group">
								<input type="text" class="form-control no-border-radius border-color-primary" id="inq-title" name="title" aria-describedby="titleHelp">
							</div>
						</div>
						<div class="row">
							<div class="col-2 no-padding-right">
								<p class="inquire-p">내용</p>
							</div>
							<div class="col-10 form-group">
								<textarea class="form-control no-border-radius border-color-primary" id="inq-contents" name="contents" rows="5"></textarea>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer no-border-top">
				<div class="w-50 mx-auto mb-3">
					<!-- <div class="mx-auto"> -->
					<button type="button" data-dismiss="modal" aria-label="Close" class="btn btn-secondary bg-secondary w-45 btn-no-radius float-left">닫기</button>
					<button type="button" id="inquireSubmit" class="btn btn-primary bg-primary w-45 btn-no-radius float-right" onclick="inquireSend()">보내기</button>
					<!-- <button type="button" id="inquireSubmit" class="btn btn-primary bg-primary btn-no-radius float-right" style="widtd: 90px">확인</button> -->
				</div>
			</div>
		</div>
	</div>
</div>