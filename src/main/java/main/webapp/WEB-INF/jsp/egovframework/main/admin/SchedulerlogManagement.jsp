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
<link href="/css/egovframework/admin/schedulerLog.css" rel="stylesheet" type='text/css'>


<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="shortcut icon" href="img/icons/icon-48x48.png" />
<link rel="canonical" href="https://demo-basic.adminkit.io/" />
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">


</head>
<body>



	<div class="wrapper">
		<%@ include file="sidebar.jsp"%>
		<div class="main">
			<%@ include file="adminHeader.jsp"%>

			<main class="content">
			<div class="container-fluid p-0">

				<h1 class="h3 mb-3">
					<strong>SchedulerLog</strong> management
				</h1>

				<!-- 캠페인 리스트 부분 -->
				<div>
					<div class="log_outerbox">
						<div class="card flex-fill">
							<div class="card-header">

								<h5 class="card-title mb-0">SchedulerLog List</h5>
							</div>
							
							<div class="logbox">

							<c:forEach items="${schedulerLogList}" var="list">
								<c:choose>
									<c:when test="${list.updateFail eq 0}">
										<div class="loglist">업데이트 일자 :${list.date} 성공 : ${list.updateSuccess} 실패 : ${list.updateFail} 정상 처리되었습니다.</div>
									</c:when>
									<c:otherwise>
										<div class="loglist">업데이트 일자 :${list.date} 성공 : ${list.updateSuccess} 실패 : ${list.updateFail} 오류 발생.</div>
									</c:otherwise>
								</c:choose>

							</c:forEach>
							
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
	<script src="/main/js/admin/schedulerLogManagement.js"></script>

</body>
</html>