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

	<div class="wrapper">
		<%@ include file="sidebar.jsp"%>
		<div class="main">
			<%@ include file="adminHeader.jsp"%>

			<main class="content">
				<div class="container-fluid p-0">

					<h1 class="h3 mb-3"><strong>Log</strong> management</h1>
					<!-- 캠페인 리스트 부분 -->
					<div class="row">
						<div class="col-12 col-lg-8 col-xxl-9 d-flex">
							<div class="card flex-fill">
								<div class="card-header">

									<h5 class="card-title mb-0">Log List</h5>
								</div>
								<table class="table table-hover my-0">
									<thead>
										<tr>
											<th>User Name</th>
											<th class="d-none d-xl-table-cell">Url</th>
											<th class="d-none d-xl-table-cell">Date</th>
										</tr>
									</thead>
									
									<!-- bg-warning 노 bg-success 초 bg-danger 빨 -->
<%-- 										<c:forEach var="item" items="${list}" varStatus="status">
											<tr onclick="selectMemberInfo(${item.id})">
												<td>${item.uNm}</td>
												<td class="d-none d-xl-table-cell">${item.uHp}</td>
												<td class="d-none d-xl-table-cell">${item.cNm}</td>
												<td><span class="badge bg-warning">application</span></td>
												<td class="d-none d-md-table-cell">${item.uId}</td>
											</tr>
										</c:forEach> --%>
									<tbody class="logListTable" >
                     
                 					</tbody>
										
								
								</table>
								<div class="pagination" style="margin-bottom:30px"></div>
							</div>
						</div>

						
						<div>
<%-- 							<div class="footer">
								<div class="footer_page" style="width: 100% !important;'">
									<ul class="pagination footer_pagination footer_modal"
										id="pagination" style="justify-content: center; list-style:none;">
										<li><a href="#" class="start" onclick="startPage()" style="float: left;">
												<<&nbsp </a></li>
										<li><a href="#" class="arrow left" onclick="prevPage()" style="float: left;"><
										</a></li>
										<c:forEach var="n" begin="0" end="${page.cntPerPage -1}">
											<li><a class="num" id="page${page.startPage +n}" href="/admin/adminIndex.do?pageNum=${n +1}" 
												 value="${page.endPage +n}" style="float: left;">${page.startPage +n}&nbsp</a></li>
										</c:forEach>
										<li><a href="#" class="arrow right" onclick="nextPage()" style="float: left;">
												>&nbsp </a></li>
										<li><a href="#" class="last" onclick="endPage()" style="float: left;">>></a></li>
									</ul>
								</div>
							</div> --%>
<%-- 							<input type="hidden" id="endPage" value="${page.lastPage}" /> --%>
						</div>
						
					</div>




				</div>
			</main>

			<%@ include file="adminFooter.jsp"%>
		</div>
	</div>

	<script src="/main/js/admin/app.js"></script>
	<script src="/main/js/admin/adminIndex.js"></script>
	<script src="/main/js/admin/logManagement.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4cd6acb67135d6b60671b0b2bb4257cb&libraries=services"></script>

</body>
</html>