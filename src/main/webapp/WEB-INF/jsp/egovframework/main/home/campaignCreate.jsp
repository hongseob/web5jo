<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">
<head>
<%-- <meta name="csrf-token" content="${CSRF_TOKEN}"> --%>

<%--폰트 --%>


<!-- nav 회원정보 수정 관련 css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous"/>
<link rel="stylesheet" href="/index/lib/bootstrap/css/bootstrap.css"/>
<link rel="stylesheet" href="/css/egovframework/main/navInfoModify.css" type='text/css'>
<!-- index.css는 문의하기 관련된 코드 분리하는대로 없앨 예정 -->
<link rel="stylesheet" href="/css/egovframework/index/index.css"/>

<link rel="stylesheet" href="/css/egovframework/main/main.css">

<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />

<!-- Demo styles -->
<link rel="stylesheet" href="/css/egovframework/main/create/campaignCreate.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="/css/egovframework/lib/jquery-ui.css">
</head>

<body id="cpnBody">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<%@ include file="../header.jsp"%>
	<%@ include file="../leftMenu.jsp"%>
	
	<div class="contain">
		<!-- 캠페인생성 페이지 -->
		<!-- Swiper -->
		<div class="swiper mySwiper">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<div class="page1">
						<div class="page1_sub">
							<div class="camFrame">
								<h1 class="cam1">캠페인 카테고리</h1>
								<div class="bttn">
									<div id="bttn_inner" class="bttn_inner">
										<c:forEach var="item" items="${memberCategory}" varStatus="status" begin="0"  step="1">
										<button id="cam1_button${status.index+1}" class="cam1_button${status.index+1} category_btn"
											onclick="campainCreateCategory('${status.index+1}')" value="${item.category}">
											<i class="fa-solid fa-plus"></i>${item.category}
										</button>
										
										</c:forEach>
									</div>
									<div class="campainCreateCategory_alert"
										id="campainCreateCategory_alert">등록할 캠페인에 대한 카테고리를
										설정합니다.
									</div>
								</div>
								<div class="cam1_2">*원하시는 다른 카테고리가 있나요?</div>
								<div class="cam1_bottom">

									<div class="outBox">
										<div class="inputBox">
											<input type="text" id="campainCreateName" class="textbox"
												name=""> <label for="sampleId">카테고리 이름을
												입력하세요</label>
										</div>
										<div id="campainCreateName_alert"></div>
									</div>
									<button class="cam1_createbtn btn btn-dark"
										onclick="campainCreateName()">생성</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="page2">
						<div class="page2_sub">
							<h1 class="cam2">캠페인 이름</h1>
							<div class="cam2_bottom">
								<div class="outBox1">
									<div class="inputBox">
										<input type="text" id="campainSetName" id="campainSetName"
											class="textbox" name=""> <label for="sampleId">캠페인
											이름을 입력하세요</label>
										<button class="cam3_namebtn btn btn-dark"
											onclick="campainSetName()">확인</button>
									</div>
									<div id="campainSetName_alert" class="campainSetName_alert">등록할
										캠페인에 대한 이름을 설정합니다.</div>
								</div>
							</div>

							<h1 class="cam3">캠페인 대표 이미지</h1>
							<div class="cam3_bottom">
								<div class="cam3_1">등록할 캠페인에 대한 대표 이미지를 설정합니다.</div>
								<div class="cam3_imgbox">
									<img class="pre_pic" id="pre_pic"></img>
									<i class="fa-solid fa-cloud-arrow-up fa-5x"></i>
									<form class="form0" action="/main/create/fileUpload.do?_csrf=${_csrf.token }" method="POST" encType="multipart/form-data">
										<input type="file" class="upload_btn" accept='image/jpg,image/png' onchange="readURL(this);" name="profile_img_upload">
										<input type="hidden" name="form0" value="form0">
									</form>
									
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="page3">
						<div class="page3_sub">
							<h1 class="cam4">캠페인 참여 가능 인원</h1>
							<div class="cam4_bottom">
								<div class="cam4_1">등록할 캠페인에 대한 참여 가능 인원을 설정합니다.</div>
								<div class="campain_join">
									<input type="text" placeholder="0" id="campain_personnel"
										class="textboxSm">명
									<div id="campain_personnel_alert"></div>
								</div>
							</div>
							<h1 class="cam5">캠페인 참여 방식</h1>
							<div class="cam5_bottom">
								<div class="cam5_1">등록할 캠페인에 대한 참여 방식을 설정합니다.</div>
								<div class="campain_inter">
									<input type="radio" name="inter" value="대면" style="width:15px;height:15px;border:1px;accent-color:black;">&nbsp; 대면
								</div>
								<div class="campain_inter">
									<input type="radio" name="inter" value="비대면" style="width:15px;height:15px;border:1px;accent-color:black;">&nbsp; 비대면
								</div>
								<div id="campain_inter_alert"></div>
							</div>
							<h1 class="cam8">캠페인 견적 금액</h1>
							<div class="cam8_bottom">
								<div class="cam8_1">등록할 캠페인에 대한 견적 금액을 설정합니다.</div>
						<!-- 		<div class="campain_pay1">
									<input type="radio" name="cam_pay" value="시급" style="width:15px;height:15px;border:1px;accent-color:black;">&nbsp; 시급
								</div> -->
								<div class="campain_pay2">
									<span value="총금액" style="width:15px;height:15px;border:1px;accent-color:black; line-height: 48px;">&nbsp; 총금액</span>
									<input type="text" placeholder="0" id="full_money" class="pay_textbox"><span class="pay_textboxAfter">원 이상</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="page4">
						<div class="page4_sub">
							<h1 class="cam6">캠페인 참여 가능 지역</h1>
							<div class="cam6_bottom">
								<div class="cam6_1">등록할 캠페인에 대한 참여 가능 지역을 설정합니다.</div>
								<div class="address"></div>
								<div class="outBox2">
									<div class="inputBox">
										<input type="text" id="campainJoinArea" class="textbox"
											name=""> <label for="sampleId">주소를 입력하세요</label>
										<button class="cam3_namebtn btn btn-dark" onclick="selectAddress()">주소검색</button>
									</div>
								</div>

								<div id="map" class="map" style="width:700px;height:480px;"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="page5">
						<div class="page5_sub">
							<h1 class="cam6">캠페인 참여 링크</h1>
							<div class="cam6_bottom_v2">
								<div class="cam6_1_v2">등록할 캠페인에 대한 참여 가능한 서비스와 링크를 설정합니다.</div>
								<div class="cam6_service">
									<div class="cam6_serviceFont">서비스 명</div>
									<div id="select_box">
										<label for="color">ex) 줌, 디스코드</label> <select id="color"
											title="select color">
											<option>ex) 줌, 디스코드</option>
											<option>ZOOM</option>
											<option>DISCORD</option>
										</select>
										<div id="selectService_alert"></div>
									</div>
									<div id="campainServiceName_alert"></div>
								</div>

								<div class="cam6_link">
									<div class="cam6_linkFont">링크</div>
									<div class="outBox3">
										<div class="inputBox">
											<input type="text" id="campainLinkLoc" class="textbox"
												name=""> <label for="sampleId">링크를 입력하세요.</label>
											<button class="cam3_namebtn btn btn-dark"
												onclick="campainLinkLoc()">확인</button>
										</div>
										<div id="campainLinkLoc_alert"></div>
									</div>

								</div>

							</div>
						</div>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="page6">
						<div class="page6_sub">
							<h1 class="cam7">캠페인 일정</h1>
							<div class="cam7_bottom">
								<div class="cam7_1">등록할 캠페인에 대한 일정을 설정합니다.</div>
								<div class="start_date">
									<label class="s_name">시작일</label> <input type="text"
										id="datePicker_start" class="datePicker" onclick='javascript:m_datepicker(this);'> <span
										class="input-group-addon"> <i
										class="glyphicon glyphicon-calendar"></i>
									</span>       
								</div>
								<div class="end_date">
									<label class="e_name">종료일</label> <input type="text"
										id="datePicker_end" class="datePicker" onclick='javascript:m_datepicker(this);'><span
										class="input-group-addon"> <i
										class="glyphicon glyphicon-calendar"></i>
									</span>   
								</div>
