<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<!-- nav 회원정보 수정 관련 css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous" />
<link rel="stylesheet" href="/index/lib/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" href="/css/egovframework/main/navInfoModify.css" type='text/css'>
<!-- index.css는 문의하기 관련된 코드 분리하는대로 없앨 예정 -->
<link rel="stylesheet" href="/css/egovframework/index/index.css" />
<!-- main 관련 css -->
<link rel="stylesheet" href="/css/egovframework/main/campaigncard.css" type='text/css'>
<link rel="stylesheet" href="/css/egovframework/main/main.css" type='text/css'>

</head>

<body class="body">

	<%@ include file="../header.jsp"%>
	<%@ include file="../leftMenu.jsp"%>



	<div class="main">
		<!-- 캠페인 상태 슬로건 창 -->
		<div class="campaign_status">
			<div class="slogan_blank"></div>
			<p class="slogan">CAMPAIGN STATUS</p>
		</div>
		<!-- 캠페인 현황 카드표 A유저 , B유저 나뉘어짐  -->

		<div class="c_status_button_box_collection">

			<div class="c_status_blank"></div>

			<c:choose>
				<c:when test="${gStnum eq 2 }">
					<div class="c_status_button_box btn_1 first hover" id="wait_button_box" onclick="location.href='../mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}&galleryStauts=1';">
						<div class="c_status_icon">
							<div class="c_stauts_circle wait_circle">
								<i class="icon_wait fa-solid fa-pause fa-2x icon_white"></i>
							</div>
						</div>
						<div class="c_status_detail" id="applying_button">
							<div class="c_status_text">반려중인 캠페인</div>
							<div class="c_status_number">${campaignwaitCount}</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="c_status_button_box btn_1 first hover" id="wait_button_box" onclick="location.href='../mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}&galleryStauts=2';">
						<div class="c_status_icon">
							<div class="c_stauts_circle wait_circle">
								<i class="icon_wait fa-solid fa-pause fa-2x icon_white"></i>
							</div>
						</div>
						<div class="c_status_detail" id="applying_button">
							<div class="c_status_text">반려중인 캠페인</div>
							<div class="c_status_number">${campaignwaitCount}</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>

			<c:choose>
				<c:when test="${gStnum eq 4 }">
					<div class="c_status_button_box btn_1 first hover" id="collect_button_box" onclick="location.href='../mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}&galleryStauts=3';">
						<div class="c_status_icon">
							<div class="c_stauts_circle collect_circle">
								<i class="icon_collect fa-regular fa-calendar-minus fa-2x icon_white"></i>
							</div>

						</div>
						<div class="c_status_detail" id="applying_button">
							<div class="c_status_text">모집중인 캠페인</div>
							<div class="c_status_number">${campaigncollectCount}</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="c_status_button_box btn_1 first hover" id="collect_button_box" onclick="location.href='../mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}&galleryStauts=4';">
						<div class="c_status_icon">
							<div class="c_stauts_circle collect_circle">
								<i class="icon_collect fa-regular fa-calendar-minus fa-2x icon_white"></i>
							</div>

						</div>
						<div class="c_status_detail" id="applying_button">
							<div class="c_status_text">모집중인 캠페인</div>
							<div class="c_status_number">${campaigncollectCount}</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>



			<div class="c_status_blank_1100"></div>

			<div class="c_status_blank_1100"></div>

			<c:choose>
				<c:when test="${gStnum eq 6}">
					<div class="c_status_button_box btn_1 first hover" id="ingA_button_box" onclick="location.href='../mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}&galleryStauts=5';">
						<div class="c_status_icon">
							<div class="c_stauts_circle ingA_circle">
								<i class="icon_ingA fa-solid fa-arrows-rotate fa-2x icon_white"></i>
							</div>
						</div>
						<div class="c_status_detail" id="applying_button">
							<div class="c_status_text">진행중인 캠페인</div>
							<div class="c_status_number">${campaigningCountforA}</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="c_status_button_box btn_1 first hover" id="ingA_button_box" onclick="location.href='../mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}&galleryStauts=6';">
						<div class="c_status_icon">
							<div class="c_stauts_circle ingA_circle">
								<i class="icon_ingA fa-solid fa-arrows-rotate fa-2x icon_white"></i>
							</div>
						</div>
						<div class="c_status_detail" id="applying_button">
							<div class="c_status_text">진행중인 캠페인</div>
							<div class="c_status_number">${campaigningCountforA}</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>

			<c:choose>
				<c:when test="${gStnum eq 8}">
					<div class="c_status_button_box btn_1 first hover" id="endA_button_box" onclick="location.href='../mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}&galleryStauts=7';">
						<div class="c_status_icon">
							<div class="c_stauts_circle endA_circle">
								<i class="icon_endA fa-regular fa-flag fa-2x icon_white"></i>
							</div>
						</div>
						<div class="c_status_detail" id="applying_button">
							<div class="c_status_text">종료된 캠페인</div>
							<div class="c_status_number">${campaignendCountforA}</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="c_status_button_box btn_1 first hover" id="endA_button_box" onclick="location.href='../mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}&galleryStauts=8';">
						<div class="c_status_icon">
							<div class="c_stauts_circle endA_circle">
								<i class="icon_endA fa-regular fa-flag fa-2x icon_white"></i>
							</div>
						</div>
						<div class="c_status_detail" id="applying_button">
							<div class="c_status_text">종료된 캠페인</div>
							<div class="c_status_number">${campaignendCountforA}</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>

			<div class="c_status_blank"></div>

		</div>



		<!-- 캠페인 리스트 네비게이션 -->
		<div class="campaign_list_nav">
			<div class="c_list_blank"></div>
			<div class="campaign_list_nav_content">
				<div class="slogan_nav">CAMPAIGN LIST</div>
				<div class="c_list_content_blank_2"></div>
				<div class="campaign_list_nav_button">
					<button class="change_gallery icon_black btn_no">
						<i class="fa-solid fa-border-all "></i>
					</button>
				</div>
				<div class="campaign_list_nav_button ">
					<button class="change_list icon_black btn_no" onclick="location.href='../mainATable.do';">
						<i class="fa-solid fa-bars "></i>
					</button>
				</div>
			</div>
			<div class="c_list_blank_2"></div>
		</div>

		<form id="goInfoPage" action="/main/info.do" method="get">
			<input type="hidden" id="campaignId" name="campaignId">
		</form>



		<!--  갤러리형 페이지 시작 , 권한에 따라서 페이지 나눔  -->
		<div class="campaign_list_gallery">
			<div class="campaign_list_gallery_collection" id="gallery_loading">

				<c:choose>
					<c:when test="${campaignwaitCount==0}">
						<div class="campaign_list_gallery_bar">
							<div class="c_list_blank"></div>
							<div class="campaign_list_gallery_icon">
								<i class="fa-solid fa-circle-dot icon_gray"></i>
							</div>
							<div class="campaign_list_gallery_title">반려중인 캠페인</div>
						</div>
						<div class="campaign_list_gallery_content gallery_content_empty">
							<i class="fa-solid fa-period"></i>
							<div class="campaign_list_table_main_icon">
								<i class="fa-solid fa-x fa-3x icon_white"></i>
							</div>
							<div class="campaign_list_table_main_text">캠페인이 존재하지 않습니다.</div>
						</div>
					</c:when>

					<c:otherwise>
						<div class="campaign_list_gallery_bar">
							<div class="c_list_blank"></div>
							<div class="campaign_list_gallery_icon">
								<i class="fa-solid fa-circle-dot icon_gray"></i>
							</div>
							<div class="campaign_list_gallery_title">반려중인 캠페인</div>
						</div>
						<div class="campaign_list_gallery_content">
							<c:set var="count" value="0" />
							<c:forEach items="${gallerynwaitBoard}" var="list" varStatus="status">
								<c:if test="${list.cSt eq 0}">
									<c:set var="count" value="${count + 1}" />
									<c:set var="result" value="${count % 3}" />
								</c:if>
								<c:choose>
									<c:when test="${list.cSt eq 0 && result==1}">

										<div class="campaign_list_gallery_card shadow waitIndex${status.index} loadingCard" id="wait_firstCard">
											<input type="hidden" id="waitCampaignId${status.index}" name="campaignId" value="${list.cId}">
											<div class="gallery_card_nav">
												<div class="gallery_card_slogan" id="wait_first_slogan">
													<c:out value="${list.cNm}" />
												</div>
												<div class="gallery_card_icon">
													<button class="gallery_card_icon_button btn_no" id="gallery_card_icon_button01">
														<i class="fa-solid fa-ellipsis"></i>
													</button>
												</div>
											</div>

											<div class="gallery_card_map" id="goinfo${status.index}">
												<img src="/imgpath/${list.fileSvrName}" onerror="this.src='/images/egovframework/main/common/noImage.png';" class="campaign_map" />

											</div>
											<div class="gallery_card_info">
												<div class="gallery_card_info_table_l">
													<p class="info_content">캠페인 가격</p>
												</div>
												<div class="gallery_card_info_table_r" id="wait_first_price">
													<fmt:formatNumber value="${list.estimate }" pattern="#,###" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">캠페인 카테고리</p>
												</div>
												<div class="gallery_card_info_table_r" id="wait_first_category">
													<c:out value="${list.category}" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">일정</p>
												</div>
												<div class="gallery_card_info_table_r date2" id="wait_first_date">
													<c:out value="${list.stDate}" />
													<c:out value=" - " />
													<c:out value="${list.edDate}" />
												</div>
												<div class="gallery_card_info_table_l" id="info_table_last_l">
													<p class="info_content">캠페인 분류</p>
												</div>
												<div class="gallery_card_info_table_r wait_first_mbr" id="info_table_last_r">
													<c:out value="1:" />
													<c:out value="${list.cMbr}" />
												</div>


											</div>
										</div>

									</c:when>
									<c:when test="${list.cSt eq 0 && result==2}">
										<div class="campaign_list_gallery_card shadow waitIndex${status.index} loadingCard" id="wait_second_Card">
											<input type="hidden" id="waitCampaignId${status.index}" name="campaignId" value="${list.cId}">
											<div class="gallery_card_nav">
												<div class="gallery_card_slogan" id="wait_second_slogan">
													<c:out value="${list.cNm}" />
												</div>
												<div class="gallery_card_icon">
													<button class="gallery_card_icon_button btn_no" id="gallery_card_icon_button01">
														<i class="fa-solid fa-ellipsis"></i>
													</button>
												</div>
											</div>

											<div class="gallery_card_map">
												<img src="/imgpath/${list.fileSvrName}" onerror="this.src='/images/egovframework/main/common/noImage.png';" class="campaign_map" />
											</div>
											<div class="gallery_card_info">
												<div class="gallery_card_info_table_l">
													<p class="info_content">캠페인 가격</p>
												</div>
												<div class="gallery_card_info_table_r" id="wait_second_price">
													<fmt:formatNumber value="${list.estimate }" pattern="#,###" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">캠페인 카테고리</p>
												</div>
												<div class="gallery_card_info_table_r" id="wait_second_category">
													<c:out value="${list.category}" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">일정</p>
												</div>
												<div class="gallery_card_info_table_r date2" id="wait_second_date">
													<c:out value="${list.stDate}" />
													<c:out value=" - " />
													<c:out value="${list.edDate}" />
												</div>
												<div class="gallery_card_info_table_l" id="info_table_last_l">
													<p class="info_content">캠페인 분류</p>
												</div>
												<div class="gallery_card_info_table_r wait_second_mbr" id="info_table_last_r">
													<c:out value="1:" />
													<c:out value="${list.cMbr}" />
												</div>
											</div>
										</div>
									</c:when>
									<c:when test="${list.cSt eq 0 && result==0}">
										<div class="campaign_list_gallery_card shadow waitIndex${status.index} loadingCard" id="campaign_list_gallery_card_last">
											<input type="hidden" id="waitCampaignId${status.index}" name="campaignId" value="${list.cId}">
											<div class="gallery_card_nav">
												<div class="gallery_card_slogan" id="wait_third_slogan">
													<c:out value="${list.cNm}" />
												</div>
												<div class="gallery_card_icon">
													<button class="gallery_card_icon_button btn_no" id="gallery_card_icon_button01">
														<i class="fa-solid fa-ellipsis"></i>
													</button>
												</div>
											</div>

											<div class="gallery_card_map">
												<img src="/imgpath/${list.fileSvrName}" onerror="this.src='/images/egovframework/main/common/noImage.png';" class="campaign_map" />

											</div>
											<div class="gallery_card_info">
												<div class="gallery_card_info_table_l">
													<p class="info_content">캠페인 가격</p>
												</div>
												<div class="gallery_card_info_table_r" id="wait_third_price">
													<fmt:formatNumber value="${list.estimate }" pattern="#,###" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">캠페인 카테고리</p>
												</div>
												<div class="gallery_card_info_table_r" id="wait_third_category">
													<c:out value="${list.category}" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">일정</p>
												</div>
												<div class="gallery_card_info_table_r date2" id="wait_third_date">
													<c:out value="${list.stDate}" />
													<c:out value=" - " />
													<c:out value="${list.edDate}" />
												</div>
												<div class="gallery_card_info_table_l" id="info_table_last_l">
													<p class="info_content">캠페인 분류</p>
												</div>
												<div class="gallery_card_info_table_r wait_third_mbr" id="info_table_last_r">
													<c:out value="1:" />
													<c:out value="${list.cMbr}" />
												</div>


											</div>
										</div>
									</c:when>
								</c:choose>
							</c:forEach>
						</div>
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${gStnum eq 2}">
						<div class="footer" id='agallery_wait_pg'>
							<div class="footer_blank"></div>
							<div class="footer_page">
								<ul class="footer_pagination footer_modal">
									<c:if test="${gallerynwaitpaging.startPage != 1 }">
										<li class="arrow1"><a href="/mainAGallery.do?waitnowPage=${gallerynwaitpaging.startPage - 1 }&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}&galleryStauts=2" class="alist_default_left2 start angle"> <i class="fa-sharp fa-solid fa-angles-left"></i></a></li>
									</c:if>
									<c:choose>
										<c:when test="${waitnowPage == gallerynwaitpaging.startPage}">
											<li><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}&galleryStauts=2" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
										</c:when>
										<c:when test="${waitnowPage != campaigntotalCountVO.startPage}">
											<li><a href="/mainAGallery.do?waitnowPage=${waitnowPage-1}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}&galleryStauts=2" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
										</c:when>
									</c:choose>
									<c:forEach begin="${gallerynwaitpaging.startPage }" end="${gallerynwaitpaging.endPage }" var="p">
										<c:choose>
											<c:when test="${p == gallerynwaitpaging.nowPage}">
												<li><a class="alist_default_p active">${p}</a></li>
											</c:when>
											<c:when test="${p != gallerynwaitpaging.nowPage}">
												<li><a href="/mainAGallery.do?waitnowPage=${p}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}&galleryStauts=2" class="alist_default_p">${p}</a></li>
											</c:when>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${waitnowPage == gallerynwaitpaging.lastPage}">
											<li class=""><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}&galleryStauts=2" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
										</c:when>
										<c:when test="${waitnowPage != gallerynwaitpaging.lastPage }">
											<li class=""><a href="/mainAGallery.do?waitnowPage=${waitnowPage+1}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}&galleryStauts=2" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
										</c:when>
									</c:choose>
									<c:if test="${gallerynwaitpaging.endPage != gallerynwaitpaging.lastPage}">
										<li class="arrow2"><a href="/mainAGallery.do?waitnowPage=${gallerynwaitpaging.endPage+1}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}&galleryStauts=2" class="alist_default_right2 last angle2"><i class="fa-sharp fa-solid fa-angles-right"></i></a></li>
									</c:if>
								</ul>
							</div>
							<div class="footer_blank"></div>
						</div>
					</c:when>

					<c:otherwise>
						<div class="footer" id='agallery_wait_pg'>
							<div class="footer_blank"></div>
							<div class="footer_page">
								<ul class="footer_pagination footer_modal">
									<c:if test="${gallerynwaitpaging.startPage != 1 }">
										<li class="arrow1"><a href="/mainAGallery.do?waitnowPage=${gallerynwaitpaging.startPage - 1 }&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}" class="alist_default_left2 start angle"> <i class="fa-sharp fa-solid fa-angles-left"></i></a></li>
									</c:if>
									<c:choose>
										<c:when test="${waitnowPage == gallerynwaitpaging.startPage}">
											<li><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
										</c:when>
										<c:when test="${waitnowPage != campaigntotalCountVO.startPage}">
											<li><a href="/mainAGallery.do?waitnowPage=${waitnowPage-1}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
										</c:when>
									</c:choose>
									<c:forEach begin="${gallerynwaitpaging.startPage }" end="${gallerynwaitpaging.endPage }" var="p">
										<c:choose>
											<c:when test="${p == gallerynwaitpaging.nowPage}">
												<li><a class="alist_default_p active">${p}</a></li>
											</c:when>
											<c:when test="${p != gallerynwaitpaging.nowPage}">
												<li><a href="/mainAGallery.do?waitnowPage=${p}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}" class="alist_default_p">${p}</a></li>
											</c:when>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${waitnowPage == gallerynwaitpaging.lastPage}">
											<li class=""><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
										</c:when>
										<c:when test="${waitnowPage != gallerynwaitpaging.lastPage }">
											<li class=""><a href="/mainAGallery.do?waitnowPage=${waitnowPage+1}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
										</c:when>
									</c:choose>
									<c:if test="${gallerynwaitpaging.endPage != gallerynwaitpaging.lastPage}">
										<li class="arrow2"><a href="/mainAGallery.do?waitnowPage=${gallerynwaitpaging.endPage+1}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}" class="alist_default_right2 last angle2"><i class="fa-sharp fa-solid fa-angles-right"></i></a></li>
									</c:if>
								</ul>
							</div>
							<div class="footer_blank"></div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>


			<div class="campaign_list_gallery_collection" id="gallery_reserving">
				<div class="campaign_list_gallery_bar">
					<div class="c_list_blank"></div>
					<div class="campaign_list_gallery_icon">
						<i class="fa-solid fa-circle-dot icon_yellow"></i>
					</div>
					<div class="campaign_list_gallery_title">모집중인 캠페인</div>
				</div>

				<c:choose>
					<c:when test="${campaigncollectCount==0}">
						<div class="campaign_list_gallery_content gallery_content_empty">
							<i class="fa-solid fa-period"></i>
							<div class="campaign_list_table_main_icon">
								<i class="fa-solid fa-x fa-3x icon_white"></i>
							</div>
							<div class="campaign_list_table_main_text">캠페인이 존재하지 않습니다.</div>
						</div>
					</c:when>

					<c:otherwise>
						<div class="campaign_list_gallery_content">
							<c:set var="count" value="0" />
							<c:forEach items="${gallerycollectBoard}" var="list" varStatus="status">
								<c:if test="${list.cSt eq 2}">
									<c:set var="count" value="${count + 1}" />
									<c:set var="result" value="${count % 3}" />
								</c:if>
								<c:choose>
									<c:when test="${list.cSt eq 2 && result==1}">
										<div class="campaign_list_gallery_card shadow collectIndex${status.index}" id="collect_first_card">
											<input type="hidden" id="collectCampaignId${status.index}" name="campaignId" value="${list.cId}">
											<div class="gallery_card_nav">
												<div class="gallery_card_slogan" id="collect_first_slogan">
													<c:out value="${list.cNm}" />
												</div>
												<div class="gallery_card_icon">
													<button class="gallery_card_icon_button btn_no" id="gallery_card_icon_button01">
														<i class="fa-solid fa-ellipsis"></i>
													</button>
												</div>
											</div>

											<div class="gallery_card_map">
												<img src="/imgpath/${list.fileSvrName}" onerror="this.src='/images/egovframework/main/common/noImage.png';" class="campaign_map" />
											</div>
											<div class="gallery_card_info">
												<div class="gallery_card_info_table_l">
													<p class="info_content">캠페인 가격</p>
												</div>
												<div class="gallery_card_info_table_r" id="collect_first_price">
													<fmt:formatNumber value="${list.estimate }" pattern="#,###" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">캠페인 카테고리</p>
												</div>
												<div class="gallery_card_info_table_r" id="collect_first_category">
													<c:out value="${list.category}" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">일정</p>
												</div>
												<div class="gallery_card_info_table_r date2" id="collect_first_date">
													<c:out value="${list.stDate}" />
													<c:out value=" - " />
													<c:out value="${list.edDate}" />
												</div>
												<div class="gallery_card_info_table_l" id="info_table_last_l">
													<p class="info_content">캠페인 분류</p>
												</div>
												<div class="gallery_card_info_table_r collect_first_mbr" id="info_table_last_r">
													<c:out value="1:" />
													<c:out value="${list.cMbr}" />
												</div>


											</div>
										</div>
									</c:when>
									<c:when test="${list.cSt eq 2 && result==2}">
										<div class="campaign_list_gallery_card shadow collectIndex${status.index}" id="collect_second_card">
											<input type="hidden" id="collectCampaignId${status.index}" name="campaignId" value="${list.cId}">
											<div class="gallery_card_nav">
												<div class="gallery_card_slogan" id="collect_second_slogan">
													<c:out value="${list.cNm}" />
												</div>
												<div class="gallery_card_icon">
													<button class="gallery_card_icon_button btn_no" id="gallery_card_icon_button01">
														<i class="fa-solid fa-ellipsis"></i>
													</button>
												</div>
											</div>

											<div class="gallery_card_map">
												<img src="/imgpath/${list.fileSvrName}" onerror="this.src='/images/egovframework/main/common/noImage.png';" class="campaign_map" />
											</div>
											<div class="gallery_card_info">
												<div class="gallery_card_info_table_l">
													<p class="info_content">캠페인 가격</p>
												</div>
												<div class="gallery_card_info_table_r" id="collect_second_price">
													<fmt:formatNumber value="${list.estimate }" pattern="#,###" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">캠페인 카테고리</p>
												</div>
												<div class="gallery_card_info_table_r" id="collect_second_category">
													<c:out value="${list.category}" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">일정</p>
												</div>
												<div class="gallery_card_info_table_r date2" id="collect_second_date">
													<c:out value="${list.stDate}" />
													<c:out value=" - " />
													<c:out value="${list.edDate}" />
												</div>
												<div class="gallery_card_info_table_l" id="info_table_last_l">
													<p class="info_content">캠페인 분류</p>
												</div>
												<div class="gallery_card_info_table_r collect_second_mbr" id="info_table_last_r">
													<c:out value="1:" />
													<c:out value="${list.cMbr}" />
												</div>


											</div>
										</div>
									</c:when>
									<c:when test="${list.cSt eq 2 && result==0}">
										<div class="campaign_list_gallery_card shadow collect_third_card collectIndex${status.index}" id="campaign_list_gallery_card_last">
											<input type="hidden" id="collectCampaignId${status.index}" name="campaignId" value="${list.cId}">
											<div class="gallery_card_nav">
												<div class="gallery_card_slogan" id="collect_third_slogan">
													<c:out value="${list.cNm}" />
												</div>
												<div class="gallery_card_icon">
													<button class="gallery_card_icon_button btn_no" id="gallery_card_icon_button01">
														<i class="fa-solid fa-ellipsis"></i>
													</button>
												</div>
											</div>

											<div class="gallery_card_map">
												<img src="/imgpath/${list.fileSvrName}" onerror="this.src='/images/egovframework/main/common/noImage.png';" class="campaign_map" />

											</div>
											<div class="gallery_card_info">
												<div class="gallery_card_info_table_l">
													<p class="info_content">캠페인 가격</p>
												</div>
												<div class="gallery_card_info_table_r" id="collect_third_price">
													<fmt:formatNumber value="${list.estimate }" pattern="#,###" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">캠페인 카테고리</p>
												</div>
												<div class="gallery_card_info_table_r" id="collect_third_category">
													<c:out value="${list.category}" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">일정</p>
												</div>
												<div class="gallery_card_info_table_r date2" id="collect_third_date">
													<c:out value="${list.stDate}" />
													<c:out value=" - " />
													<c:out value="${list.edDate}" />
												</div>
												<div class="gallery_card_info_table_l" id="info_table_last_l">
													<p class="info_content">캠페인 분류</p>
												</div>
												<div class="gallery_card_info_table_r collect_third_mbr" id="info_table_last_r">
													<c:out value="1:" />
													<c:out value="${list.cMbr}" />
												</div>
											</div>
										</div>
									</c:when>
								</c:choose>
							</c:forEach>
						</div>

					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${gStnum eq 4}">
						<div class="footer" id='agallery_collect_pg'>
							<div class="footer_blank"></div>
							<div class="footer_page">
								<ul class="footer_pagination footer_modal">
									<c:if test="${gallerycollectpaging.startPage != 1 }">
										<li class="arrow1"><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${gallerycollectpaging.startPage - 1 }&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}&galleryStauts=4" class="alist_default_left2 start angle"> <i class="fa-sharp fa-solid fa-angles-left"></i></a></li>
									</c:if>
									<c:choose>
										<c:when test="${collectnowPage == gallerycollectpaging.startPage}">
											<li><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}&galleryStauts=4" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
										</c:when>
										<c:when test="${collectnowPage != gallerycollectpaging.startPage}">
											<li><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage-1}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}&galleryStauts=4" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
										</c:when>
									</c:choose>
									<c:forEach begin="${gallerycollectpaging.startPage }" end="${gallerycollectpaging.endPage }" var="p">
										<c:choose>
											<c:when test="${p == gallerycollectpaging.nowPage}">
												<li><a class="alist_default_p active">${p}</a></li>
											</c:when>
											<c:when test="${p != gallerycollectpaging.nowPage}">
												<li><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${p}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}&galleryStauts=4" class="alist_default_p">${p}</a></li>
											</c:when>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${collectnowPage == gallerycollectpaging.lastPage}">
											<li class=""><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}&galleryStauts=4" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
										</c:when>
										<c:when test="${collectnowPage != gallerycollectpaging.lastPage }">
											<li class=""><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage+1}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}&galleryStauts=4" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
										</c:when>
									</c:choose>
									<c:if test="${gallerycollectpaging.endPage != gallerycollectpaging.lastPage}">
										<li class="arrow2"><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${gallerycollectpaging.endPage+1}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}&galleryStauts=4" class="alist_default_right2 last angle2"><i class="fa-sharp fa-solid fa-angles-right"></i></a></li>
									</c:if>
								</ul>
							</div>
							<div class="footer_blank"></div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="footer" id='agallery_collect_pg'>
							<div class="footer_blank"></div>
							<div class="footer_page">
								<ul class="footer_pagination footer_modal">
									<c:if test="${gallerycollectpaging.startPage != 1 }">
										<li class="arrow1"><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${gallerycollectpaging.startPage - 1 }&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}" class="alist_default_left2 start angle"> <i class="fa-sharp fa-solid fa-angles-left"></i></a></li>
									</c:if>
									<c:choose>
										<c:when test="${collectnowPage == gallerycollectpaging.startPage}">
											<li><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
										</c:when>
										<c:when test="${collectnowPage != gallerycollectpaging.startPage}">
											<li><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage-1}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
										</c:when>
									</c:choose>
									<c:forEach begin="${gallerycollectpaging.startPage }" end="${gallerycollectpaging.endPage }" var="p">
										<c:choose>
											<c:when test="${p == gallerycollectpaging.nowPage}">
												<li><a class="alist_default_p active">${p}</a></li>
											</c:when>
											<c:when test="${p != gallerycollectpaging.nowPage}">
												<li><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${p}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}" class="alist_default_p">${p}</a></li>
											</c:when>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${collectnowPage == gallerycollectpaging.lastPage}">
											<li class=""><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
										</c:when>
										<c:when test="${collectnowPage != gallerycollectpaging.lastPage }">
											<li class=""><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage+1}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
										</c:when>
									</c:choose>
									<c:if test="${gallerycollectpaging.endPage != gallerycollectpaging.lastPage}">
										<li class="arrow2"><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${gallerycollectpaging.endPage+1}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}" class="alist_default_right2 last angle2"><i class="fa-sharp fa-solid fa-angles-right"></i></a></li>
									</c:if>
								</ul>
							</div>

							<div class="footer_blank"></div>
						</div>
					</c:otherwise>
				</c:choose>



			</div>


			<div class="campaign_list_gallery_collection" id="gallery_ing">
				<div class="campaign_list_gallery_bar">
					<div class="c_list_blank"></div>
					<div class="campaign_list_gallery_icon">
						<i class="fa-solid fa-circle-dot icon_green"></i>
					</div>
					<div class="campaign_list_gallery_title">진행중인 캠페인</div>
				</div>

				<c:choose>
					<c:when test="${campaigningCountforA==0}">
						<div class="campaign_list_gallery_content gallery_content_empty">
							<i class="fa-solid fa-period"></i>
							<div class="campaign_list_table_main_icon">
								<i class="fa-solid fa-x fa-3x icon_white"></i>
							</div>
							<div class="campaign_list_table_main_text">캠페인이 존재하지 않습니다.</div>
						</div>
					</c:when>

					<c:otherwise>
						<div class="campaign_list_gallery_content">
							<c:set var="count" value="0" />
							<c:forEach items="${galleryingBoard}" var="list" varStatus="status">
								<c:if test="${list.cSt eq 3}">
									<c:set var="count" value="${count + 1}" />
									<c:set var="result" value="${count % 3}" />
								</c:if>
								<c:choose>
									<c:when test="${list.cSt eq 3 && result==1}">
										<div class="campaign_list_gallery_card shadow ingAIndex${status.index}" id="aing_first_card">
											<input type="hidden" id="ingAcampaignId${status.index}" name="campaignId" value="${list.cId}">
											<div class="gallery_card_nav">
												<div class="gallery_card_slogan" id="aing_first_slogan">
													<c:out value="${list.cNm}" />
												</div>
												<div class="gallery_card_icon">
													<button class="gallery_card_icon_button btn_no" id="gallery_card_icon_button01">
														<i class="fa-solid fa-ellipsis"></i>
													</button>
												</div>
											</div>

											<div class="gallery_card_map">
												<img src="/imgpath/${list.fileSvrName}" onerror="this.src='/images/egovframework/main/common/noImage.png';" class="campaign_map" />

											</div>
											<div class="gallery_card_info">
												<div class="gallery_card_info_table_l">
													<p class="info_content">캠페인 가격</p>
												</div>
												<div class="gallery_card_info_table_r" id="aing_first_price">
													<fmt:formatNumber value="${list.estimate }" pattern="#,###" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">캠페인 카테고리</p>
												</div>
												<div class="gallery_card_info_table_r" id="aing_first_category">
													<c:out value="${list.category}" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">일정</p>
												</div>
												<div class="gallery_card_info_table_r date2" id="aing_first_date">
													<c:out value="${list.stDate}" />
													<c:out value=" - " />
													<c:out value="${list.edDate}" />
												</div>
												<div class="gallery_card_info_table_l" id="info_table_last_l">
													<p class="info_content">캠페인 분류</p>
												</div>
												<div class="gallery_card_info_table_r aing_first_mbr" id="info_table_last_r">
													<c:out value="1:" />
													<c:out value="${list.cMbr}" />
												</div>


											</div>
										</div>
									</c:when>
									<c:when test="${list.cSt eq 3 && result==2}">
										<div class="campaign_list_gallery_card shadow ingAIndex${status.index}" id="aing_second_card">
											<input type="hidden" id="ingAcampaignId${status.index}" name="campaignId" value="${list.cId}">
											<div class="gallery_card_nav">
												<div class="gallery_card_slogan" id="aing_second_slogan">
													<c:out value="${list.cNm}" />
												</div>
												<div class="gallery_card_icon">
													<button class="gallery_card_icon_button" id="gallery_card_icon_button01">
														<i class="fa-solid fa-ellipsis"></i>
													</button>
												</div>
											</div>

											<div class="gallery_card_map">
												<img src="/imgpath/${list.fileSvrName}" onerror="this.src='/images/egovframework/main/common/noImage.png';" class="campaign_map" />
											</div>
											<div class="gallery_card_info">
												<div class="gallery_card_info_table_l">
													<p class="info_content">캠페인 가격</p>
												</div>
												<div class="gallery_card_info_table_r" id="aing_second_price">
													<fmt:formatNumber value="${list.estimate }" pattern="#,###" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">캠페인 카테고리</p>
												</div>
												<div class="gallery_card_info_table_r" id="aing_second_category">
													<c:out value="${list.category}" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">일정</p>
												</div>
												<div class="gallery_card_info_table_r date2" id="aing_second_date">
													<c:out value="${list.stDate}" />
													<c:out value=" - " />
													<c:out value="${list.edDate}" />
												</div>
												<div class="gallery_card_info_table_l" id="info_table_last_l">
													<p class="info_content">캠페인 분류</p>
												</div>
												<div class="gallery_card_info_table_r aing_second_mbr" id="info_table_last_r">
													<c:out value="1:" />
													<c:out value="${list.cMbr}" />
												</div>


											</div>
										</div>
									</c:when>
									<c:when test="${list.cSt eq 3 && result==0}">
										<div class="campaign_list_gallery_card shadow aing_third_card ingAIndex${status.index}" id="campaign_list_gallery_card_last">
											<input type="hidden" id="ingAcampaignId${status.index}" name="campaignId" value="${list.cId}">
											<div class="gallery_card_nav">
												<div class="gallery_card_slogan" id="aing_third_slogan">
													<c:out value="${list.cNm}" />
												</div>
												<div class="gallery_card_icon">
													<button class="gallery_card_icon_button btn_no" id="gallery_card_icon_button01">
														<i class="fa-solid fa-ellipsis"></i>
													</button>
												</div>
											</div>

											<div class="gallery_card_map">
												<img src="/imgpath/${list.fileSvrName}" onerror="this.src='/images/egovframework/main/common/noImage.png';" class="campaign_map" />
											</div>
											<div class="gallery_card_info">
												<div class="gallery_card_info_table_l">
													<p class="info_content">캠페인 가격</p>
												</div>
												<div class="gallery_card_info_table_r" id="aing_third_price">
													<fmt:formatNumber value="${list.estimate }" pattern="#,###" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">캠페인 카테고리</p>
												</div>
												<div class="gallery_card_info_table_r" id="aing_third_category">
													<c:out value="${list.category}" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">일정</p>
												</div>
												<div class="gallery_card_info_table_r date2" id=aing_third_date>
													<c:out value="${list.stDate}" />
													<c:out value=" - " />
													<c:out value="${list.edDate}" />
												</div>
												<div class="gallery_card_info_table_l" id="info_table_last_l">
													<p class="info_content">캠페인 분류</p>
												</div>
												<div class="gallery_card_info_table_r aing_third_mbr" id="info_table_last_r">
													<c:out value="1:" />
													<c:out value="${list.cMbr}" />
												</div>


											</div>
										</div>
									</c:when>
								</c:choose>
							</c:forEach>
						</div>
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${gStnum eq 6}">
						<div class="footer" id='agallery_ing_pg'>
							<div class="footer_blank"></div>
							<div class="footer_page">
								<ul class="footer_pagination footer_modal">
									<c:if test="${galleryingCountpaging.startPage != 1 }">
										<li class="arrow1"><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${galleryingCountpaging.startPage - 1 }&endnowPage=${endnowPage}&galleryStauts=6" class="alist_default_left2 start angle"> <i class="fa-sharp fa-solid fa-angles-left"></i></a></li>
									</c:if>
									<c:choose>
										<c:when test="${ingnowPage == galleryingCountpaging.startPage}">
											<li><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}&galleryStauts=6 " class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
										</c:when>
										<c:when test="${ingnowPage != galleryingCountpaging.startPage}">
											<li><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage-1}&endnowPage=${endnowPage}&galleryStauts=6" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
										</c:when>
									</c:choose>
									<c:forEach begin="${galleryingCountpaging.startPage }" end="${galleryingCountpaging.endPage }" var="p">
										<c:choose>
											<c:when test="${p == galleryingCountpaging.nowPage}">
												<li><a class="alist_default_p active">${p}</a></li>
											</c:when>
											<c:when test="${p != galleryingCountpaging.nowPage}">
												<li><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${p}&endnowPage=${endnowPage}&galleryStauts=6" class="alist_default_p">${p}</a></li>
											</c:when>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${ingnowPage == galleryingCountpaging.lastPage}">
											<li class=""><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}&galleryStauts=6" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
										</c:when>
										<c:when test="${ingnowPage != galleryingCountpaging.lastPage }">
											<li class=""><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage+1}&endnowPage=${endnowPage}&galleryStauts=6" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
										</c:when>
									</c:choose>
									<c:if test="${galleryingCountpaging.endPage != galleryingCountpaging.lastPage}">
										<li class="arrow2"><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}ingnowPage=${galleryingCountpaging.endPage+1}&endnowPage=${endnowPage}&galleryStauts=6" class="alist_default_right2 last angle2"><i class="fa-sharp fa-solid fa-angles-right"></i></a></li>
									</c:if>
								</ul>
							</div>

							<div class="footer_blank"></div>
						</div>
					</c:when>

					<c:otherwise>
						<div class="footer" id='agallery_ing_pg'>
							<div class="footer_blank"></div>
							<div class="footer_page">
								<ul class="footer_pagination footer_modal">
									<c:if test="${galleryingCountpaging.startPage != 1 }">
										<li class="arrow1"><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${galleryingCountpaging.startPage - 1 }&endnowPage=${endnowPage}" class="alist_default_left2 start angle"> <i class="fa-sharp fa-solid fa-angles-left"></i></a></li>
									</c:if>
									<c:choose>
										<c:when test="${ingnowPage == galleryingCountpaging.startPage}">
											<li><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
										</c:when>
										<c:when test="${ingnowPage != galleryingCountpaging.startPage}">
											<li><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage-1}&endnowPage=${endnowPage}" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
										</c:when>
									</c:choose>
									<c:forEach begin="${galleryingCountpaging.startPage }" end="${galleryingCountpaging.endPage }" var="p">
										<c:choose>
											<c:when test="${p == galleryingCountpaging.nowPage}">
												<li><a class="alist_default_p active">${p}</a></li>
											</c:when>
											<c:when test="${p != galleryingCountpaging.nowPage}">
												<li><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${p}&endnowPage=${endnowPage}" class="alist_default_p">${p}</a></li>
											</c:when>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${ingnowPage == galleryingCountpaging.lastPage}">
											<li class=""><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
										</c:when>
										<c:when test="${ingnowPage != galleryingCountpaging.lastPage }">
											<li class=""><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage+1}&endnowPage=${endnowPage}" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
										</c:when>
									</c:choose>
									<c:if test="${galleryingCountpaging.endPage != galleryingCountpaging.lastPage}">
										<li class="arrow2"><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}ingnowPage=${galleryingCountpaging.endPage+1}&endnowPage=${endnowPage}" class="alist_default_right2 last angle2"><i class="fa-sharp fa-solid fa-angles-right"></i></a></li>
									</c:if>
								</ul>
							</div>

							<div class="footer_blank"></div>
						</div>
					</c:otherwise>
				</c:choose>



			</div>


			<div class="campaign_list_gallery_collection" id="gallery_end">
				<div class="campaign_list_gallery_bar">
					<div class="c_list_blank"></div>
					<div class="campaign_list_gallery_icon">
						<i class="fa-solid fa-circle-dot icon_red"></i>
					</div>
					<div class="campaign_list_gallery_title">종료된 캠페인</div>
				</div>

				<c:choose>
					<c:when test="${campaignendCountforA==0}">
						<div class="campaign_list_gallery_content gallery_content_empty">
							<i class="fa-solid fa-period"></i>
							<div class="campaign_list_table_main_icon">
								<i class="fa-solid fa-x fa-3x icon_white"></i>
							</div>
							<div class="campaign_list_table_main_text">캠페인이 존재하지 않습니다.</div>
						</div>
					</c:when>

					<c:otherwise>
						<div class="campaign_list_gallery_content">
							<c:set var="count" value="0" />
							<c:forEach items="${galleryendBoard}" var="list" varStatus="status">
								<c:if test="${list.cSt eq 5}">
									<c:set var="count" value="${count + 1}" />
									<c:set var="result" value="${count % 3}" />
								</c:if>
								<c:choose>
									<c:when test="${list.cSt eq 5 && result==1}">
										<div class="campaign_list_gallery_card shadow endAIndex${status.index}" id="aend_first_card">
											<input type="hidden" id="endACampaignId${status.index}" name="campaignId" value="${list.cId}">
											<div class="gallery_card_nav">
												<div class="gallery_card_slogan" id="aend_first_slogan">
													<c:out value="${list.cNm}" />
												</div>
												<div class="gallery_card_icon">
													<button class="gallery_card_icon_button btn_no" id="gallery_card_icon_button01">
														<i class="fa-solid fa-ellipsis"></i>
													</button>
												</div>
											</div>

											<div class="gallery_card_map">
												<img src="/imgpath/${list.fileSvrName}" onerror="this.src='/images/egovframework/main/common/noImage.png';" class="campaign_map" />
											</div>
											<div class="gallery_card_info">
												<div class="gallery_card_info_table_l">
													<p class="info_content">캠페인 가격</p>
												</div>
												<div class="gallery_card_info_table_r" id="aend_second_price">
													<fmt:formatNumber value="${list.estimate }" pattern="#,###" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">캠페인 카테고리</p>
												</div>
												<div class="gallery_card_info_table_r" id="aend_second_category">
													<c:out value="${list.category}" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">일정</p>
												</div>
												<div class="gallery_card_info_table_r date2" id=aend_second_date>
													<c:out value="${list.stDate}" />
													<c:out value=" - " />
													<c:out value="${list.edDate}" />
												</div>
												<div class="gallery_card_info_table_l" id="info_table_last_l">
													<p class="info_content">캠페인 분류</p>
												</div>
												<div class="gallery_card_info_table_r aend_second_mbr" id="info_table_last_r">
													<c:out value="1:" />
													<c:out value="${list.cMbr}" />
												</div>


											</div>
										</div>
									</c:when>
									<c:when test="${list.cSt eq 5 && result==2}">
										<div class="campaign_list_gallery_card shadow endAIndex${status.index}" id="aend_second_card">
											<input type="hidden" id="endACampaignId${status.index}" name="campaignId" value="${list.cId}">
											<div class="gallery_card_nav">
												<div class="gallery_card_slogan" id="aend_second_slogan">
													<c:out value="${list.cNm}" />
												</div>
												<div class="gallery_card_icon">
													<button class="gallery_card_icon_button btn_no" id="gallery_card_icon_button01">
														<i class="fa-solid fa-ellipsis"></i>
													</button>
												</div>
											</div>

											<div class="gallery_card_map">
												<img src="/imgpath/${list.fileSvrName}" onerror="this.src='/images/egovframework/main/common/noImage.png';" class="campaign_map" />
											</div>
											<div class="gallery_card_info">
												<div class="gallery_card_info_table_l">
													<p class="info_content">캠페인 가격</p>
												</div>
												<div class="gallery_card_info_table_r" id="aend_third_price">
													<fmt:formatNumber value="${list.estimate }" pattern="#,###" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">캠페인 카테고리</p>
												</div>
												<div class="gallery_card_info_table_r" id="aend_third_category">
													<c:out value="${list.category}" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">일정</p>
												</div>
												<div class="gallery_card_info_table_r date2" id="aend_third_date">
													<c:out value="${list.stDate}" />
													<c:out value=" - " />
													<c:out value="${list.edDate}" />
												</div>
												<div class="gallery_card_info_table_l" id="info_table_last_l">
													<p class="info_content">캠페인 분류</p>
												</div>
												<div class="gallery_card_info_table_r aend_third_mbr" id="info_table_last_r">
													<c:out value="1:" />
													<c:out value="${list.cMbr}" />
												</div>


											</div>
										</div>
									</c:when>
									<c:when test="${list.cSt eq 5 && result==0}">
										<div class="campaign_list_gallery_card aend_third_card shadow endAIndex${status.index}" id="campaign_list_gallery_card_last">
											<input type="hidden" id="endACampaignId${status.index}" name="campaignId" value="${list.cId}">
											<div class="gallery_card_nav">
												<div class="gallery_card_slogan" id="aend_third_slogan">
													<c:out value="${list.cNm}" />
												</div>
												<div class="gallery_card_icon">
													<button class="gallery_card_icon_button btn_no" id="gallery_card_icon_button01">
														<i class="fa-solid fa-ellipsis"></i>
													</button>
												</div>
											</div>

											<div class="gallery_card_map">
												<img src="/imgpath/${list.fileSvrName}" onerror="this.src='/images/egovframework/main/common/noImage.png';" class="campaign_map" />

											</div>
											<div class="gallery_card_info">
												<div class="gallery_card_info_table_l">
													<p class="info_content">캠페인 가격</p>
												</div>
												<div class="gallery_card_info_table_r">
													<fmt:formatNumber value="${list.estimate }" pattern="#,###" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">캠페인 카테고리</p>
												</div>
												<div class="gallery_card_info_table_r">
													<c:out value="${list.category}" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">일정</p>
												</div>
												<div class="gallery_card_info_table_r date2">
													<c:out value="${list.stDate}" />
													<c:out value=" - " />
													<c:out value="${list.edDate}" />
												</div>
												<div class="gallery_card_info_table_l" id="info_table_last_l">
													<p class="info_content">캠페인 분류</p>
												</div>
												<div class="gallery_card_info_table_r" id="info_table_last_r">
													<c:out value="1:" />
													<c:out value="${list.cMbr}" />
												</div>


											</div>
										</div>
									</c:when>
								</c:choose>
							</c:forEach>
						</div>
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${gStnum eq 8}">
						<div class="footer" id='agallery_end_pg'>
							<div class="footer_blank"></div>
							<div class="footer_page">
								<ul class="footer_pagination footer_modal">
									<c:if test="${galleryendCountpaging.startPage != 1 }">
										<li class="arrow1"><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${galleryendCountpaging.startPage - 1 }&galleryStauts=8" class="alist_default_left2 start angle"> <i class="fa-sharp fa-solid fa-angles-left"></i></a></li>
									</c:if>
									<c:choose>
										<c:when test="${endnowPage == galleryendCountpaging.startPage}">
											<li><a href="mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}&galleryStauts=8" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
										</c:when>
										<c:when test="${endnowPage != galleryendCountpaging.startPage}">
											<li><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage-1}&galleryStauts=8" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
										</c:when>
									</c:choose>
									<c:forEach begin="${galleryendCountpaging.startPage }" end="${galleryendCountpaging.endPage }" var="p">
										<c:choose>
											<c:when test="${p == galleryendCountpaging.nowPage}">
												<li><a class="alist_default_p active">${p}</a></li>
											</c:when>
											<c:when test="${p != galleryendCountpaging.nowPage}">
												<li><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${p}&galleryStauts=8" class="alist_default_p">${p}</a></li>
											</c:when>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${endnowPage == galleryendCountpaging.lastPage}">
											<li class=""><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}&galleryStauts=8" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
										</c:when>
										<c:when test="${endnowPage != galleryendCountpaging.lastPage }">
											<li class=""><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage+1}&galleryStauts=8" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
										</c:when>
									</c:choose>
									<c:if test="${galleryendCountpaging.endPage != galleryendCountpaging.lastPage}">
										<li class="arrow2"><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}ingnowPage=${ingnowPage}&endnowPage=${galleryendCountpaging.endPage+1}&galleryStauts=8" class="alist_default_right2 last angle2"><i class="fa-sharp fa-solid fa-angles-right"></i></a></li>
									</c:if>
								</ul>
							</div>

							<div class="footer_blank"></div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="footer" id='agallery_end_pg'>
							<div class="footer_blank"></div>
							<div class="footer_page">
								<ul class="footer_pagination footer_modal">
									<c:if test="${galleryendCountpaging.startPage != 1 }">
										<li class="arrow1"><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${galleryendCountpaging.startPage - 1 }" class="alist_default_left2 start angle"> <i class="fa-sharp fa-solid fa-angles-left"></i></a></li>
									</c:if>
									<c:choose>
										<c:when test="${endnowPage == galleryendCountpaging.startPage}">
											<li><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
										</c:when>
										<c:when test="${endnowPage != galleryendCountpaging.startPage}">
											<li><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage-1}" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
										</c:when>
									</c:choose>
									<c:forEach begin="${galleryendCountpaging.startPage }" end="${galleryendCountpaging.endPage }" var="p">
										<c:choose>
											<c:when test="${p == galleryendCountpaging.nowPage}">
												<li><a class="alist_default_p active">${p}</a></li>
											</c:when>
											<c:when test="${p != galleryendCountpaging.nowPage}">
												<li><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${p}" class="alist_default_p">${p}</a></li>
											</c:when>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${endnowPage == galleryendCountpaging.lastPage}">
											<li class=""><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
										</c:when>
										<c:when test="${endnowPage != galleryendCountpaging.lastPage }">
											<li class=""><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage+1}" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
										</c:when>
									</c:choose>
									<c:if test="${galleryendCountpaging.endPage != galleryendCountpaging.lastPage}">
										<li class="arrow2"><a href="/mainAGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}ingnowPage=${ingnowPage}&endnowPage=${galleryendCountpaging.endPage+1}" class="alist_default_right2 last angle2"><i class="fa-sharp fa-solid fa-angles-right"></i></a></li>
									</c:if>
								</ul>
							</div>

							<div class="footer_blank"></div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

