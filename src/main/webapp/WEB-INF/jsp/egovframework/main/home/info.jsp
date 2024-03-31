<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<!-- nav 회원정보 수정 관련 css -->
<link rel="stylesheet" href="/index/lib/openlayers/css/ol.css"/>
<link rel="stylesheet" href="/index/lib/bootstrap/css/bootstrap.css"/>
<link rel="stylesheet" href="/css/egovframework/main/navInfoModify.css" type='text/css'>
<!-- index.css는 문의하기 관련된 코드 분리하는대로 없앨 예정 -->
<link rel="stylesheet" href="/css/egovframework/index/index.css"/>
<!-- CSS -->

<!-- <link rel="stylesheet" href="/css/egovframework/main/body.css">
<link rel="stylesheet" href="/css/egovframework/main/nav.css">
<link rel="stylesheet" href="/css/egovframework/main/sidebar.css">
<link rel="stylesheet" href="/css/egovframework/main/navevent.css">
<link rel="stylesheet" href="/css/egovframework/main/footernav.css">
<link rel="stylesheet" href="/css/egovframework/main/button.css">
<link rel="stylesheet" href="/css/egovframework/main/main.css"> -->

<link rel="stylesheet" href="/css/egovframework/main/campaigncard.css" type='text/css'>
<link rel="stylesheet" href="/css/egovframework/main/main.css" type='text/css'>


<link rel="stylesheet" href="/css/egovframework/main/info/stepperbar.css">
<link rel="stylesheet" href="/css/egovframework/main/info/button.css">
<link rel="stylesheet" href="/css/egovframework/main/info/info.css">

<!-- <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/25990c746d.js" crossorigin="anonymous"></script>
</head>