<!-- 								<fieldset>
									<label> 
										<input type="radio" name="calender_date" value="week" checked /> <span>주차별</span>
									</label> 
									<label> 
										<input type="radio" name="calender_date" value="5days" /> <span>5일 단위</span>
									</label>
								</fieldset> -->
								<div id="calenderBox">
									<table id="campaignCalender">
										<thead>
											<tr>
												<th id="selectPeriod">주차</th>
												<th>시작일</th>
												<th>날짜</th>
												<th>시작시간</th>
												<th>활동내용을 간략히 적어주세요</th>
											</tr>
										</thead>
										<tbody id="calenderTbody">
										</tbody>
									</table>
								</div>
								
							</div>

						</div>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="page7">
						<div class="page7_sub">
							<h1 class="cam9">END. 캠페인 진행 과정</h1>
							<div class="cam9_bottom">
								<div class="cam9_1">수강자가 이해할 수 있도록 등록하고자 하는 캠페인에 대한 설명을
									작성합니다.</div>
								<textarea
									placeholder="캠페인에 대한 설명을 작성하세요.&#13;&#10; ex) 캠페인 진행 과정, 시간 면담, 일정"
									class="regi form-control"></textarea>
								<div class="document">
									<div class="document_name">추가 자격증, 사업자 등록증 및 기타 서류</div>
									<div id="document_alert">* 인증서류 업로드 시 개인정보 모자이크 처리 확인 필수</div>
									<!--         						<button id = "cam1_button2" class="category_btn" onclick="addFile()" style="text-align:center">추가하기</button> -->
									<form class="form1" action="/main/create/fileUpload.do?_csrf=${_csrf.token }" method="POST" encType="multipart/form-data">
										<div id="customFile0">
											<i class="far fa-file-image" style="font-size: 24px"></i> 
											<input type='file' accept='image/jpg,image/png,image/jpeg,image/gif' id='profile_img_upload' name="profile_img_upload"/> 
											<i id="plusbt" class="fa-sharp fa-solid fa-plus" style="font-size: 24px" onclick="addFile()"></i> 
											<i class="fa fa-close" style="font-size: 24px" onclick="deleteFile(0)"></i>
											<input type="hidden" name="form1" value="form1">
										</div>
