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

		<!--  a유저 카드 현황표 -->

		<div class="c_status_button_box_collection">

			<div class="c_status_blank"></div>

			<c:choose>
				<c:when test="${cStnum==2}">
					<div class="c_status_button_box btn_1 first hover" id="wait_button_box" onclick="location.href='../mainATable.do?cSt=1&nowPage=1';">
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
					<div class="c_status_button_box btn_1 first hover" id="wait_button_box" onclick="location.href='../mainATable.do?cSt=2&nowPage=1';">
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
				<c:when test="${cStnum==4}">
					<div class="c_status_button_box btn_1 first hover" id="collect_button_box" onclick="location.href='../mainATable.do?cSt=3&nowPage=1';">
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
					<div class="c_status_button_box btn_1 first hover" id="collect_button_box" onclick="location.href='../mainATable.do?cSt=4&nowPage=1';">
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
				<c:when test="${cStnum==6}">
					<div class="c_status_button_box btn_1 first hover" id="ingA_button_box" onclick="location.href='../mainATable.do?cSt=5&nowPage=1';">
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
					<div class="c_status_button_box btn_1 first hover" id="ingA_button_box" onclick="location.href='../mainATable.do?cSt=6&nowPage=1';">
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
				<c:when test="${cStnum==8}">
					<div class="c_status_button_box btn_1 first hover" id="endA_button_box" onclick="location.href='../mainATable.do?cSt=7&nowPage=1';">
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
					<div class="c_status_button_box btn_1 first hover" id="endA_button_box" onclick="location.href='../mainATable.do?cSt=8&nowPage=1';">
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
					<button class="change_gallery icon_black btn_no" onclick="location.href='../mainAGallery.do';" >
						<i class="fa-solid fa-border-all "></i>
					</button>
				</div>
				<div class="campaign_list_nav_button ">
					<button class="change_list icon_black btn_no">
						<i class="fa-solid fa-bars "></i>
					</button>
				</div>
			</div>
			<div class="c_list_blank_2"></div>
		</div>

		<!-- 캠페인 리스트 표 -->
		<div class='campaign_list list'>
			<div class="campaign_list_bar">
				<div class="campaign_list_button_group">
					<div class="list_table last_button" id="">
						<div class="table-blank1"></div>
						<div class="table_main last_button" id="">
							<table class="tg last_button shadow" id="myTable">
								<thead class="last_button" id="">
									<tr class="last_button" id="">
										<!--  캠페인 표 헤더 -->
										<th class="c_th" onclick="sortTablebystatusA(0)">캠페인 상태</th>
										<th class="c_th" onclick="sortTablebystr(1)">캠페인</th>
										<th class="c_th" onclick="sortTablebystr(2)">캠페인 카테고리</th>
										<th class="c_th" onclick="sortTablebydate(3)">일정</th>
										<th class="c_th" onclick="sortTablebynum(4)">금액</th>
										<th class="c_th" onclick="sortTablebyratio(5)">캠페인 분류</th>
										<th class="c_th" onclick="sortTablebynum(6)">신청자 수</th>
										<th class="c_th last_button" onclick="sortTablebydate(7)" id="">생성일</th>
									</tr>
								</thead>
								<tbody id="table_body">
									<c:choose>
										<c:when test="${fn:length(viewAll)==0}">
											<tr>
												<td class="table_blank_left" colspan=9>캠페인이 존재하지 않습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach items="${viewAll}" var="list" varStatus="status">
												<tr class="goCampaignInfo${status.index}">
													<input type="hidden" id="campaignId${status.index}" name="campaignId" value="${list.cId }">
													<td class="c_td icon_con">
														<div class="icon_list">
															<c:choose>
																<c:when test="${list.cSt eq 0}">
																	<i class="fa-solid fa-circle-dot icon_gray icon_pt"></i>
																</c:when>
																<c:when test="${list.cSt eq 1}">
																	<i class="fa-solid fa-circle-dot icon_orange icon_pt"></i>
																</c:when>
																<c:when test="${list.cSt eq 2}">
																	<i class="fa-solid fa-circle-dot icon_yellow icon_pt"></i>
																</c:when>
																<c:when test="${list.cSt eq 3}">
																	<i class="fa-solid fa-circle-dot icon_green icon_pt"></i>
																</c:when>
																<c:when test="${list.cSt eq 4}">
																	<i class="fa-solid fa-circle-dot icon_black icon_pt"></i>
																</c:when>
																<c:when test="${list.cSt eq 5}">
																	<i class="fa-solid fa-circle-dot icon_red icon_pt"></i>
																</c:when>
															</c:choose>
														</div>
														<c:choose>
															<c:when test="${list.cSt eq 0}">
																<div class="icon_title">반려중</div>
															</c:when>
															<c:when test="${list.cSt eq 1}">
																<div class="icon_title">신청중</div>
															</c:when>
															<c:when test="${list.cSt eq 2}">
																<div class="icon_title">모집중</div>
															</c:when>
															<c:when test="${list.cSt eq 3}">
																<div class="icon_title">진행중</div>
															</c:when>
															<c:when test="${list.cSt eq 4}">
																<div class="icon_title">모집완료</div>
															</c:when>
															<c:when test="${list.cSt eq 5}">
																<div class="icon_title">종료</div>
															</c:when>
														</c:choose>
													</td>
													<td class="c_td">
														<c:out value="${list.cNm}" />
													</td>
													<td class="c_td">
														<c:out value="${list.category}" />
													</td>
													<td class="c_td date">
														<c:out value="${list.stDate}" />
														<c:out value=" - " />
														<c:out value="${list.edDate}" />
													</td>
													<td class="c_td"><fmt:formatNumber value="${list.estimate }" pattern="#,###" /></td>
													<td class="c_td">
														<c:out value="1:" />
														<c:out value="${list.cMbr}" />
													</td>
													<td class="c_td">
														<c:choose>
															<c:when test="${list.applicantNum >= 0 }">
																<c:out value="${list.applicantNum}" />
															</c:when>
															<c:otherwise>
															0
															</c:otherwise>
														</c:choose>
													</td>
													<td class="c_td">
														<c:out value="${list.cDt}" />
													</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
							<form id="goInfoPage" action="/main/info.do" method="get">
								<input type="hidden" id="campaignId" name="campaignId">
							</form>
						</div>
						<div class="table-blank1"></div>

						<!-- 푸터 권한에 따라 나눔 -->

						<c:choose>
							<c:when test="${cStnum ==2 }">
								<div class="footer" id="wait_pg">
									<div class="footer_blank"></div>
									<div class="footer_page">
										<ul class="footer_pagination footer_modal">
											<c:if test="${campaignwaitCountVO.startPage != 1 }">
												<li class="arrow1"><a href="/mainATable.do?cSt=2&nowPage=${campaignwaitCountVO.startPage - 1 }" class="alist_default_left2 start angle"> <i class="fa-sharp fa-solid fa-angles-left"></i></a></li>
											</c:if>
											<c:choose>
												<c:when test="${nowPagenum == campaignwaitCountVO.startPage}">
													<li><a href="/mainATable.do?cSt=2&nowPage=${nowPagenum}" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
												</c:when>
												<c:when test="${nowPagenum != campaignwaitCountVO.startPage}">
													<li><a href="/mainATable.do?cSt=2&nowPage=${nowPagenum-1}" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
												</c:when>
											</c:choose>
											<c:forEach begin="${campaignwaitCountVO.startPage }" end="${campaignwaitCountVO.endPage }" var="p">
												<c:choose>
													<c:when test="${p == campaignwaitCountVO.nowPage}">
														<li><a class="alist_default_p active">${p}</a></li>
													</c:when>
													<c:when test="${p != campaignwaitCountVO.nowPage}">
														<li><a href="/mainATable.do?cSt=2&nowPage=${p}" class="alist_default_p">${p}</a></li>
													</c:when>
												</c:choose>
											</c:forEach>
											<c:choose>
												<c:when test="${nowPagenum == campaignwaitCountVO.lastPage}">
													<li class=""><a href="/mainATable.do?cSt=2&nowPage=${nowPagenum}" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
												</c:when>
												<c:when test="${nowPagenum != campaignwaitCountVO.lastPage }">
													<li class=""><a href="/mainATable.do?cSt=2&nowPage=${nowPagenum+1}" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
												</c:when>
											</c:choose>
											<c:if test="${campaignwaitCountVO.endPage != campaignwaitCountVO.lastPage}">
												<li class="arrow2"><a href="/mainATable.do?cSt=2&nowPage=${campaignwaitCountVO.endPage+1 }" class="alist_default_right2 last angle2"><i class="fa-sharp fa-solid fa-angles-right"></i></a></li>
											</c:if>
										</ul>
									</div>
									<div class="footer_blank"></div>
								</div>
							</c:when>

							<c:when test="${cStnum ==4}">
								<div class="footer" id="collect_pg">
									<div class="footer_blank"></div>
									<div class="footer_page">
										<ul class="footer_pagination footer_modal">
											<c:if test="${campaigncollectCountVO.startPage != 1 }">
												<li class="arrow1"><a href="/mainATable.do?cSt=4&nowPage=${campaigncollectCountVO.startPage - 1 }" class="alist_default_left2 start angle"> <i class="fa-sharp fa-solid fa-angles-left"></i></a></li>
											</c:if>
											<c:choose>
												<c:when test="${nowPagenum == campaigncollectCountVO.startPage}">
													<li><a href="/mainATable.do?cSt=4&nowPage=${nowPagenum}" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
												</c:when>
												<c:when test="${nowPagenum != campaigncollectCountVO.startPage}">
													<li><a href="/mainATable.do?cSt=4&nowPage=${nowPagenum-1}" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
												</c:when>
											</c:choose>
											<c:forEach begin="${campaigncollectCountVO.startPage }" end="${campaigncollectCountVO.endPage }" var="p">
												<c:choose>
													<c:when test="${p == campaigncollectCountVO.nowPage}">
														<li><a class="alist_default_p active">${p}</a></li>
													</c:when>
													<c:when test="${p != campaigncollectCountVO.nowPage}">
														<li><a href="/mainATable.do?cSt=4&nowPage=${p}" class="alist_default_p">${p}</a></li>
													</c:when>
												</c:choose>
											</c:forEach>
											<c:choose>
												<c:when test="${nowPagenum == campaigncollectCountVO.lastPage}">
													<li class=""><a href="/mainATable.do?cSt=4&nowPage=${nowPagenum}" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
												</c:when>
												<c:when test="${nowPagenum != campaigncollectCountVO.lastPage }">
													<li class=""><a href="/mainATable.do?cSt=4&nowPage=${nowPagenum+1}" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
												</c:when>
											</c:choose>
											<c:if test="${campaigncollectCountVO.endPage != campaigncollectCountVO.lastPage}">
												<li class="arrow2"><a href="/mainATable.do?cSt=4&nowPage=${campaigncollectCountVO.endPage+1 }" class="alist_default_right2 last angle2"><i class="fa-sharp fa-solid fa-angles-right"></i></a></li>
											</c:if>
										</ul>
									</div>
									<div class="footer_blank"></div>
								</div>
							</c:when>

							<c:when test="${cStnum ==6}">
								<div class="footer" id="ing_pg">
									<div class="footer_blank"></div>
									<div class="footer_page">
										<ul class="footer_pagination footer_modal">
											<c:if test="${campaigningCountforAVO.startPage != 1 }">
												<li class="arrow1"><a href="/mainATable.do?cSt=6&nowPage=${campaigningCountforAVO.startPage - 1 }" class="alist_default_left2 start angle"> <i class="fa-sharp fa-solid fa-angles-left"></i></a></li>
											</c:if>
											<c:choose>
												<c:when test="${nowPagenum == campaigningCountforAVO.startPage}">
													<li><a href="/mainATable.do?cSt=6&nowPage=${nowPagenum}" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
												</c:when>
												<c:when test="${nowPagenum != campaigningCountforAVO.startPage}">
													<li><a href="/mainATable.do?cSt=6&nowPage=${nowPagenum-1}" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
												</c:when>
											</c:choose>
											<c:forEach begin="${campaigningCountforAVO.startPage }" end="${campaigningCountforAVO.endPage }" var="p">
												<c:choose>
													<c:when test="${p == campaigningCountforAVO.nowPage}">
														<li><a class="alist_default_p active">${p}</a></li>
													</c:when>
													<c:when test="${p != campaigningCountforAVO.nowPage}">
														<li><a href="/mainATable.do?cSt=6&nowPage=${p}" class="alist_default_p">${p}</a></li>
													</c:when>
												</c:choose>
											</c:forEach>
											<c:choose>
												<c:when test="${nowPagenum == campaigningCountforAVO.lastPage}">
													<li class=""><a href="/mainATable.do?cSt=6&nowPage=${nowPagenum}" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
												</c:when>
												<c:when test="${nowPagenum != campaigningCountforAVO.lastPage }">
													<li class=""><a href="/mainATable.do?cSt=6&nowPage=${nowPagenum+1}" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
												</c:when>
											</c:choose>
											<c:if test="${campaigningCountforAVO.endPage != campaigningCountforAVO.lastPage}">
												<li class="arrow2"><a href="/mainATable.do?cSt=6&nowPage=${campaigncollectCountVO.endPage+1 }" class="alist_default_right2 last angle2"><i class="fa-sharp fa-solid fa-angles-right"></i></a></li>
											</c:if>
										</ul>
									</div>
									<div class="footer_blank"></div>
								</div>
							</c:when>

							<c:when test="${cStnum ==8}">
								<div class="footer" id="end_pg">
									<div class="footer_blank"></div>
									<div class="footer_page">
										<ul class="footer_pagination footer_modal">
											<c:if test="${campaignendCountforAVO.startPage != 1 }">
												<li class="arrow1"><a href="/mainATable.do?cSt=6&nowPage=${campaignendCountforAVO.startPage - 1 }" class="alist_default_left2 start angle"> <i class="fa-sharp fa-solid fa-angles-left"></i></a></li>
											</c:if>
											<c:choose>
												<c:when test="${nowPagenum == campaignendCountforAVO.startPage}">
													<li><a href="/mainATable.do?cSt=8&nowPage=${nowPagenum}" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
												</c:when>
												<c:when test="${nowPagenum != campaignendCountforAVO.startPage}">
													<li><a href="/mainATable.do?cSt=8&nowPage=${nowPagenum-1}" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
												</c:when>
											</c:choose>
											<c:forEach begin="${campaignendCountforAVO.startPage }" end="${campaignendCountforAVO.endPage }" var="p">
												<c:choose>
													<c:when test="${p == campaignendCountforAVO.nowPage}">
														<li><a class="alist_default_p active">${p}</a></li>
													</c:when>
													<c:when test="${p != campaignendCountforAVO.nowPage}">
														<li><a href="/mainATable.do?cSt=8&nowPage=${p}" class="alist_default_p">${p}</a></li>
													</c:when>
												</c:choose>
											</c:forEach>
											<c:choose>
												<c:when test="${nowPagenum == campaignendCountforAVO.lastPage}">
													<li class=""><a href="/mainATable.do?cSt=8&nowPage=${nowPagenum}" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
												</c:when>
												<c:when test="${nowPagenum != campaignendCountforAVO.lastPage }">
													<li class=""><a href="/mainATable.do?cSt=8&nowPage=${nowPagenum+1}" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
												</c:when>
											</c:choose>
											<c:if test="${campaignendCountforAVO.endPage != campaignendCountforAVO.lastPage}">
												<li class="arrow2"><a href="/mainATable.do?cSt=8&nowPage=${campaignendCountforAVO.endPage+1 }" class="alist_default_right2 last angle2"><i class="fa-sharp fa-solid fa-angles-right"></i></a></li>
											</c:if>
										</ul>
									</div>
									<div class="footer_blank"></div>
								</div>
							</c:when>

							<c:otherwise>
								<div class="footer" id="default_pg">
									<div class="footer_blank"></div>
									<div class="footer_page">
										<ul class="footer_pagination footer_modal">
											<c:if test="${campaigntotalCountVO.startPage != 1 }">
												<li class="arrow1"><a href="/mainATable.do?cSt=0&nowPage=${campaigntotalCountVO.startPage - 1 }" class="alist_default_left2 start angle"> <i class="fa-sharp fa-solid fa-angles-left"></i></a></li>
											</c:if>
											<c:choose>
												<c:when test="${nowPagenum == campaigntotalCountVO.startPage}">
													<li><a href="/mainATable.do?cSt=0&nowPage=${nowPagenum}" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
												</c:when>
												<c:when test="${nowPagenum != campaigntotalCountVO.startPage}">
													<li><a href="/mainATable.do?cSt=0&nowPage=${nowPagenum-1}" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
												</c:when>
											</c:choose>
											<c:forEach begin="${campaigntotalCountVO.startPage }" end="${campaigntotalCountVO.endPage }" var="p">
												<c:choose>
													<c:when test="${p == campaigntotalCountVO.nowPage}">
														<li><a class="alist_default_p active">${p}</a></li>
													</c:when>
													<c:when test="${p != campaigntotalCountVO.nowPage}">
														<li><a href="/mainATable.do?cSt=0&nowPage=${p}" class="alist_default_p">${p}</a></li>
													</c:when>
												</c:choose>
											</c:forEach>
											<c:choose>
												<c:when test="${nowPagenum == campaigntotalCountVO.lastPage}">
													<li class=""><a href="/mainATable.do?cSt=0&nowPage=${nowPagenum}" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
												</c:when>
												<c:when test="${nowPagenum != campaigntotalCountVO.lastPage }">
													<li class=""><a href="/mainATable.do?cSt=0&nowPage=${nowPagenum+1}" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
												</c:when>
											</c:choose>
											<c:if test="${campaigntotalCountVO.endPage != campaigntotalCountVO.lastPage}">
												<li class="arrow2"><a href="/mainATable.do?cSt=0&nowPage=${campaigntotalCountVO.endPage+1 }" class="alist_default_right2 last angle2"><i class="fa-sharp fa-solid fa-angles-right"></i></a></li>
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


</html>
