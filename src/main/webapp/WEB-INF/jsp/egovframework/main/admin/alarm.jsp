<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<link href="/css/egovframework/admin/app.css" rel="stylesheet"  type='text/css'>
	<link href="/css/egovframework/admin/styles.css" rel="stylesheet"  type='text/css'>
	
	<link rel="preconnect" href="https://fonts.gstatic.com">	
	<link rel="shortcut icon" href="img/icons/icon-48x48.png" />
	<link rel="canonical" href="https://demo-basic.adminkit.io/" />
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
	
	
</head>
<body>
	<input name="alarmNum" type="hidden" value="${alarmNum}">
	<input name="email" type="hidden" value="${email}">
	<input name="sender" type="hidden" value="${sender}">
	<div class="wrapper">
		<%@ include file="sidebar.jsp"%>
		<div class="main">
			<%@ include file="adminHeader.jsp"%>

			<main class="content">
			<div class="container-fluid p-0">

				<div class="mb-3">
					<h1 class="h3 d-inline align-middle">Alarm</h1>
					<a class="badge bg-dark text-white ms-2">알람 목록입니다</a>
				</div>
				<div class="row">
					<div class="col-md-8 col-xl-3" >
						<div class="card" style="height: 100%; height: 100%; margin-bottom: 0px !important;">
							<div class="card-header">
								<h5 class="card-title mb-0">Recent</h5>
							</div>
							<div class="recentBody">
							<c:forEach var="item" items="${recentList}" varStatus="status">
								<div id="userRecentMessage" class="d-flex align-items-start" onclick="location.href ='/admin/alarm.do?email=${item.email}&sender=${item.id}'" style="border: 1px solid #e2e2e2; padding:10px 5px 10px 5px; height: 150px;">
									<img src="/images/egovframework/main/profile.png" width="48" height="48" class="rounded-circle me-2" alt="Vanessa Tucker">
									<div class="flex-grow-1">

										<small class="float-end text-navy" style="font-size: 100%;">${item.writeDate}</small>
										<strong>${item.email} 
											<c:if test="${item.status eq '1'}">
												<button class="btn btn-warning">New!</button>
											</c:if>
										</strong><br />
										<strong class="text-muted">${item.uNm}</strong><br /><br />
										<small style="font-size: 100%;">제목: ${item.title}</small><br /><br />
										<small style="font-size: 100%;">내용: ${item.contents}</small>
									</div>
								</div>
							</c:forEach>
							</div>
						</div>
					</div>
					<div class="col-md-8 col-xl-9" >
						<div class="card" style="height: 100%;">
							<div class="card-header">

								<h5 class="card-title mb-0">Chat</h5>
							</div>
							<div class="card-body h-100"">
								<div id="scrollBox" >
								<!-- 알람 -->
								<c:forEach var="item" items="${alarm}" varStatus="status">
									<c:if test="${item.email eq 'admin'}"> <!-- 사용자 -> 관리자 메세지 -->
										<div id="chatData" class="align-items-start userMsg" data-no="${item.num}" inqure-no="${item.inqureId}">
											<img src="/images/egovframework/main/profile.png" width="36" height="36" class="rounded-circle me-2" alt="Vanessa Tucker">
											<span>${item.uId}</span>
											<div class="flex-grow-1">
												<div class="border text-sm text-muted p-2 mt-1 bollon">
													<strong>${item.title}</strong><br/><br/>
													${item.contents}
												</div>
												<small class="text-navy userMsgTime">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</small> 
												<c:if test="${item.status eq '1'}">
													<a id="answerBtn" href="#" class="btn btn-sm btn-danger mt-1" onclick="alarmAnswer(this);">
<!-- 														<i class="feather-sm" data-feather="corner-down-right"></i> -->
														답변
													</a>
												</c:if>
												<c:if test="${item.status eq '2' or item.status eq '4' or item.status eq '5'}">
													<a id="reAnswerBtn" href="#" class="btn btn-sm btn-secondary mt-1" onclick="alarmAnswer(this);">
<!-- 														<i class="feather-sm" data-feather="corner-down-right"></i> -->
														재답변
													</a>
												</c:if>
											</div>
										</div>
									</c:if>
									<c:if test="${item.email ne 'admin'}">
										<div id="chatData" class="d-flex align-items-start adminMsg" data-no="${item.num}">
											<div class="flex-grow-1">
												<small class="text-navy adminMsgTime"></small>
												<strong>${item.title}</strong>
												<br /> 
												<div class="border text-sm text-muted p-2 mt-1 bollonA">
													${item.contents}
												</div>
											</div>
										</div>
									</c:if>
								</c:forEach>
								</div>
								<hr />
								<strong>수신자: </strong><span id="alarm_email"></span>
								<input type="hidden" name="alarm_pk" value="">
								<br>
								<strong>제목: </strong><span id="alarm_title"></span>
								<div id="alarmAnswer" class="card-body">
									<textarea id="alarm_context" class="form-control" rows="2" placeholder="답변"></textarea>
									<div>
										<button id="alarmSubmitBtn" class="btn btn-warning" onclick="alarm_submit()">전송</button>
									</div>								
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</main>
			<%@ include file="adminFooter.jsp"%>

		</div>
	</div>

	<script src="/main/js/admin/app.js"></script>
	<script src="/main/js/admin/adminIndex.js"></script>
	<script src="/main/js/admin/alarm.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4cd6acb67135d6b60671b0b2bb4257cb&libraries=services"></script>


</body>
</html>