<!-- 										<input class="formSubmit" type="submit" value="submit" onclick="cpn_submit()"> -->
									</form>
								</div>
							</div>
							<input class="formSubmit" type="submit" value="캠페인생성" >
						</div>
					</div>
				</div>
			</div>

			<div class="select_button">
				<div class="swiper-button-next next"></div>
				<div class="swiper-button-prev previous"></div>
			</div>
			
			<div class="swiper-pagination"></div>
		</div>

	</div>
	<!-- nav 회원정보 수정 관련 js -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4cd6acb67135d6b60671b0b2bb4257cb&libraries=services"></script>
<script src="/index/lib/crypto/core.min.js"></script>
<script src="/index/lib/crypto/sha256.min.js"></script>
<script src="/main/js/main/navInfoModify.js"></script>
<script src="/index/lib/jquery/jquery.min.js"></script>
<script src="/index/lib/jquery/jquery.validate.min.js"></script>
	
	<!-- kakao api -->
	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4cd6acb67135d6b60671b0b2bb4257cb&libraries=services"></script>
<!-- 	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4cd6acb67135d6b60671b0b2bb4257cb&libraries=LIBRARY"></script> -->
<!-- 	<!-- services 라이브러리 불러오기 --> -->
<!-- 	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4cd6acb67135d6b60671b0b2bb4257cb&libraries=services"></script> -->
<!-- 	<!-- services와 clusterer, drawing 라이브러리 불러오기 --> -->
<!-- 	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4cd6acb67135d6b60671b0b2bb4257cb&libraries=services,clusterer,drawing"></script> -->
<!-- 	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cd6acb67135d6b60671b0b2bb4257cb&libraries=services&autoload=false"></script> -->
		
	
<!-- 	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script> -->
<!-- 	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js"></script> -->
	 <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
<!-- 	<!-- Swiper JS --> -->
	
<!-- 	<!-- Initialize Swiper --> -->
	<script src="/main/js/main/create/campaignCreate.js"></script>
	<script src="/main/js/main/main.js"></script>
	 <script src="/main/jquery/jquery-ui.min.js"></script>
	

</body>
</html>
