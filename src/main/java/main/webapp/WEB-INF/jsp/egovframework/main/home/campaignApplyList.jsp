<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- nav 회원정보 수정 관련 css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous"/>
<link rel="stylesheet" href="/index/lib/bootstrap/css/bootstrap.css"/>
<link rel="stylesheet" href="/css/egovframework/main/navInfoModify.css" type='text/css'>
<!-- index.css는 문의하기 관련된 코드 분리하는대로 없앨 예정 -->
<link rel="stylesheet" href="/css/egovframework/index/index.css"/>
<link rel="stylesheet" href="/css/egovframework/main/main.css" type='text/css'>

<link rel="stylesheet" href="/css/egovframework/main/applyList/campaignApplyList.css" type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<title>Proker</title>

</head>
<body>
	<%@ include file="../header.jsp"%>
	<%@ include file="../leftMenu.jsp"%>
	<div class="margin_header"></div>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<!-- 캠페인 신청 명단 부분 -->
	<!-- <div style="width: 1850px;"> -->
	<div style="width: max-content; height: 100vh; margin: 0 auto;">
		<div class="campaign_apply_list_wrapper">
				<input id="campaignId" type="hidden" value="${campaignInfo[0].cId}">
				<input id="campaignEstimate" type="hidden" value="${campaignInfo[0].estimate}">
				<input id="approvedStudentCount" type="hidden" value="${approvedStudentCount }">
				<input id="campaignMemberCount" type="hidden" value="${campaignInfo[0].cMbr}">
			<button class="list_button">
				<span id="list_name">신청 명단</span><i style="float: right; margin-right: 4px; margin-top: 10px;" class="fa-solid fa-lg fa-caret-down ml-2"></i>
			</button>
			<div class="drop_nav_list non_active" id="drop_nav_list">
				<nav>
					<ul class="nav_list">
						<li id="nav_applied_list" class="nav_clicked_list">신청 명단</li>
						<li id="nav_approved_list" class="">승인 명단</li>
						<li id="nav_rejected_list" class="">거절 명단</li>
						<li id="nav_confirmed_list" class="">예약확정 명단</li>
					</ul>
				</nav>
			</div>
			<div class="campaign_status_box">
				<div class="campaign_status_icon" style="float: left; margin-left: 22px">
				</div>
				<div style="display: inline-block; float: left">
					<p style="font-size: 19px; margin-top: -6px;margin-left: 19px; margin-bottom: -5px!important;">${campaignInfo[0].cNm}</p>
					
					<c:if test="${campaignInfo[0].cSt eq '0' }">
				   		<i class="fa-solid fa-circle-dot icon_gray icon_pt" style="margin-left: 20px;"></i><span style="font-size: 17px; margin-left: 6px!important; color: black">반려중</span>
				   	</c:if>
				   	<c:if test="${campaignInfo[0].cSt eq '1' }">
				   		<i class="fa-solid fa-circle-dot icon_orange icon_pt" style="margin-left: 20px;"></i><span style="font-size: 17px; margin-left: 6px!important; color: black">신청중</span>
				   	</c:if>
					<c:if test="${campaignInfo[0].cSt eq '2' }">
				   		<i class="fa-solid fa-circle-dot icon_yellow icon_pt" style="margin-left: 20px;"></i><span style="font-size: 17px; margin-left: 6px!important; color: black">모집 중</span>
				   	</c:if>
				   	<c:if test="${campaignInfo[0].cSt eq '4' }">
				   		<i class="fa-solid fa-circle-dot icon_black icon_pt" style="margin-left: 20px;"></i><span style="font-size: 17px; margin-left: 6px!important;  color: black">모집 완료</span>
				   	</c:if>
				   	<c:if test="${campaignInfo[0].cSt eq '3' }">
				   		<i class="fa-solid fa-circle-dot icon_green icon_pt" style="margin-left: 20px;"></i><span style="font-size: 17px; margin-left: 6px!important;  color: black">진행중</span>
				   	</c:if>
				   	<c:if test="${campaignInfo[0].cSt eq '5' }">
				   		<i class="fa-solid fa-circle-dot icon_red icon_pt" style="margin-left: 20px;"></i><span style="font-size: 17px; margin-left: 6px!important;  color: black">종료</span>
				   	</c:if>
					<span class="mr-3" style="font-size: 17px;  color: #5865f2; margin-left: 3px;">정원 ${campaignInfo[0].cMbr}명</span>
				</div>
			</div>	
			
			<div class="applied_list_wrapper" id="applied_list_wrapper">
				<!-- <div class="campaign_applied_list_text">
			   		<p class="ml-2">캠페인 신청 명단</p>
			   	</div> -->
			   	<div class="campaign_list_table_box">
					<table>
						<thead>
							<tr class="table_head">
								<th style="width: 119px"></th>
								<th style="width: 224px">신청날짜</th>
								<th style="width: 267px">아이디</th>
								<th style="width: 118px">이름</th>
								<th style="width: 168px">전화번호</th>
								<th style="width: 266px">주소</th>
								<th style="width: 150px">수정</th>
								<th style="width: 84px"></th>
								<th class="hiddenId"></th>
							</tr>
						</thead>
						<tbody>
							<c:set var="count" value="0"/>
							<c:forEach var="item" items="${list}" varStatus="status">
								<c:if test="${item.status eq '1' }">
									<tr>
										<td><div class="status_text">신청</div></td>
										<td style="text-align: center"><fmt:formatDate value="${item.applyDate }" pattern="yyyy-MM-dd HH:mm"/></td>
										<td>${item.uId}</td>
										<td style="text-align: center">${item.uNm}</td>
										<td style="text-align: center">${item.uHp}</td>
										<td>${item.uAddr}</td>
										<td style="align-items: center">	
											<select id="applyStatus${status.count}" name="applyStatus${status.count}" class="form-select" style="width: 120px!important;">
												<option value="0">선택</option>
												<option value="2">승인</option>
												<option value="6">거절</option>
											</select>
										</td>
										<td>
											<button type="button" class="btn btn-primary" onClick="changeAppliedUserStatus(${status.count})">적용</button>
										</td>
										<td class="hiddenId">
											<input type="hidden" id="userId${status.count}" value="${item.id}">
										</td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="approved_list_wrapper" id="approved_list_wrapper">
			   	<div class="campaign_list_table_box">
					<table>
						<thead>
							<tr class="table_head">
								<th style="width: 119px"></th>
								<th style="width: 267px">아이디</th>
								<th style="width: 118px">이름</th>
								<th style="width: 168px">전화번호</th>
								<th style="width: 266px">주소</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${list}" varStatus="status">
								<c:if test="${item.status eq '2' }">
									<tr>
										<td><div class="status_text">승인</div></td>
										<td >${item.uId}</td>
										<td style="text-align: center">${item.uNm}</td>
										<td style="text-align: center">${item.uHp}</td>
										<td>${item.uAddr}</td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="rejected_list_wrapper" id="rejected_list_wrapper">
			   	<div class="campaign_list_table_box">
					<table>
						<thead>
							<tr class="table_head">
								<th style="width: 119px"></th>
								<th style="width: 267px">아이디</th>
								<th style="width: 118px">이름</th>
								<th style="width: 168px">전화번호</th>
								<th style="width: 266px">주소</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${list}" varStatus="status">
								<c:if test="${item.status eq '6' }">
									<tr>
										<td><div class="status_text">거절</div></td>
										<td>${item.uId}</td>
										<td style="text-align: center">${item.uNm}</td>
										<td style="text-align: center">${item.uHp}</td>
										<td>${item.uAddr}</td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="confirmed_list_wrapper" id="confirmed_list_wrapper">
			   	<div class="campaign_list_table_box">
					<table>
						<thead>
							<tr class="table_head">
								<th style="width: 119px"></th>
								<th style="width: 267px">아이디</th>
								<th style="width: 118px">이름</th>
								<th style="width: 168px">전화번호</th>
								<th style="width: 266px">주소</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${list}" varStatus="status">
								<c:if test="${item.status eq '3' }">
									<tr>
										<td><div class="status_text">예약확정</div></td>
										<td>${item.uId}</td>
										<td style="text-align: center">${item.uNm}</td>
										<td style="text-align: center">${item.uHp}</td>
										<td>${item.uAddr}</td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- <button type="button" class="btn btn-warning btn-lg mx-auto" onclick="confirmCampaign()" style="display: block; margin-top: 40px;">캠페인 강제 진행</button> -->
		<c:if test="${campaignInfo[0].cSt eq '2' }">
			<c:if test="${campaignInfo[0].cMbr eq approvedStudentCount }">
				<button type="button" class="mx-auto" id="confirm_campaign" onclick="confirmCampaign(1)">인원 모집 마감</button>
			</c:if>
			<c:if test="${campaignInfo[0].cMbr ne approvedStudentCount}">
				<button type="button" class="mx-auto" id="confirm_campaign" onclick="confirmCampaign(2)">인원 모집 조기 마감</button>
			</c:if>
		</c:if>
	</div>
			
<!-- nav 회원정보 수정 관련 js -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4cd6acb67135d6b60671b0b2bb4257cb&libraries=services"></script>
<script src="/index/lib/crypto/core.min.js"></script>
<script src="/index/lib/crypto/sha256.min.js"></script>
<script src="/main/js/main/navInfoModify.js"></script>
<script src="/index/lib/jquery/jquery.min.js"></script>
<script src="/index/lib/jquery/jquery.validate.min.js"></script>
<script src="/main/js/main/main.js"></script>

<script src="/main/js/main/applyList/campaignApplyList.js"></script>
</body>
</html>