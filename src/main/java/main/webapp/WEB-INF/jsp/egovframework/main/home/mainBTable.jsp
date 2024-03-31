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
				<c:when test="${cStnum !=2 }">
					<div class="c_status_button_box btn_1 first hover" id="reserving_button_box" onclick="location.href='../mainBTable.do?cSt=2&nowPage=1';">
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
					<div class="c_status_button_box btn_1 first hover" id="reserving_button_box" onclick="location.href='../mainBTable.do?cSt=1&nowPage=1';">
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
				<c:when test="${cStnum !=4 }">
					<div class="c_status_button_box btn_1 first hover" id="check_button_box" onclick="location.href='../mainBTable.do?cSt=4&nowPage=1';">
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
					<div class="c_status_button_box btn_1 first hover" id="check_button_box" onclick="location.href='../mainBTable.do?cSt=3&nowPage=1';">
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
				<c:when test="${cStnum !=6 }">
					<div class="c_status_button_box btn_1 first hover" id="ingB_button_box" onclick="location.href='../mainBTable.do?cSt=6&nowPage=1';">
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
					<div class="c_status_button_box btn_1 first hover" id="ingB_button_box" onclick="location.href='../mainBTable.do?cSt=5&nowPage=1';">
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
				<c:when test="${cStnum !=8 }">
					<div class="c_status_button_box btn_1 first hover" id="endB_button_box" onclick="location.href='../mainBTable.do?cSt=8&nowPage=1';">
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
					<div class="c_status_button_box btn_1 first hover" id="endB_button_box" onclick="location.href='../mainBTable.do?cSt=7&nowPage=1';">
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
					<button class="change_gallery icon_black btn_no" onclick="location.href='../mainBGallery.do';">
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
										<th class="c_th" onclick="sortTablebystatusB(0)">캠페인 상태</th>
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
									<!-- 권한에 따라 캠페인 없음 표출 조건 나눔 -->
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
																<c:when test="${list.cSt eq 1}">
																	<i class="fa-solid fa-circle-dot icon_gray icon_pt"></i>
																</c:when>
																<c:when test="${list.cSt eq 2}">
																	<i class="fa-solid fa-circle-dot icon_orange icon_pt"></i>
																</c:when>
																<c:when test="${list.cSt eq 3}">
																	<i class="fa-solid fa-circle-dot icon_yellow icon_pt"></i>
																</c:when>
																<c:when test="${list.cSt eq 4}">
																	<i class="fa-solid fa-circle-dot icon_green icon_pt"></i>
																</c:when>
																<c:when test="${list.cSt eq 5}">
																	<i class="fa-solid fa-circle-dot icon_red icon_pt"></i>
																</c:when>
																<c:when test="${list.cSt eq 6}">
																	<i class="fa-solid fa-circle-dot icon_black icon_pt"></i>
																</c:when>
															</c:choose>
														</div>
														<c:choose>
															<c:when test="${list.cSt eq 1}">
																<div class="icon_title">신청중</div>
															</c:when>
															<c:when test="${list.cSt eq 2}">
																<div class="icon_title">승인</div>
															</c:when>
															<c:when test="${list.cSt eq 3}">
																<div class="icon_title">확정</div>
															</c:when>
															<c:when test="${list.cSt eq 4}">
																<div class="icon_title">진행</div>
															</c:when>
															<c:when test="${list.cSt eq 5}">
																<div class="icon_title">종료</div>
															</c:when>
															<c:when test="${list.cSt eq 6}">
																<div class="icon_title">거절</div>
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


						<!-- b 유저 권한 푸터 페이지네이션 -->


						<c:choose>

							<c:when test="${cStnum ==2 }">

								<div class="footer" id="reserving_pg">
									<div class="footer_blank"></div>
									<div class="footer_page">
										<ul class="footer_pagination footer_modal">
											<c:if test="${campaignReservingCountVO.startPage != 1 }">
												<li class="arrow1"><a href="/mainBTable.do?cSt=2&nowPage=${campaignReservingCountVO.startPage - 1 }" class="alist_default_left2 start angle"> <i class="fa-sharp fa-solid fa-angles-left"></i></a></li>
											</c:if>
											<c:choose>
												<c:when test="${nowPagenum == campaignReservingCountVO.startPage}">
													<li><a href="/mainBTable.do?cSt=2&nowPage=${nowPagenum}" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
												</c:when>
												<c:when test="${nowPagenum != campaignReservingCountVO.startPage}">
													<li><a href="/mainBTable.do?cSt=2&nowPage=${nowPagenum-1}" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
												</c:when>
											</c:choose>
											<c:forEach begin="${campaignReservingCountVO.startPage }" end="${campaignReservingCountVO.endPage }" var="p">
												<c:choose>
													<c:when test="${p == campaignReservingCountVO.nowPage}">
														<li><a class="alist_default_p active">${p}</a></li>
													</c:when>
													<c:when test="${p != campaignReservingCountVO.nowPage}">
														<li><a href="/mainBTable.do?cSt=2&nowPage=${p}" class="alist_default_p">${p}</a></li>
													</c:when>
												</c:choose>
											</c:forEach>
											<c:choose>
												<c:when test="${nowPagenum == campaignReservingCountVO.lastPage}">
													<li class=""><a href="/mainBTable.do?cSt=2&nowPage=${nowPagenum}" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
												</c:when>
												<c:when test="${nowPagenum != campaignReservingCountVO.lastPage }">
													<li class=""><a href="/mainBTable.do?cSt=2&nowPage=${nowPagenum+1}" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
												</c:when>
											</c:choose>
											<c:if test="${campaignReservingCountVO.endPage != campaignReservingCountVO.lastPage}">
												<li class="arrow2"><a href="/mainBTable.do?cSt=2&nowPage=${campaignReservingCountVO.endPage+1 }" class="alist_default_right2 last angle2"><i class="fa-sharp fa-solid fa-angles-right"></i></a></li>
											</c:if>
										</ul>
									</div>
									<div class="footer_blank"></div>
								</div>
							</c:when>

							<c:when test="${cStnum ==4 }">

								<div class="footer" id="check_pg">
									<div class="footer_blank"></div>
									<div class="footer_page">
										<ul class="footer_pagination footer_modal">
											<c:if test="${campaignCheckCountVO.startPage != 1 }">
												<li class="arrow1"><a href="/mainBTable.do?cSt=4&nowPage=${campaignCheckCountVO.startPage - 1 }" class="alist_default_left2 start angle"> <i class="fa-sharp fa-solid fa-angles-left"></i></a></li>
											</c:if>
											<c:choose>
												<c:when test="${nowPagenum == campaignCheckCountVO.startPage}">
													<li><a href="/mainBTable.do?cSt=4&nowPage=${nowPagenum}" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
												</c:when>
												<c:when test="${nowPagenum != campaignCheckCountVO.startPage}">
													<li><a href="/mainBTable.do?cSt=4&nowPage=${nowPagenum-1}" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
												</c:when>
											</c:choose>
											<c:forEach begin="${campaignCheckCountVO.startPage }" end="${campaignCheckCountVO.endPage }" var="p">
												<c:choose>
													<c:when test="${p == campaignCheckCountVO.nowPage}">
														<li><a class="alist_default_p active">${p}</a></li>
													</c:when>
													<c:when test="${p != campaignCheckCountVO.nowPage}">
														<li><a href="/mainBTable.do?cSt=4&nowPage=${p}" class="alist_default_p">${p}</a></li>
													</c:when>
												</c:choose>
											</c:forEach>
											<c:choose>
												<c:when test="${nowPagenum == campaignCheckCountVO.lastPage}">
													<li class=""><a href="/mainBTable.do?cSt=4&nowPage=${nowPagenum}" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
												</c:when>
												<c:when test="${nowPagenum != campaignCheckCountVO.lastPage }">
													<li class=""><a href="/mainBTable.do?cSt=4&nowPage=${nowPagenum+1}" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
												</c:when>
											</c:choose>
											<c:if test="${campaignCheckCountVO.endPage != campaignCheckCountVO.lastPage}">
												<li class="arrow2"><a href="/mainBTable.do?cSt=4&nowPage=${campaignCheckCountVO.endPage+1 }" class="alist_default_right2 last angle2"><i class="fa-sharp fa-solid fa-angles-right"></i></a></li>
											</c:if>
										</ul>
									</div>
									<div class="footer_blank"></div>
								</div>
							</c:when>

							<c:when test="${cStnum ==6 }">

								<div class="footer" id="ing_B_pg">
									<div class="footer_blank"></div>
									<div class="footer_page">
										<ul class="footer_pagination footer_modal">
											<c:if test="${campaigningCountforBVO.startPage != 1 }">
												<li class="arrow1"><a href="/mainBTable.do?cSt=6&nowPage=${campaigningCountforBVO.startPage - 1 }" class="alist_default_left2 start angle"> <i class="fa-sharp fa-solid fa-angles-left"></i></a></li>
											</c:if>
											<c:choose>
												<c:when test="${nowPagenum == campaigningCountforBVO.startPage}">
													<li><a href="/mainBTable.do?cSt=6&nowPage=${nowPagenum}" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
												</c:when>
												<c:when test="${nowPagenum != campaigningCountforBVO.startPage}">
													<li><a href="/mainBTable.do?cSt=6&nowPage=${nowPagenum-1}" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
												</c:when>
											</c:choose>
											<c:forEach begin="${campaigningCountforBVO.startPage }" end="${campaigningCountforBVO.endPage }" var="p">
												<c:choose>
													<c:when test="${p == campaigningCountforBVO.nowPage}">
														<li><a class="alist_default_p active">${p}</a></li>
													</c:when>
													<c:when test="${p != campaigningCountforBVO.nowPage}">
														<li><a href="/mainBTable.do?cSt=6&nowPage=${p}" class="alist_default_p">${p}</a></li>
													</c:when>
												</c:choose>
											</c:forEach>
											<c:choose>
												<c:when test="${nowPagenum == campaigningCountforBVO.lastPage}">
													<li class=""><a href="/mainBTable.do?cSt=6&nowPage=${nowPagenum}" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
												</c:when>
												<c:when test="${nowPagenum != campaigningCountforBVO.lastPage }">
													<li class=""><a href="/mainBTable.do?cSt=6&nowPage=${nowPagenum+1}" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
												</c:when>
											</c:choose>
											<c:if test="${campaigningCountforBVO.endPage != campaigningCountforBVO.lastPage}">
												<li class="arrow2"><a href="/mainBTable.do?cSt=6&nowPage=${campaigningCountforBVO.endPage+1 }" class="alist_default_right2 last angle2"><i class="fa-sharp fa-solid fa-angles-right"></i></a></li>
											</c:if>
										</ul>
									</div>
									<div class="footer_blank"></div>
								</div>
							</c:when>

							<c:when test="${cStnum ==8 }">

								<div class="footer" id="end_B_pg">
									<div class="footer_blank"></div>
									<div class="footer_page">
										<ul class="footer_pagination footer_modal">
											<c:if test="${campaignendCountforBVO.startPage != 1 }">
												<li class="arrow1"><a href="/mainBTable.do?cSt=8&nowPage=${campaignendCountforBVO.startPage - 1 }" class="alist_default_left2 start angle"> <i class="fa-sharp fa-solid fa-angles-left"></i></a></li>
											</c:if>
											<c:choose>
												<c:when test="${nowPagenum == campaignendCountforBVO.startPage}">
													<li><a href="/mainBTable.do?cSt=8&nowPage=${nowPagenum}" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
												</c:when>
												<c:when test="${nowPagenum != campaignendCountforBVO.startPage}">
													<li><a href="/mainBTable.do?cSt=8&nowPage=${nowPagenum-1}" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
												</c:when>
											</c:choose>
											<c:forEach begin="${campaignendCountforBVO.startPage }" end="${campaignendCountforBVO.endPage }" var="p">
												<c:choose>
													<c:when test="${p == campaignendCountforBVO.nowPage}">
														<li><a class="alist_default_p active">${p}</a></li>
													</c:when>
													<c:when test="${p != campaignendCountforBVO.nowPage}">
														<li><a href="/mainBTable.do?cSt=8&nowPage=${p}" class="alist_default_p">${p}</a></li>
													</c:when>
												</c:choose>
											</c:forEach>
											<c:choose>
												<c:when test="${nowPagenum == campaignendCountforBVO.lastPage}">
													<li class=""><a href="/mainBTable.do?cSt=8&nowPage=${nowPagenum}" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
												</c:when>
												<c:when test="${nowPagenum != campaignendCountforBVO.lastPage }">
													<li class=""><a href="/mainBTable.do?cSt=8&nowPage=${nowPagenum+1}" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
												</c:when>
											</c:choose>
											<c:if test="${campaignendCountforBVO.endPage != campaignendCountforBVO.lastPage}">
												<li class="arrow2"><a href="/mainBTable.do?cSt=8&nowPage=${campaignendCountforBVO.endPage+1 }" class="alist_default_right2 last angle2"><i class="fa-sharp fa-solid fa-angles-right"></i></a></li>
											</c:if>
										</ul>
									</div>
									<div class="footer_blank"></div>
								</div>
							</c:when>

							<c:otherwise>
								<div class="footer" id="default_b_pg">
									<div class="footer_blank"></div>
									<div class="footer_page">
										<ul class="footer_pagination footer_modal">
											<c:if test="${campaigntotalCountVO.startPage != 1 }">
												<li class="arrow1"><a href="/mainBTable.do?cSt=0&nowPage=${campaigntotalCountVO.startPage - 1 }" class="alist_default_left2 start angle"> <i class="fa-sharp fa-solid fa-angles-left"></i></a></li>
											</c:if>
											<c:choose>
												<c:when test="${nowPagenum == campaigntotalCountVO.startPage}">
													<li><a href="/mainBTable.do?cSt=0&nowPage=${nowPagenum}" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
												</c:when>
												<c:when test="${nowPagenum != campaigntotalCountVO.startPage}">
													<li><a href="/mainBTable.do?cSt=0&nowPage=${nowPagenum-1}" class="arrow-left angle alist_default_left"> <i class="fa-solid fa-angle-left"></i></a></li>
												</c:when>
											</c:choose>
											<c:forEach begin="${campaigntotalCountVO.startPage }" end="${campaigntotalCountVO.endPage }" var="p">
												<c:choose>
													<c:when test="${p == campaigntotalCountVO.nowPage}">
														<li><a class="alist_default_p active">${p}</a></li>
													</c:when>
													<c:when test="${p != campaigntotalCountVO.nowPage}">
														<li><a href="/mainBTable.do?cSt=0&nowPage=${p}" class="alist_default_p">${p}</a></li>
													</c:when>
												</c:choose>
											</c:forEach>
											<c:choose>
												<c:when test="${nowPagenum == campaigntotalCountVO.lastPage}">
													<li class=""><a href="/mainBTable.do?cSt=0&nowPage=${nowPagenum}" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
												</c:when>
												<c:when test="${nowPagenum != campaigntotalCountVO.lastPage }">
													<li class=""><a href="/mainBTable.do?cSt=0&nowPage=${nowPagenum+1}" class="arrow-right alist_default_right angle2"><i class="fa-solid fa-angle-right"></i></a></li>
												</c:when>
											</c:choose>
											<c:if test="${campaigntotalCountVO.endPage != campaigntotalCountVO.lastPage}">
												<li class="arrow2"><a href="/mainBTable.do?cSt=0&nowPage=${campaigntotalCountVO.endPage+1 }" class="alist_default_right2 last angle2"><i class="fa-sharp fa-solid fa-angles-right"></i></a></li>
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