<body style="background-color: #edf2f9; font-family: 'Noto Sans KR', sans-serif;">

	<%@ include file="../header.jsp"%>
	<%@ include file="../leftMenu.jsp"%>

	<!-- 캠페인 INFO MAIN 창 -->
	<main>
	<div class="container-fluid p-5">
		<div class ="campaignNameBox">
			<div class="campaignName">
				캠페인 이름
			</div>
		</div>
		<!-- 캠페인 Overview  -->
		<div class="overview_box mb-2">
			<div class="box_name">Overview</div>
			<!-- 캠페인 진행바 -->
			<div class="overview_progress">
				<div class="row">
					<div class="col-md-2" style="padding: 0;">
						<div class="status">
							<div class="shadow stepView">
								<i id="status_icon" class=""></i>
								<div id="status_name">캠페인확정</div>
							</div>		
						</div>
					</div>
					<div class="col-md-10" style="padding: 10px 0 0 15px;">
						<div class="stepper-wrapper">
							<div id="step1" class="stepper-item">
								<div class="shadow step-counter">
									<div class="step-nameNum">1</div>
									<div class="step-lineBox">
										<div class="step-line"></div>
									</div>
									<div id="stepName1" class="step-name">생성</div>
								</div>		
							</div>
							<div id="step2" class="stepper-item">
								<div class="shadow step-counter">
									<div class="step-nameNum">2</div>
									<div class="step-lineBox">
										<div class="step-line"></div>
									</div>
									<div id="stepName2" class="step-name">예약중</div>
								</div>
							</div>
							<div id="step3" class="stepper-item">
								<div class="shadow step-counter">
									<div class="step-nameNum">3</div>
									<div class="step-lineBox">
										<div class="step-line"></div>
									</div>
									<div id="stepName3" class="step-name" style="white-space: nowrap">캠페인확정</div>
								</div>
							</div>
							<div id="step4" class="stepper-item">
								<div class="shadow step-counter">
									<div class="step-nameNum">4</div>
									<div class="step-lineBox">
										<div class="step-line"></div>
									</div>
									<div id="stepName4" class="step-name">진행중</div>
								</div>
							</div>
	 							<div id="step5" class="stepper-item" style="width: 150px;">
								<div class="shadow step-counter">
									<div class="step-nameNum">5</div>
									<div class="step-lineBox">
										<div class="step-line"></div>
									</div>
									<div id="stepName5" class="step-name">종료</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 캠페인 오버뷰 리스트 -->
			<div class="overview_list row">
				<!-- 일정 -->
				<div class="overview_card col-xl-3 col-md-6">
					<div class="card ovCard red border-left-primary shadow h-100">
						<div class="card-hearder ovCardhd">
							<span class="ovCard-text text-muted">일정</span>
						</div>
						<div class="card-body pt-0">
 							<div class="ovCardView">
								<div class="ovViewBox">
									<div style="height:10px;"></div>
									<span class='h4 cpnStart'>2022.08.01</span>
									<span class='h5'>~</span>
									<div class='h4 cpnEnd' style="margin-bottom: 0;">2022.08.30</div>
								</div>
								<div class="ovIconBox">
									<div class="ovIcon">
										<span class="ovCard-icon bi bi-calendar2-check-fill"> </span>
									</div>
								</div>	
							</div>
						</div>
					</div>
				</div>

				<!-- 금액 -->
				<div class="overview_card col-xl-3 col-md-6">
					<div class="card ovCard cyan border-left-primary shadow h-100">
						<div class="card-hearder ovCardhd">
							<span class="ovCard-text text-muted">금액</span>
						</div>
						<div class="card-body pt-0">
							<div class="ovCardView">
								<div class="ovViewBox" style="white-space: nowrap;">
									<span class="campaignEstimateSort h5"></span>
									<span class='h4 campaignEstimateValue'>1,000,000</span>
									<span class='h5'> 원</span>
								</div>
								<div id="test" class="ovIconBox">
									<div class="ovIcon">
										<span class="ovCard-icon fa fa-krw"> </span>
									</div>
								</div>	
							</div>
						</div>
					</div>
				</div>

				<!-- 참여 인원 -->
				<div class="overview_card col-xl-3 col-md-6">
					<div class="card ovCard orange border-left-primary shadow h-100">
						<div class="card-hearder ovCardhd" style="padding-bottom: 0.5rem;">
							<span class="ovCard-text text-muted">참여인원</span>
						</div>
						<div class="card-body pt-0">
							<div class="ovCardView">
								<div class="ovViewBox">
									<div style="margin-bottom: 5px;">
										<span class="h4 cpnPnum">100</span>
										<span class="h5">명</span>
									</div>
									<div class="btn-group meeting_btn_group">
										<button id='meetBtn' type="button" class="meeting_btn">
											<i class="bi bi-people-fill"></i> 대면
										</button>
										<button id='notMeetBtn' type="button" class="meeting_btn">
											<i class="bi bi-person-workspace"> </i> 비대면
										</button>
									</div>
								</div>
								<div class="ovIconBox">
									<div class="ovIcon">
										<span class="ovCard-icon bi bi-people-fill"> </span>
									</div>
								</div>	
							</div>
						</div>
					</div>
				</div>

				<!-- 연락처 -->
				<div class="overview_card col-xl-3 col-md-6">
					<div class="card ovCard blue border-left-primary shadow h-100">
						<div class="card-hearder ovCardhd">
							<span class="ovCard-text text-muted">연락처</span>
						</div>
						<div class="card-body pt-0">
							<div class="ovCardView">
								<div class="ovViewBox">
									<div>
										<span style="font-weight: bold;">멘토</span>
										<span class="campaignCreater">생성자
											
										</span>
										<button id="mentorReviewButton" class="reviewButton">
											<i class="fa fa-star"></i>
											<span id="reviewGrade">리뷰없음</span>
										</button>
									</div>
									<div>
										<div style="font-weight: bold;">안심번호</div>
										<div class="phonenumber">010-0000-0000</div>
									</div>
								</div>
								<div class="ovIconBox">
									<div class="ovIcon">
										<span class="ovCard-icon bi bi-chat-dots-fill"> </span>
									</div>
								</div>	
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="sectorLine">
		</div>
		<!-- 캠페인 Targeting & Image -->
		<div class="row">
			<div class="col-xl-3 mb-3">
				<div class="box_name">Targeting</div>
				<div>
					<!-- 인증 -->
					<div class="card ovCard2 shadow py-2 mb-2">
						<div class="card-hearder py-2 px-3">
							<div style="justify-content: space-between;">
								<span class="h5 text-muted">자격증 / 포트폴리오</span>
								<span style="float: right;">
								 <a id="allDownload" class="allDownlaodButton">
								 	<i class="fa-solid fa-cloud-arrow-down"></i>
								</a>
								</span>
							</div>
						</div>
						<div class="card-body align-item-center justify-content-center py-1">
							<table class="table table-scripted table-hover" style="table-layout: fixed">
								<thead>
									<tr>
										<th style="width: 55%;">File</th>
										<th style>date</th>
										<!-- <th style="width: 12%;"></th> -->
									</tr>
								</thead>
								<tbody id="fileBox">
									
								</tbody>
							</table>
						</div>
					</div>
					<!-- 캠페인 태그 -->
					<div class="card ovCard2 shadow py-2 mb-2">
						<div class="card-hearder py-2 px-3">
							<div class="h5 text-muted">캠페인 태그</div>
						</div>
						<div id="categoryList" class="card-body py-2">
							
						</div>
					</div>
					<!-- 대면 캠페인 범위   OR  비대면 링크 -->
					<div class="card ovCard2 range_card shadow pt-2 mb-2" style="height: 220px;">
						<div class="card-hearder py-2 px-3">
							<div class="h5 text-muted participation">대면 캠페인 범위</div>
						</div>
						<div class="card-body range_body py-2">
							<div id="range1" class="outrange">
								<div>
									<i class="bi bi-arrow-up"></i>
								</div>
								<div class="range_value">200M</div>
								<div>
									<i class="bi bi-arrow-down"></i>
								</div>
							</div>
							<div id="range2" class="range">
								<span id="addressMap" class="address">경기 고양시 덕양구 화산로 105</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-9 mb-3">
				<div id="imageAndMap" class="box_name">Image</div>
				<div class="card ovCard3 border-left-primary shadow py-0" style="height: 92.2%;">
					<div id="img_body" class="card-body py-0 px-0">
