<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<!-- CSS -->
<!-- <link rel="stylesheet" href="/css/egovframework/main/body.css">
<link rel="stylesheet" href="/css/egovframework/main/nav.css">
<link rel="stylesheet" href="/css/egovframework/main/sidebar.css">
<link rel="stylesheet" href="/css/egovframework/main/navevent.css">
<link rel="stylesheet" href="/css/egovframework/main/footernav.css">
<link rel="stylesheet" href="/css/egovframework/main/button.css">
<link rel="stylesheet" href="/css/egovframework/main/main.css"> -->

<link rel="stylesheet" href="/index/lib/bootstrap/css/bootstrap.css"/>
<link rel="stylesheet" href="/css/egovframework/main/navInfoModify.css" type='text/css'>
<!-- index.css는 문의하기 관련된 코드 분리하는대로 없앨 예정 -->
<link rel="stylesheet" href="/css/egovframework/main/campaigncard.css" type='text/css'>
<link rel="stylesheet" href="/css/egovframework/index/index.css"/>
<link rel="stylesheet" href="/css/egovframework/main/main.css" type='text/css'>

<link rel="stylesheet" href="/css/egovframework/main/credit/credit.css">
<link rel="stylesheet" href="/css/egovframework/main/credit/button.css">

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>

<body style="font-family: 'Noto Sans KR', sans-serif;">

	<%@ include file="../header.jsp"%>
	<%@ include file="../leftMenu.jsp"%>

	<div class="mainBody">
		<div class="container-fluid p-5 bodypg">
			<div class="contentpg">
				<div>
					<div class="titleMenu">
						<ul>
							<li>Proker Credit</li>
							<li>충전 금액</li>
						</ul>
					</div>
					<div class="menuContent">
						<ul>
							<li class="ContentHeader">
								<div>보유 크레딧</div>
									<span>
										<i class="bi bi-coin"></i>
									</span>
								<span>
									<em id="balance" class="creditValue">
										<fmt:formatNumber value="${Balance}" type="number"/>
									</em> 
									<em> P </em>
								</span>
							</li>
							<li>
								<div>얼마를 충전할까요?</div>
								<form id="form">
									<div class="inputLine">
										<div class="lineInner">
											<span class="line">
											<input id="inputValue" type="text"
												placeholder="금액을 입력해주세요." class="inputValue" value=""
												oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');">
												<button id="clearButton" class="clearButton" type="reset">
													X</button>
											</span>
											<button id="checkButton" class="checkButton" type="submit">
												확인</button>
										</div>
									</div>
									<div class="value_cellBox">
										<div class="cellBox">
											<button type="button" value="10000" class="button_price"
												onclick="calc(this)">
												+1 <span>만원</span>
											</button>
										</div>
										<div class="cellBox">
											<button type="button" value="30000" class="button_price"
												onclick="calc(this)">
												+3 <span>만원</span>
											</button>
										</div>
										<div class="cellBox">
											<button type="button" value="50000" class="button_price"
												onclick="calc(this)">
												+5 <span>만원</span>
											</button>
										</div>
									</div>
								</form>
							</li>
						</ul>
					</div>
				</div>
				<div class="paymentBox">
					<div class="paymentTitle">
						<div class="h4">
							크레딧 충전내역
							<span class="historyButtonBox">
								<a id="historyButton" class="btn btn-outline-secondary btn-sm mb-1" onclick="buttonCheck()">충전내역 불러오기</a>
							</span>
						</div>
						<div class="row paymentOption">
							<div class="col-auto">
								<div class="row align-times-sm-center">
									<div class="col-sm-auto">
										<div class="row align-items-center gx-0">
											<div class="col" style = "padding-right: 5px">
												<span class="text-secondary me-2">Status</span>
											</div>
											<div class="col-auto" style="padding-left: 0; padding-right: 30px">
												<div class="selectBox1">
													<select id="select_sort" onchange="selectTable();">
														<option value="null">All</option>
														<option value="충전">충전</option>
														<option value="사용">사용</option>
														<option value="사용 취소">사용취소</option>
													</select>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-auto">
										<div class="row align-itmes-center gx-0">
											<div class="col" style = "padding-right: 5px">
												<span class="text-secondary me-2">Date</span>
											</div>
											<div class="col-auto" style="padding-left: 0;">
												<div class="selectDate">
													<select id="select_date" onchange="selectTable();">
														<option value="null">All</option>
														<option value="day">하루 전</option>
														<option value="week">1주일 전</option>
														<option value="month">한달 전</option>
													</select>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-auto"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="table_container">
						<table id="useTable"
							class="useTable table table-striped table-hover">
							<thead>
								<tr>
									<td>결제 번호</td>
									<td>충전/사용/취소</td>
									<td>날짜</td>
									<td>주문 번호</td>
									<td>크레딧 금액</td>
								</tr>
							</thead>
							<tbody id="useTableBody" class="useTableBody">
								<!-- <tr>
									<td>123</td>
									<td>충전</td>
									<td>2022-10-06</td>
									<td>충전완료</td>
									<td>+20,000</td>
								</tr>
								<tr>
									<td>123</td>
									<td>사용</td>
									<td>2022-10-02</td>
									<td>크레딧사용</td>
									<td>-20,000</td>
								</tr>
								<tr>
									<td>123</td>
									<td>사용</td>
									<td>2022-10-07</td>
									<td>크레딧사용</td>
									<td>-20,000</td>
								</tr>
								<tr>
									<td>123</td>
									<td>사용</td>
									<td>2022-09-28</td>
									<td>크레딧사용</td>
									<td>-20,000</td>
								</tr>
								<tr>
									<td>123</td>
									<td>충전</td>
									<td>2022-09-01</td>
									<td>충전완료</td>
									<td>+20,000</td>
								</tr>
								
								<tr>
									<td>123</td>
									<td>충전</td>
									<td>2022-09-20</td>
									<td>충전완료</td>
									<td>+20,000</td>
								</tr>
								<tr>
									<td>123</td>
									<td>사용</td>
									<td>2022-10-02</td>
									<td>크레딧사용</td>
									<td>-20,000</td>
								</tr>
								<tr>
									<td>123</td>
									<td>사용</td>
									<td>2022-09-28</td>
									<td>크레딧사용</td>
									<td>-20,000</td>
								</tr>
								<tr>
									<td>123</td>
									<td>충전</td>
									<td>2022-10-07</td>
									<td>충전완료</td>
									<td>+20,000</td>
								</tr>
								<tr>
									<td>123</td>
									<td>충전</td>
									<td>2022-10-01</td>
									<td>충전완료</td>
									<td>+20,000</td>
								</tr>
								<tr>
									<td>123</td>
									<td>충전</td>
									<td>2022-09-28</td>
									<td>충전완료</td>
									<td>+20,000</td>
								</tr> -->
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- 충전내역 -->
			<div class="subpg">
				<div class="welcomeSubpg">
					<div class="subpgImage"></div>
					<div class="h2">
						Proker 크레딧 <br> 충전하기
					</div>
				</div>
				<div class="subpgMenu">
					<span class="viewName">user</span>
					<span id="userBox" class="viewValue">
						<span class="userName">${userName}<br>${userId}</span>
					</span>
				</div>
				<div class="subpgMenu">
					<span class="viewName">현재보유</span> <span class="viewValue">
						<span id="initValue" class="h3 creditValue">
							<fmt:formatNumber value="${Balance}" type="number"/>
						</span> 
						<span class="h4">P</span>
					</span>
				</div>
				<div class="subpgMenu">
					<span class="viewName">충전 예정</span> <span class="viewValue">
						<span class="h3" style="color: crimson;">+</span> <span
						id="addValue" class="h3 creditValue" style="color: crimson;">0</span>
						<span class="h4" style="color: crimson;">P</span>
					</span>
				</div>
				<div class="subpgMenu">
					<span class="viewName">충전완료 후</span> <span class="viewValue">
						<span id="resultValue" class="h3 creditValue">0</span> <span
						class="h4">P</span>
					</span>
				</div>
				<div class="chargeButtonBox">
					<button type="button" class="chargeButton" onclick="requestPay()">충전하기</button>
				</div>

			</div>
		</div>
	</div>
	
	<script language=JavaScript>
		let userInfo = new Array();
		userInfo.push({
			id: "${userId}",
			name: "${userName}",
			hp: "${userPhoneNumber}",
			auth: "${auth}",
		});
	</script>
	
	<!-- nav 회원정보 수정 관련 js -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4cd6acb67135d6b60671b0b2bb4257cb&libraries=services"></script>
	<script src="/index/lib/crypto/core.min.js"></script>
	<script src="/index/lib/crypto/sha256.min.js"></script>
	<script src="/main/js/main/navInfoModify.js"></script>
	<script src="/index/lib/jquery/jquery.min.js"></script>
	<script src="/index/lib/jquery/jquery.validate.min.js"></script>
	<!-- js -->
	<script src="/main/js/main/main.js"></script>
	<script src="/main/js/main/jquery.tablesorter.min.js"></script>
	<!-- <script src="/main/js/main/nav.js"></script>
	<script src="/main/js/main/info/jquery.js"></script> -->
	<script src="/main/js/main/credit/credit.js"></script>
	<script src="/main/js/main/credit/creditPayment.js"></script>
	
	<!-- 아임포트 자바스크립트 SDK cdn -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.4.js"></script>
	
</body>


</html>