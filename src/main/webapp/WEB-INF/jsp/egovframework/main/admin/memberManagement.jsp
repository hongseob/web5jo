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

					<h1 class="h3 mb-3"><strong>Member</strong> management</h1>
					<!-- 캠페인 리스트 부분 -->
					<div class="row">
						<div class="col-12 col-lg-8 col-xxl-9 d-flex">
							<div class="card flex-fill">
								<div class="card-header">

									<h5 class="card-title mb-0">Member List</h5>
								</div>
								<table class="table table-hover my-0">
									<thead>
										<tr>
											<th>User Name</th>
											<th class="d-none d-xl-table-cell">HandPhone</th>
											<th class="d-none d-xl-table-cell">Company</th>
											<th>Status</th>
											<th class="d-none d-md-table-cell">Assignee</th>
										</tr>
									</thead>
	<%-- 								<tbody>
									<!-- bg-warning 노 bg-success 초 bg-danger 빨 -->
										<c:forEach var="item" items="${list}" varStatus="status">
											<tr onclick="selectMemberInfo(${item.id})">
												<td>${item.uNm}</td>
												<td class="d-none d-xl-table-cell">${item.uHp}</td>
												<td class="d-none d-xl-table-cell">${item.cNm}</td>
												<td><span class="badge bg-warning">application</span></td>
												<td class="d-none d-md-table-cell">${item.uId}</td>
											</tr>
										</c:forEach>
									</tbody> --%>
									<tbody class="logListTable" >
                     
                  					</tbody>
								</table>
								<div class="pagination" style="margin-bottom:30px"></div>
							</div>
						</div>

						<div class="col-12 col-lg-4 col-xxl-3 d-flex">
							<div class="card flex-fill w-100">
								<div class="card-header">

									<h5 class="card-title mb-0">사용자 인증</h5>
								</div>
								<div class="card-body d-flex w-100">
									<div class="align-self-center chart chart-lg" style="height:100%; margin:0px">
										<div class="card mb-3" style="height:90%">
											<div class="card-header">
												<h5 class="card-title mb-0">사용자 프로필</h5>
												<input id="mId" type="hidden" name="mId"/>
											</div>
											<div class="card-body text-center">
												<div id="userName"></div>
											</div>
											<hr class="my-0" />
											<div class="card-body">
												<h5 class="h6 card-title">캠페인 카테고리</h5>
												<div id="campaignCategory">
													
												</div>
											</div>
											<hr class="my-0" />
											<div class="card-body">
												<h5 class="h6 card-title">주소</h5>
												<ul class="list-unstyled mb-0">

													<li class="mb-1"><span data-feather="map-pin"
														class="feather-sm me-1"></span> From <a id="location" href="#"></a></li>
												</ul>
											</div>
											<hr class="my-0" />
											<div class="card-body">
												<h5 class="h6 card-title">추가 정보</h5>
												<div id="campaignInfo"></div>
											</div>
											<hr class="my-0" />
											<div class="card-body">
												<h5 class="h6 card-title">서류</h5>
												<ul class="list-unstyled mb-0">
													<div id="campaignFile">
													
													</div>

												</ul>
											</div>
										</div>
										<button class="btn btn-info" onclick="approveMember()">인증된 사용자 변경</button>
										<button class="btn btn-danger" onclick="refuseMember()">거절</button>
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
	<script src="/main/js/admin/userMenu1.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4cd6acb67135d6b60671b0b2bb4257cb&libraries=services"></script>


</body>
</html>