<!-- 						<img id="campaignImage" class="campaign_image" src="" alt="사진"> -->
					</div>
				</div>
			</div>
		</div>		
		
		<div class="sectorLine">
		</div>
		<!-- 캠페인 Info & Calender-->
		<div class="row">
			<!-- 캠페인 Info -->
			<div class="col-xl-9 mb-5">
				<div class="box_name">Campaign Info</div>
				<div class="card ovCard3 border-left-primary shadow py-2">
					<div class="card-body" style="height: 500px;">
						<div class="campaign_Info">
							
						</div>
					</div>
				</div>
			</div>
			<!-- 캠페인 Calender -->
			<div class="col-xl-3 mb-5">
				<div class="box_name" style="white-space: nowrap;">Campaign Calender</div>
				<div class="card ovCard4 border-left-primary shadow">
					<div class="calenderTitle">Opening Hours</div>
					<div class="campaign_Calender_Body">
						<table class="table" style="margin: 0;">
							<tbody id="calenderListBox">
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		
		
		<form id="goApplyListPage" action="/main/apply.do" method="get">
			<input type="hidden" id="campaignId" name="campaignId" value="${cId}">
		</form>
		<form id="goReviewPage" action="/main/review.do" method="get">
			<input type="hidden" id="campaignId2" name="campaignId" value="${cId}">
		</form>
		<form id="goMentorReviewPage" action="/main/mentorReview.do" method="get">
			<input type="hidden" id="mentorPkId" name="mentorPkId" value="">
		</form>
		
		<div class="buttonField">
			<div id="applyButtonBox" class="applyButtonBox">
				<a id="applyButton" class="btn btn-secondary applybutton lift" role="button" aria-pressed="true"> 캠페인 신청 </a>
			</div>
			<div id="modifyButtonBox" class="modifyButtonBox">
				<form action="/main/modify.do" method="get">					<input type="hidden" id="campaignId" name="campaignId" value="${cId}">
					<button id="go_modify_btn" type="submit">캠페인 수정하기</button>
				</form>
			</div>
		</div>
	</div>

	</main>
	
	<script language=JavaScript>
		let campaignInfo = new Array();
		campaignInfo.push({
			id: "${cId}",
			auth: "${auth}",
			createrCheck : "${createrCheck}",
			applyCheck : "${applyCheck}",
			applyStatus : "${applyStatus}",
		});
	</script>
	
</body>
<!-- kakao api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4cd6acb67135d6b60671b0b2bb4257cb&libraries=services"></script>

<!-- nav 회원정보 수정 관련 js -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4cd6acb67135d6b60671b0b2bb4257cb&libraries=services"></script>
<script src="/index/lib/crypto/core.min.js"></script>
<script src="/index/lib/crypto/sha256.min.js"></script>
<script src="/main/js/main/navInfoModify.js"></script>
<script src="/main/js/main/jquery.js"></script>
<script src="/index/lib/jquery/jquery.validate.min.js"></script>

<!-- js -->
<script src="/index/lib/openlayers/js/ol.js"></script>
<script src="/main/js/main/campaignInfo.js"></script>
<script src="/main/js/main/main.js"></script>
<script src="/main/js/main/info/jqeury.table.min.js"></script>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script> -->
<!-- <script src="https://kit.fontawesome.com/f350009f47.js" crossorigin="anonymous"></script> -->
<!-- <script src="resources/JS/main.js"></script> -->

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js"></script> -->
</html>