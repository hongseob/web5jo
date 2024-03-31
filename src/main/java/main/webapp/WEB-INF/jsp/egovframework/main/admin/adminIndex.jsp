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

					<h1 class="h3 mb-3"><strong>Campaign</strong> management</h1>
					<!-- 캠페인 리스트 부분 -->
					<div class="row">
						<div class="col-12 col-lg-8 col-xxl-9 d-flex">
							<div class="card flex-fill">
								<div class="card-header">

									<h5 class="card-title mb-0">Campaign List</h5>
								</div>
								
								<!-- 검색 영역 START-->
								<div id="search_campaign_index" style="padding:3px">
									<select id="search_campaign_index_select" class="form-select mb-3" style="width:13%; height:100%">
	          							<option selected>캠페인 이름</option>
	          							<option>등록자</option>
	         							<option>날짜</option>
	        						</select>
									<input type="text" id="search_campaign_index_text" class="form-control" placeholder="캠페인 이름을 입력하세요." style="width:80%; height:100%">
									<button id="search_campaign_index_button" class="btn btn-primary" style="width:7%" onclick="logList_ajax(1)">검색</button>
								</div>
								<!-- 검색 영역 END -->
								
								<table class="table table-hover my-0">
									<thead>
										<tr>
											<th>Campaign Name</th>
											<th class="d-none d-xl-table-cell">Start Date</th>
											<th class="d-none d-xl-table-cell">End Date</th>
											<th>Status</th>
											<th class="d-none d-md-table-cell">Assignee</th>
										</tr>
									</thead>
<%-- 									<tbody>
									<!-- bg-warning 노 bg-success 초 bg-danger 빨 -->
										<c:forEach var="item" items="${list}" varStatus="status">
											<tr onclick="selectCampaginInfo(${item.cId})">
												<td>${item.cNm}</td>
												<td class="d-none d-xl-table-cell">${item.stDate}</td>
												<td class="d-none d-xl-table-cell">${item.edDate}</td>
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

									<h5 class="card-title mb-0">캠페인 승인</h5>
								</div>
								<div class="card-body d-flex w-100">
									<div class="align-self-center chart chart-lg" style="height:100%; margin:0px">
										<div class="card mb-3" style="height:90%">
											<div class="card-header">
												<h5 class="card-title mb-0">캠페인 대표 이미지</h5>
												<input id="cId" type="hidden" name="cId"/>
											</div>
											<div class="card-body text-center">
												<img id="campaignImg" 
													class="img-fluid rounded-circle mb-2" width="128"
													height="128" />

											</div>
											<hr class="my-0" />
											<div class="card-body">
												<h5 class="h6 card-title">카테고리</h5>
												<div id="campaignCategory">
													
												</div>
												
											</div>
											<hr class="my-0" />
											<div class="card-body">
												<h5 class="h6 card-title">캠페인 위치</h5>
												<ul class="list-unstyled mb-0">

													<li class="mb-1"><span data-feather="map-pin"
														class="feather-sm me-1"></span> From <a id="location" href="#"></a></li>
												</ul>
											</div>
											<hr class="my-0" />
											<div class="card-body">
												<h5 class="h6 card-title">캠페인 정보</h5>
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
										<button class="btn btn-info" onclick="approveCampaign()">승인</button>
										<button class="btn btn-danger" onclick="refuseCampaign()">거절</button>
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
	<script src="/main/js/admin/campaignMenu1.js"></script>
	<script src="/main/js/admin/search.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4cd6acb67135d6b60671b0b2bb4257cb&libraries=services"></script>


</body>
</html>