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



		<!-- b유저 카드 현황표 -->
		<div class="c_status_button_box_collection">
			<div class="c_status_blank"></div>

			<c:choose>
				<c:when test="${gStnum eq 2 }">
					<div class="c_status_button_box btn_1 first hover" id="reserving_button_box" onclick="location.href='../mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}&galleryStauts=1';">
						<div class="c_status_icon">
							<div class="c_stauts_circle reserve_circle">
								<i class="icon_reserve fa-regular fa-pen-to-square fa-2x icon_white"></i>
							</div>

						</div>
						<div class="c_status_detail" id="applying_button">
							<div class="c_status_text">신청중인 캠페인</div>
							<div class="c_status_number">${campaignReservingCount}</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="c_status_button_box btn_1 first hover" id="reserving_button_box" onclick="location.href='../mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}&galleryStauts=2';">
						<div class="c_status_icon">
							<div class="c_stauts_circle reserve_circle">
								<i class="icon_reserve fa-regular fa-pen-to-square fa-2x icon_white"></i>
							</div>

						</div>
						<div class="c_status_detail" id="applying_button">
							<div class="c_status_text">신청중인 캠페인</div>
							<div class="c_status_number">${campaignReservingCount}</div>
						</div>
					</div>
				</c:otherwise>

			</c:choose>

			<c:choose>
				<c:when test="${gStnum eq 4}">
					<div class="c_status_button_box btn_1 first hover" id="check_button_box" onclick="location.href='../mainBGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}&galleryStauts=3';">
						<div class="c_status_icon">
							<div class="c_stauts_circle check_circle">
								<i class="icon_check fa-sharp fa-solid fa-check fa-2x icon_white"></i>
							</div>

						</div>
						<div class="c_status_detail" id="applying_button">
							<div class="c_status_text">확정된 캠페인</div>
							<div class="c_status_number">${campaignCheckCount}</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="c_status_button_box btn_1 first hover" id="check_button_box" onclick="location.href='../mainBGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}&galleryStauts=4';">
						<div class="c_status_icon">
							<div class="c_stauts_circle check_circle">
								<i class="icon_check fa-sharp fa-solid fa-check fa-2x icon_white"></i>
							</div>

						</div>
						<div class="c_status_detail" id="applying_button">
							<div class="c_status_text">확정된 캠페인</div>
							<div class="c_status_number">${campaignCheckCount}</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>



			<div class="c_status_blank_1100"></div>
			<div class="c_status_blank_1100"></div>

			<c:choose>
				<c:when test="${gStnum eq 6}">
					<div class="c_status_button_box btn_1 first hover" id="ingB_button_box" onclick="location.href='../mainBGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}&galleryStauts=5';">
						<div class="c_status_icon">
							<div class="c_stauts_circle ingB_circle">
								<i class="icon_ingB fa-solid fa-arrows-rotate fa-2x icon_white"></i>
							</div>

						</div>
						<div class="c_status_detail" id="applying_button">
							<div class="c_status_text">진행중인 캠페인</div>
							<div class="c_status_number">${campaigningCountforB}</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="c_status_button_box btn_1 first hover" id="ingB_button_box" onclick="location.href='../mainBGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}&galleryStauts=6';">
						<div class="c_status_icon">
							<div class="c_stauts_circle ingB_circle">
								<i class="icon_ingB fa-solid fa-arrows-rotate fa-2x icon_white"></i>
							</div>

						</div>
						<div class="c_status_detail" id="applying_button">
							<div class="c_status_text">진행중인 캠페인</div>
							<div class="c_status_number">${campaigningCountforB}</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>

			<c:choose>
				<c:when test="${gStnum eq 8}">
					<div class="c_status_button_box btn_1 first hover" id="endB_button_box" onclick="location.href='../mainBGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}&galleryStauts=7';">
						<div class="c_status_icon">
							<div class="c_stauts_circle endB_Circle">
								<i class="icon_endB fa-regular fa-flag fa-2x icon_white"></i>
							</div>

						</div>
						<div class="c_status_detail" id="applying_button">
							<div class="c_status_text">종료된 캠페인</div>
							<div class="c_status_number">${campaignendCountforB}</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="c_status_button_box btn_1 first hover" id="endB_button_box" onclick="location.href='../mainBGallery.do?waitnowPage=${waitnowPage}&collectnowPage=${collectnowPage}&ingnowPage=${ingnowPage}&endnowPage=${endnowPage}&galleryStauts=8';">
						<div class="c_status_icon">
							<div class="c_stauts_circle endB_Circle">
								<i class="icon_endB fa-regular fa-flag fa-2x icon_white"></i>
							</div>

						</div>
						<div class="c_status_detail" id="applying_button">
							<div class="c_status_text">종료된 캠페인</div>
							<div class="c_status_number">${campaignendCountforB}</div>
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
					<button class="change_list icon_black btn_no" onclick="location.href='../mainBTable.do';">
						<i class="fa-solid fa-bars "></i>
					</button>
				</div>
			</div>
			<div class="c_list_blank_2"></div>
		</div>

		<form id="goInfoPage" action="/main/info.do" method="get">
			<input type="hidden" id="campaignId" name="campaignId">
		</form>



		<div class="campaign_list_gallery">

			<div class="campaign_list_gallery_collection" id="gallery_loading">
				<div class="campaign_list_gallery_bar">
					<div class="c_list_blank"></div>
					<div class="campaign_list_gallery_icon">
						<i class="fa-solid fa-circle-dot icon_gray"></i>
					</div>
					<div class="campaign_list_gallery_title">신청중인 캠페인</div>
				</div>

				<c:choose>
					<c:when test="${campaignReservingCount==0}">
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
							<c:forEach items="${galleryreservingBoard}" var="list" varStatus="status">
								<c:if test="${list.cSt eq 1}">
									<c:set var="count" value="${count + 1}" />
									<c:set var="result" value="${count % 3}" />
								</c:if>
								<c:choose>
									<c:when test="${list.cSt eq 1 && result==1}">
										<div class="campaign_list_gallery_card shadow reserveIndex${status.index} loadingCard" id="reserve_first_card">
											<input type="hidden" id="reserveCampaignId${status.index}" name="campaignId" value="${list.cId}">
											<div class="gallery_card_nav">
												<div class="gallery_card_slogan" id="second_reserve_slogan">
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
												<div class="gallery_card_info_table_r" id="reserve_second_price">
													<fmt:formatNumber value="${list.estimate }" pattern="#,###" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">캠페인 카테고리</p>
												</div>
												<div class="gallery_card_info_table_r" id="reserve_second_category">
													<c:out value="${list.category}" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">일정</p>
												</div>
												<div class="gallery_card_info_table_r date2" id="reserve_second_date">
													<c:out value="${list.stDate}" />
													<c:out value=" - " />
													<c:out value="${list.edDate}" />
												</div>
												<div class="gallery_card_info_table_l" id="info_table_last_l">
													<p class="info_content">캠페인 분류</p>
												</div>
												<div class="gallery_card_info_table_r reserve_first_mbr reserve_second_mbr" id="info_table_last_r">
													<c:out value="1:" />
													<c:out value="${list.cMbr}" />
												</div>

											
											</div>
										</div>
									</c:when>
									<c:when test="${list.cSt eq 1 && result==2}">
										<div class="campaign_list_gallery_card shadow reserveIndex${status.index} loadingCard" id="reserve_second_card">
											<input type="hidden" id="reserveCampaignId${status.index}" name="campaignId" value="${list.cId}">
											<div class="gallery_card_nav">
												<div class="gallery_card_slogan" id="second_reserve_slogan">
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
												<div class="gallery_card_info_table_r" id="reserve_second_price">
													<fmt:formatNumber value="${list.estimate }" pattern="#,###" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">캠페인 카테고리</p>
												</div>
												<div class="gallery_card_info_table_r" id="reserve_second_category">
													<c:out value="${list.category}" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">일정</p>
												</div>
												<div class="gallery_card_info_table_r date2" id="reserve_second_category">
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
									<c:when test="${list.cSt eq 1 && result==0}">
										<div class="campaign_list_gallery_card shadow reserveIndex${status.index} loadingCard reserve_third_card" id="campaign_list_gallery_card_last">
											<input type="hidden" id="reserveCampaignId${status.index}" name="campaignId" value="${list.cId}">
											<div class="gallery_card_nav">
												<div class="gallery_card_slogan" id="third_reserve_slogan">
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
												<div class="gallery_card_info_table_r" id="reserve_third_price">
													<fmt:formatNumber value="${list.estimate }" pattern="#,###" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">캠페인 카테고리</p>
												</div>
												<div class="gallery_card_info_table_r" id="reserve_third_category">
													<c:out value="${list.category}" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">일정</p>
												</div>
												<div class="gallery_card_info_table_r date2" id="reserve_third_date">
													<c:out value="${list.stDate}" />
													<c:out value=" - " />
													<c:out value="${list.edDate}" />
												</div>
												<div class="gallery_card_info_table_l" id="info_table_last_l">
													<p class="info_content">캠페인 분류</p>
												</div>
												<div class="gallery_card_info_table_r reserve_third_mbr" id="reserve_second_category">
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
						<div class="footer" id="bgallery_reserve">
							<div class="footer_blank"></div>
							<div class="footer_page">
								<ul class="footer_pagination footer_modal">
									<c:if test="${galleryreservingtCountVO.startPage != 1 }">
										<li class="arrow1"><a href="/mainBGallery.do?reservenowPage=${galleryreservingtCountVO.startPage - 1 }&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}&galleryStauts=2" class="alist_default_left2 start angle"> <i class="fa-sharp fa-solid fa-angles-left"></i></a></li>
									</c:if>
									<c:choose>
										<c:when test="${reservenowPage == galleryreservingtCountVO.startPage}">
											<li><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}&galleryStauts=2" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
										</c:when>
										<c:when test="${reservenowPage != galleryreservingtCountVO.startPage}">
											<li><a href="/mainBGallery.do?reservenowPage=${reservenowPage-1}&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}&galleryStauts=2" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
										</c:when>
									</c:choose>
									<c:forEach begin="${galleryreservingtCountVO.startPage }" end="${galleryreservingtCountVO.endPage }" var="p">
										<c:choose>
											<c:when test="${p == galleryreservingtCountVO.nowPage}">
												<li><a class="alist_default_p active">${p}</a></li>
											</c:when>
											<c:when test="${p != galleryreservingtCountVO.nowPage}">
												<li><a href="/mainBGallery.do?reservenowPage=${p}&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}&galleryStauts=2" class="alist_default_p">${p}</a></li>
											</c:when>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${reservenowPage == galleryreservingtCountVO.lastPage}">
											<li class=""><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}&galleryStauts=2" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
										</c:when>
										<c:when test="${reservenowPage != galleryreservingtCountVO.lastPage }">
											<li class=""><a href="/mainBGallery.do?reservenowPage=${reservenowPage+1}&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}&galleryStauts=2" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
										</c:when>
									</c:choose>
									<c:if test="${galleryreservingtCountVO.endPage != galleryreservingtCountVO.lastPage}">
										<li class="arrow2"><a href="/mainBGallery.do?reservenowPage=${galleryreservingtCountVO.endPage+1 }&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}&galleryStauts=2" class="alist_default_right2 last angle2"><i class="fa-sharp fa-solid fa-angles-right"></i></a></li>
									</c:if>
								</ul>
							</div>

							<div class="footer_blank"></div>
						</div>
					</c:when>

					<c:otherwise>
						<div class="footer" id="bgallery_reserve">
							<div class="footer_blank"></div>
							<div class="footer_page">
								<ul class="footer_pagination footer_modal">
									<c:if test="${galleryreservingtCountVO.startPage != 1 }">
										<li class="arrow1"><a href="/mainBGallery.do?reservenowPage=${galleryreservingtCountVO.startPage - 1 }&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}" class="alist_default_left2 start angle"> <i class="fa-sharp fa-solid fa-angles-left"></i></a></li>
									</c:if>
									<c:choose>
										<c:when test="${reservenowPage == galleryreservingtCountVO.startPage}">
											<li><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
										</c:when>
										<c:when test="${reservenowPage != galleryreservingtCountVO.startPage}">
											<li><a href="/mainBGallery.do?reservenowPage=${reservenowPage-1}&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
										</c:when>
									</c:choose>
									<c:forEach begin="${galleryreservingtCountVO.startPage }" end="${galleryreservingtCountVO.endPage }" var="p">
										<c:choose>
											<c:when test="${p == galleryreservingtCountVO.nowPage}">
												<li><a class="alist_default_p active">${p}</a></li>
											</c:when>
											<c:when test="${p != galleryreservingtCountVO.nowPage}">
												<li><a href="/mainBGallery.do?reservenowPage=${p}&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}" class="alist_default_p">${p}</a></li>
											</c:when>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${reservenowPage == galleryreservingtCountVO.lastPage}">
											<li class=""><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
										</c:when>
										<c:when test="${reservenowPage != galleryreservingtCountVO.lastPage }">
											<li class=""><a href="/mainBGallery.do?reservenowPage=${reservenowPage+1}&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
										</c:when>
									</c:choose>
									<c:if test="${galleryreservingtCountVO.endPage != galleryreservingtCountVO.lastPage}">
										<li class="arrow2"><a href="/mainBGallery.do?reservenowPage=${galleryreservingtCountVO.endPage+1 }&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}" class="alist_default_right2 last angle2"><i class="fa-sharp fa-solid fa-angles-right"></i></a></li>
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
					<div class="campaign_list_gallery_title">확정된 캠페인</div>
				</div>
				<c:choose>
					<c:when test="${campaignCheckCount==0}">
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
							<c:forEach items="${gallerycheckBoard}" var="list" varStatus="status">
								<c:if test="${list.cSt eq 3}">
									<c:set var="count" value="${count + 1}" />
									<c:set var="result" value="${count % 3}" />
								</c:if>
								<c:choose>
									<c:when test="${list.cSt eq 3 && result==1}">
										<div class="campaign_list_gallery_card  shadow checkIndex${status.index}">
											<input type="hidden" id="checkCampaignId${status.index}" name="campaignId" value="${list.cId}">
											<div class="gallery_card_nav">
												<div class="gallery_card_slogan" id="check_first_slogan">
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
												<div class="gallery_card_info_table_r" id="check_first_price">
													<fmt:formatNumber value="${list.estimate }" pattern="#,###" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">캠페인 카테고리</p>
												</div>
												<div class="gallery_card_info_table_r" id="check_first_category">
													<c:out value="${list.category}" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">일정</p>
												</div>
												<div class="gallery_card_info_table_r date2" id="check_first_date">
													<c:out value="${list.stDate}" />
													<c:out value=" - " />
													<c:out value="${list.edDate}" />
												</div>
												<div class="gallery_card_info_table_l" id="info_table_last_l">
													<p class="info_content">캠페인 분류</p>
												</div>
												<div class="gallery_card_info_table_r check_first_mbr" id="info_table_last_r">
													<c:out value="1:" />
													<c:out value="${list.cMbr}" />
												</div>

											
											</div>
										</div>
									</c:when>
									<c:when test="${list.cSt eq 3 && result==2}">
										<div class="campaign_list_gallery_card  shadow checkIndex${status.index}" id="check_second_card">
											<input type="hidden" id="checkCampaignId${status.index}" name="campaignId" value="${list.cId}">
											<div class="gallery_card_nav">
												<div class="gallery_card_slogan" id="check_second_slogan">
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
												<div class="gallery_card_info_table_r" id="check_second_price">
													<fmt:formatNumber value="${list.estimate }" pattern="#,###" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">캠페인 카테고리</p>
												</div>
												<div class="gallery_card_info_table_r" id="check_second_category">
													<c:out value="${list.category}" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">일정</p>
												</div>
												<div class="gallery_card_info_table_r date2" id="check_second_date">
													<c:out value="${list.stDate}" />
													<c:out value=" - " />
													<c:out value="${list.edDate}" />
												</div>
												<div class="gallery_card_info_table_l" id="info_table_last_l">
													<p class="info_content">캠페인 분류</p>
												</div>
												<div class="gallery_card_info_table_r check_second_mbr" id="info_table_last_r">
													<c:out value="1:" />
													<c:out value="${list.cMbr}" />
												</div>

											
											</div>
										</div>
									</c:when>
									<c:when test="${list.cSt eq 3 && result==0}">
										<div class="campaign_list_gallery_card shadow checkIndex${status.index} check_third_card" id="campaign_list_gallery_card_last">
											<input type="hidden" id="checkCampaignId${status.index}" name="campaignId" value="${list.cId}">
											<div class="gallery_card_nav">
												<div class="gallery_card_slogan" id="check_third_slogan">
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
												<div class="gallery_card_info_table_r" id="check_third_price">
													<fmt:formatNumber value="${list.estimate }" pattern="#,###" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">캠페인 카테고리</p>
												</div>
												<div class="gallery_card_info_table_r" id="check_third_category">
													<c:out value="${list.category}" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">일정</p>
												</div>
												<div class="gallery_card_info_table_r date2" id="check_third_date">
													<c:out value="${list.stDate}" />
													<c:out value=" - " />
													<c:out value="${list.edDate}" />
												</div>
												<div class="gallery_card_info_table_l" id="info_table_last_l">
													<p class="info_content">캠페인 분류</p>
												</div>
												<div class="gallery_card_info_table_r check_third_mbr" id="info_table_last_r">
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
						<div class="footer" id="bgallery_check">
							<div class="footer_blank"></div>
							<div class="footer_page">
								<ul class="footer_pagination footer_modal">
									<c:if test="${gallerycheckCountVO.startPage != 1 }">
										<li class="arrow1"><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${gallerycheckCountVO.startPage - 1 }&endBnowPage=${endBnowPage}&galleryStauts=4" class="alist_default_left2 start angle"> <i class="fa-sharp fa-solid fa-angles-left"></i></a></li>
									</c:if>
									<c:choose>
										<c:when test="${checknowPage == gallerycheckCountVO.startPage}">
											<li><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}&galleryStauts=4" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
										</c:when>
										<c:when test="${checknowPage != gallerycheckCountVO.startPage}">
											<li><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage-1}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}&galleryStauts=4" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
										</c:when>
									</c:choose>
									<c:forEach begin="${gallerycheckCountVO.startPage }" end="${gallerycheckCountVO.endPage }" var="p">
										<c:choose>
											<c:when test="${p == gallerycheckCountVO.nowPage}">
												<li><a class="alist_default_p active">${p}</a></li>
											</c:when>
											<c:when test="${p != gallerycheckCountVO.nowPage}">
												<li><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${p}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}&galleryStauts=4" class="alist_default_p">${p}</a></li>
											</c:when>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${checknowPage == gallerycheckCountVO.lastPage}">
											<li class=""><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}&galleryStauts=4" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
										</c:when>
										<c:when test="${checknowPage != gallerycheckCountVO.lastPage }">
											<li class=""><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage+1}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}&galleryStauts=4" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
										</c:when>
									</c:choose>
									<c:if test="${gallerycheckCountVO.endPage != gallerycheckCountVO.lastPage}">
										<li class="arrow2"><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${gallerycheckCountVO.endPage+1 }&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}&galleryStauts=4" class="alist_default_right2 last angle2"><i class="fa-sharp fa-solid fa-angles-right"></i></a></li>
									</c:if>
								</ul>
							</div>
							<div class="footer_blank"></div>
						</div>
					</c:when>

					<c:otherwise>
						<div class="footer" id="bgallery_check">
							<div class="footer_blank"></div>
							<div class="footer_page">
								<ul class="footer_pagination footer_modal">
									<c:if test="${gallerycheckCountVO.startPage != 1 }">
										<li class="arrow1"><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${gallerycheckCountVO.startPage - 1 }&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}" class="alist_default_left2 start angle"> <i class="fa-sharp fa-solid fa-angles-left"></i></a></li>
									</c:if>
									<c:choose>
										<c:when test="${checknowPage == gallerycheckCountVO.startPage}">
											<li><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
										</c:when>
										<c:when test="${checknowPage != gallerycheckCountVO.startPage}">
											<li><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage-1}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
										</c:when>
									</c:choose>
									<c:forEach begin="${gallerycheckCountVO.startPage }" end="${gallerycheckCountVO.endPage }" var="p">
										<c:choose>
											<c:when test="${p == gallerycheckCountVO.nowPage}">
												<li><a class="alist_default_p active">${p}</a></li>
											</c:when>
											<c:when test="${p != gallerycheckCountVO.nowPage}">
												<li><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${p}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}" class="alist_default_p">${p}</a></li>
											</c:when>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${checknowPage == gallerycheckCountVO.lastPage}">
											<li class=""><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
										</c:when>
										<c:when test="${checknowPage != gallerycheckCountVO.lastPage }">
											<li class=""><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage+1}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
										</c:when>
									</c:choose>
									<c:if test="${gallerycheckCountVO.endPage != gallerycheckCountVO.lastPage}">
										<li class="arrow2"><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${gallerycheckCountVO.endPage+1 }&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}" class="alist_default_right2 last angle2"><i class="fa-sharp fa-solid fa-angles-right"></i></a></li>
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
					<c:when test="${campaigningCountforB==0}">
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
							<c:forEach items="${galleryingBoardB}" var="list" varStatus="status">
								<c:if test="${list.cSt eq 4}">
									<c:set var="count" value="${count + 1}" />
									<c:set var="result" value="${count % 3}" />
								</c:if>
								<c:choose>
									<c:when test="${list.cSt eq 4 && result==1}">
										<div class="campaign_list_gallery_card shadow ingBIndex${status.index}">
											<input type="hidden" id="ingBcampaignId${status.index}" name="campaignId" value="${list.cId}">
											<div class="gallery_card_nav">
												<div class="gallery_card_slogan" id="bing_first_slogan">
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
												<div class="gallery_card_info_table_r" id="bing_first_price">
													<fmt:formatNumber value="${list.estimate }" pattern="#,###" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">캠페인 카테고리</p>
												</div>
												<div class="gallery_card_info_table_r" id="bing_first_category">
													<c:out value="${list.category}" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">일정</p>
												</div>
												<div class="gallery_card_info_table_r date2" id="bing_first_date">
													<c:out value="${list.stDate}" />
													<c:out value=" - " />
													<c:out value="${list.edDate}" />
												</div>
												<div class="gallery_card_info_table_l" id="info_table_last_l">
													<p class="info_content">캠페인 분류</p>
												</div>
												<div class="gallery_card_info_table_r bing_first_mbr" id="info_table_last_r">
													<c:out value="1:" />
													<c:out value="${list.cMbr}" />
												</div>

											
											</div>
										</div>
									</c:when>
									<c:when test="${list.cSt eq 4&& result==2}">
										<div class="campaign_list_gallery_card shadow ingBIndex${status.index}" id="bing_second_card">
											<input type="hidden" id="ingBcampaignId${status.index}" name="campaignId" value="${list.cId}">
											<div class="gallery_card_nav">
												<div class="gallery_card_slogan" id="bing_second_slogan">
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
												<div class="gallery_card_info_table_r" id="bing_second_price">
													<fmt:formatNumber value="${list.estimate }" pattern="#,###" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">캠페인 카테고리</p>
												</div>
												<div class="gallery_card_info_table_r" id="bing_second_category">
													<c:out value="${list.category}" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">일정</p>
												</div>
												<div class="gallery_card_info_table_r date2" id="bing_second_date">
													<c:out value="${list.stDate}" />
													<c:out value=" - " />
													<c:out value="${list.edDate}" />
												</div>
												<div class="gallery_card_info_table_l" id="info_table_last_l">
													<p class="info_content">캠페인 분류</p>
												</div>
												<div class="gallery_card_info_table_r bing_second_mbr" id="info_table_last_r">
													<c:out value="1:" />
													<c:out value="${list.cMbr}" />
												</div>

											
											</div>
										</div>
									</c:when>
									<c:when test="${list.cSt eq 4 && result==0}">
										<div class="campaign_list_gallery_card shadow bing_third_card ingBIndex${status.index}" id="campaign_list_gallery_card_last">
											<input type="hidden" id="ingBcampaignId${status.index}" name="campaignId" value="${list.cId}">
											<div class="gallery_card_nav">
												<div class="gallery_card_slogan" id="bing_third_slogan">
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
												<div class="gallery_card_info_table_r" id="bing_third_price">
													<fmt:formatNumber value="${list.estimate }" pattern="#,###" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">캠페인 카테고리</p>
												</div>
												<div class="gallery_card_info_table_r" id="bing_third_category">
													<c:out value="${list.category}" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">일정</p>
												</div>
												<div class="gallery_card_info_table_r date2" id="bing_third_date">
													<c:out value="${list.stDate}" />
													<c:out value=" - " />
													<c:out value="${list.edDate}" />
												</div>
												<div class="gallery_card_info_table_l" id="info_table_last_l">
													<p class="info_content">캠페인 분류</p>
												</div>
												<div class="gallery_card_info_table_r bing_third_mbr" id="info_table_last_r">
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

						<div class="footer" id="bgallery_ing">
							<div class="footer_blank"></div>
							<div class="footer_page">
								<ul class="footer_pagination footer_modal">
									<c:if test="${galleryingCountforBVO.startPage != 1 }">
										<li class="arrow1"><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${galleryingCountforBVO.startPage - 1 }&endBnowPage=${endBnowPage}&galleryStauts=6" class="alist_default_left2 start angle"> <i class="fa-sharp fa-solid fa-angles-left"></i></a></li>
									</c:if>
									<c:choose>
										<c:when test="${ingBnowPage == galleryingCountforBVO.startPage}">
											<li><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}&galleryStauts=6" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
										</c:when>
										<c:when test="${ingBnowPage != galleryingCountforBVO.startPage}">
											<li><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage-1 }&endBnowPage=${endBnowPage}&galleryStauts=6" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
										</c:when>
									</c:choose>
									<c:forEach begin="${galleryingCountforBVO.startPage }" end="${galleryingCountforBVO.endPage }" var="p">
										<c:choose>
											<c:when test="${p == galleryingCountforBVO.nowPage}">
												<li><a class="alist_default_p active">${p}</a></li>
											</c:when>
											<c:when test="${p != galleryingCountforBVO.nowPage}">
												<li><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${p}&endBnowPage=${endBnowPage}&galleryStauts=6" class="alist_default_p">${p}</a></li>
											</c:when>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${ingBnowPage == galleryingCountforBVO.lastPage}">
											<li class=""><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}&galleryStauts=6" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
										</c:when>
										<c:when test="${ingBnowPage != galleryingCountforBVO.lastPage }">
											<li class=""><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage+1 }&endBnowPage=${endBnowPage}&galleryStauts=6" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
										</c:when>
									</c:choose>
									<c:if test="${galleryingCountforBVO.endPage != galleryingCountforBVO.lastPage}">
										<li class="arrow2"><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${galleryingCountforBVO.endPage+1 }&endBnowPage=${endBnowPage}&galleryStauts=6" class="alist_default_right2 last angle2"><i class="fa-sharp fa-solid fa-angles-right"></i></a></li>
									</c:if>
								</ul>
							</div>

							<div class="footer_blank"></div>
						</div>
					</c:when>
					<c:otherwise>

						<div class="footer" id="bgallery_ing">
							<div class="footer_blank"></div>
							<div class="footer_page">
								<ul class="footer_pagination footer_modal">
									<c:if test="${galleryingCountforBVO.startPage != 1 }">
										<li class="arrow1"><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${galleryingCountforBVO.startPage - 1 }&endBnowPage=${endBnowPage}" class="alist_default_left2 start angle"> <i class="fa-sharp fa-solid fa-angles-left"></i></a></li>
									</c:if>
									<c:choose>
										<c:when test="${ingBnowPage == galleryingCountforBVO.startPage}">
											<li><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
										</c:when>
										<c:when test="${ingBnowPage != galleryingCountforBVO.startPage}">
											<li><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage-1 }&endBnowPage=${endBnowPage}" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
										</c:when>
									</c:choose>
									<c:forEach begin="${galleryingCountforBVO.startPage }" end="${galleryingCountforBVO.endPage }" var="p">
										<c:choose>
											<c:when test="${p == galleryingCountforBVO.nowPage}">
												<li><a class="alist_default_p active">${p}</a></li>
											</c:when>
											<c:when test="${p != galleryingCountforBVO.nowPage}">
												<li><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${p}&endBnowPage=${endBnowPage}" class="alist_default_p">${p}</a></li>
											</c:when>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${ingBnowPage == galleryingCountforBVO.lastPage}">
											<li class=""><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
										</c:when>
										<c:when test="${ingBnowPage != galleryingCountforBVO.lastPage }">
											<li class=""><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage + 1}&endBnowPage=${endBnowPage}" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
										</c:when>
									</c:choose>
									<c:if test="${galleryingCountforBVO.endPage != galleryingCountforBVO.lastPage}">
										<li class="arrow2"><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${galleryingCountforBVO.endPage+1 }&endBnowPage=${endBnowPage}" class="alist_default_right2 last angle2"><i class="fa-sharp fa-solid fa-angles-right"></i></a></li>
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
					<c:when test="${campaignendCountforB==0}">
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
							<c:forEach items="${galleryendBoardB}" var="list" varStatus="status">
								<c:if test="${list.cSt eq 5}">
									<c:set var="count" value="${count + 1}" />
									<c:set var="result" value="${count % 3}" />
								</c:if>
								<c:choose>
									<c:when test="${list.cSt eq 5 && result==1}">
										<div class="campaign_list_gallery_card shadow endBIndex${status.index}">
											<input type="hidden" id="endBCampaignId${status.index}" name="campaignId" value="${list.cId}">
											<div class="gallery_card_nav">
												<div class="gallery_card_slogan" id="bend_first_slogan">
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
												<div class="gallery_card_info_table_r" id="bend_first_price">
													<fmt:formatNumber value="${list.estimate }" pattern="#,###" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">캠페인 카테고리</p>
												</div>
												<div class="gallery_card_info_table_r" id="bend_first_category">
													<c:out value="${list.category}" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">일정</p>
												</div>
												<div class="gallery_card_info_table_r date2" id="bend_first_date">
													<c:out value="${list.stDate}" />
													<c:out value=" - " />
													<c:out value="${list.edDate}" />
												</div>
												<div class="gallery_card_info_table_l" id="info_table_last_l">
													<p class="info_content">캠페인 분류</p>
												</div>
												<div class="gallery_card_info_table_r bend_first_mbr" id="info_table_last_r">
													<c:out value="1:" />
													<c:out value="${list.cMbr}" />
												</div>

									
											</div>
										</div>
									</c:when>
									<c:when test="${list.cSt eq 5 && result==2}">
										<div class="campaign_list_gallery_card shadow endBIndex${status.index}" id="bend_second_card">
											<input type="hidden" id="endBCampaignId${status.index}" name="campaignId" value="${list.cId}">
											<div class="gallery_card_nav">
												<div class="gallery_card_slogan" id="bend_second_slogan">
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
												<div class="gallery_card_info_table_r" id="bend_second_price">
													<fmt:formatNumber value="${list.estimate }" pattern="#,###" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">캠페인 카테고리</p>
												</div>
												<div class="gallery_card_info_table_r" id="bend_second_category">
													<c:out value="${list.category}" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">일정</p>
												</div>
												<div class="gallery_card_info_table_r date2" id="bend_second_date">
													<c:out value="${list.stDate}" />
													<c:out value=" - " />
													<c:out value="${list.edDate}" />
												</div>
												<div class="gallery_card_info_table_l" id="info_table_last_l">
													<p class="info_content">캠페인 분류</p>
												</div>
												<div class="gallery_card_info_table_r bend_second_mbr" id="info_table_last_r">
													<c:out value="1:" />
													<c:out value="${list.cMbr}" />
												</div>

						
											</div>
										</div>
									</c:when>
									<c:when test="${list.cSt eq 5 && result==0}">
										<div class="campaign_list_gallery_card shadow endBIndex${status.index} bend_third_card" id="campaign_list_gallery_card_last">
											<input type="hidden" id="endBCampaignId${status.index}" name="campaignId" value="${list.cId}">
											<div class="gallery_card_nav">
												<div class="gallery_card_slogan" id="bend_third_slogan">
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
												<div class="gallery_card_info_table_r" id="bend_third_price">
													<fmt:formatNumber value="${list.estimate }" pattern="#,###" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">캠페인 카테고리</p>
												</div>
												<div class="gallery_card_info_table_r" id="bend_third_category">
													<c:out value="${list.category}" />
												</div>
												<div class="gallery_card_info_table_l">
													<p class="info_content">일정</p>
												</div>
												<div class="gallery_card_info_table_r date2" id="bend_third_date">
													<c:out value="${list.stDate}" />
													<c:out value=" - " />
													<c:out value="${list.edDate}" />
												</div>
												<div class="gallery_card_info_table_l" id="info_table_last_l">
													<p class="info_content">캠페인 분류</p>
												</div>
												<div class="gallery_card_info_table_r bend_third_mbr" id="info_table_last_r">
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
						<div class="footer" id="bgallery_end">
							<div class="footer_blank"></div>
							<div class="footer_page">
								<ul class="footer_pagination footer_modal">
									<c:if test="${galleryendCountforBVO.startPage != 1 }">
										<li class="arrow1"><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage==${ingBnowPage}&endBnowPage=${galleryendCountforBVO.startPage - 1 }&galleryStauts=8" class="alist_default_left2 start angle"> <i class="fa-sharp fa-solid fa-angles-left"></i></a></li>
									</c:if>
									<c:choose>
										<c:when test="${endBnowPage == galleryendCountforBVO.startPage}">
											<li><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}&galleryStauts=8" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
										</c:when>
										<c:when test="${endBnowPage != galleryendCountforBVO.startPage}">
											<li><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage-1}&galleryStauts=8" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
										</c:when>
									</c:choose>
									<c:forEach begin="${galleryendCountforBVO.startPage }" end="${galleryendCountforBVO.endPage }" var="p">
										<c:choose>
											<c:when test="${p == galleryendCountforBVO.nowPage}">
												<li><a class="alist_default_p active">${p}</a></li>
											</c:when>
											<c:when test="${p != galleryendCountforBVO.nowPage}">
												<li><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage }&endBnowPage=${p}&galleryStauts=8" class="alist_default_p">${p}</a></li>
											</c:when>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${endBnowPage == galleryendCountforBVO.lastPage}">
											<li class=""><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}&galleryStauts=8" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
										</c:when>
										<c:when test="${endBnowPage != galleryendCountforBVO.lastPage }">
											<li class=""><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage+1}&galleryStauts=8" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
										</c:when>
									</c:choose>
									<c:if test="${galleryendCountforBVO.endPage != galleryendCountforBVO.lastPage}">
										<li class="arrow2"><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage }&endBnowPage=${galleryendCountforBVO.endPage+1 }&galleryStauts=8" class="alist_default_right2 last angle2"><i class="fa-sharp fa-solid fa-angles-right"></i></a></li>
									</c:if>
								</ul>
							</div>

							<div class="footer_blank"></div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="footer" id="bgallery_end">
							<div class="footer_blank"></div>
							<div class="footer_page">
								<ul class="footer_pagination footer_modal">
									<c:if test="${galleryendCountforBVO.startPage != 1 }">
										<li class="arrow1"><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage==${ingBnowPage}&endBnowPage=${galleryendCountforBVO.startPage - 1 }" class="alist_default_left2 start angle"> <i class="fa-sharp fa-solid fa-angles-left"></i></a></li>
									</c:if>
									<c:choose>
										<c:when test="${endBnowPage == galleryendCountforBVO.startPage}">
											<li><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
										</c:when>
										<c:when test="${endBnowPage != galleryendCountforBVO.startPage}">
											<li><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage-1}" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
										</c:when>
									</c:choose>
									<c:forEach begin="${galleryendCountforBVO.startPage }" end="${galleryendCountforBVO.endPage }" var="p">
										<c:choose>
											<c:when test="${p == galleryendCountforBVO.nowPage}">
												<li><a class="alist_default_p active">${p}</a></li>
											</c:when>
											<c:when test="${p != galleryendCountforBVO.nowPage}">
												<li><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage }&endBnowPage=${p}" class="alist_default_p">${p}</a></li>
											</c:when>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${endBnowPage == galleryendCountforBVO.lastPage}">
											<li class=""><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage}" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
										</c:when>
										<c:when test="${endBnowPage != galleryendCountforBVO.lastPage }">
											<li class=""><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage }&endBnowPage=${endBnowPage+1}" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
										</c:when>
									</c:choose>
									<c:if test="${galleryendCountforBVO.endPage != galleryendCountforBVO.lastPage}">
										<li class="arrow2"><a href="/mainBGallery.do?reservenowPage=${reservenowPage}&checknowPage=${checknowPage}&ingBnowPage=${ingBnowPage }&endBnowPage=${galleryendCountforBVO.endPage+1 }" class="alist_default_right2 last angle2"><i class="fa-sharp fa-solid fa-angles-right"></i></a></li>
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
	var gSt = "${gStnum}";

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

	// gSt가 짝수이면은 상황에 따라서 갤러리 화면을 출력한다.
</script>


</html>