</body>

<!-- nav 회원정보 수정 관련 js -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4cd6acb67135d6b60671b0b2bb4257cb&libraries=services"></script>
<script src="/index/lib/crypto/core.min.js"></script>
<script src="/index/lib/crypto/sha256.min.js"></script>
<script src="/main/js/main/navInfoModify.js"></script>
<script src="/main/js/main/jquery.js"></script>
<script src="/index/lib/jquery/jquery.validate.min.js"></script>
<!-- main 관련 js -->
<script src="/main/js/main/jquery.tablesorter.min.js"></script>
<script src="/main/js/main/main.js"></script>


<script>
	// 캠페인 없을시에 캠페인 없음 표출 

	// console.log(${viewAll});

	// 갤러리 상태에서의 화면 변환 
	var gSt = "${gStnum}";

	// cSt 가 10 이상이고 gstnum=0 (갤러리 모든 페이지 모드)이면은 갤러리페이지에서의 요청이므로 기본적으로 갤러리 페이지를 우선적으로 띄워야한다. //

	var $wait_button_box = $('#wait_button_box');
	var $collect_button_box = $('#collect_button_box');
	var $ingA_button_box = $('#ingA_button_box');
	var $endA_button_box = $('#endA_button_box');

	var $reserving_button_box = $('#reserving_button_box');
	var $check_button_box = $('#check_button_box');
	var $ingB_button_box = $('#ingB_button_box');
	var $endB_button_box = $('#endB_button_box');

	// 영역 
	var $gallery_button = $('.change_gallery');
	var $list_button = $('.change_list');

	var $campaign_area = $('.campaign_list');

	var $campaign_list = $('.campaign_list_bar');
	var $campaign_gallery = $('.campaign_list_gallery');

	var $gallery_loading_area = $('#gallery_loading');
	var $gallery_reserving_area = $('#gallery_reserving');
	var $gallery_ing_area = $('#gallery_ing');
	var $gallery_end_area = $('#gallery_end');

	// gSt가 홀수이면은 갤러리 전체화면을 출력한다. 
	if (gSt % 2 == 1 || gSt == 0) {

		// 갤러리 화면으로의 전환 (전체화면)

		$campaign_gallery.css("display", "block");

		$gallery_loading_area.css("display", "block");

		$gallery_reserving_area.css("display", "block");

		$gallery_ing_area.css("display", "block");

		$gallery_end_area.css("display", "block");

		$campaign_list.css("display", "none");

		$campaign_area.addClass('gallery');

		$campaign_area.removeClass('list');

	} else if (gSt == 2) {
		$campaign_gallery.css("display", "block");

		$gallery_loading_area.css("display", "block");

		$gallery_ing_area.css("display", "none");

		$gallery_reserving_area.css("display", "none");

		$gallery_end_area.css("display", "none");

		$campaign_list.css("display", "none");

		$campaign_area.addClass('gallery');

		$campaign_area.removeClass('list');

	} else if (gSt == 4) {

		$campaign_gallery.css("display", "block");

		$gallery_loading_area.css("display", "none");

		$gallery_reserving_area.css("display", "block");

		$gallery_ing_area.css("display", "none");

		$gallery_end_area.css("display", "none");

		$campaign_list.css("display", "none");

		$campaign_area.addClass('gallery');

		$campaign_area.removeClass('list');

	} else if (gSt == 6) {

		$campaign_gallery.css("display", "block");

		$gallery_loading_area.css("display", "none");

		$gallery_reserving_area.css("display", "none");

		$gallery_ing_area.css("display", "block");

		$gallery_end_area.css("display", "none");

		$campaign_list.css("display", "none");

		$campaign_area.addClass('gallery');

		$campaign_area.removeClass('list');

	} else if (gSt == 8) {

		$campaign_gallery.css("display", "block");

		$gallery_loading_area.css("display", "none");

		$gallery_ing_area.css("display", "none");

		$gallery_reserving_area.css("display", "none");

		$gallery_end_area.css("display", "block");

		$campaign_list.css("display", "none");

		$campaign_area.addClass('gallery');

		$campaign_area.removeClass('list');

	}

	// gSt가 짝수이면은 상황에 따라서 갤러리 화면을 출력한다. i
</script>



</html>