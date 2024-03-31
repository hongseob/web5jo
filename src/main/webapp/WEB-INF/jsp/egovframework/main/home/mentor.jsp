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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<!-- swiper CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
<link rel="stylesheet" href="/css/egovframework/main/mentor/mentor.css">
</head>

<body>
<div>
	<button id="returnButton" class="returnButton">
		<i class="bi bi-arrow-left"></i> 메인으로 돌아가기
	 </button>	
</div>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<!-- Slider main container -->
	<div class="mainBody">
		<div class="container-fluid containerBox">
			<div class="swiper">
				<!-- Additional required wrapper -->
				<div class="swiper-wrapper">
					<!-- Slides -->

					<div class="swiper-slide">
						<div class="innerBox">
							<div class="questionBox">
								<div>
									<span>Step1</span>
									<span>대표분야와 이외 제공가능한 분야를 적어주세요</span>
								</div>
								<span class="subQeustion"> 관심분야가 무엇인가요? 제공가능한 주특기 분야,
									기술스택을 알려주세요. <br> ex) Java, React, SQL ...
								</span>
							</div>
							<div id="selectButtonBox" class="selectButtonBox">
								<!-- <button class="categoryOne">
									html
								</button>
								<button class="categoryOne">
									Java
								</button> -->
							</div>
							<div class="inputBox">
								<span class="line">
								<input id="field" class="inputValue"
									type="text" placeholder="카테고리를 추가해주세요." value="">
								</span>
								<span class="buttonBox">
									<button id="fieldCheck" type="button" class="addButton" disabled="true">
										추가
									</button>
									<button id="clearButton" class="clearButton" type="reset">
										Reset
									</button>
								</span>
							</div>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="innerBox">
							<div class="questionBox">
								<span>Step2</span>
								<span> 캠페인의 진행방향을 간단히 적어주세요 </span> <br>
								<span class="subQeustion"> 원하시는 캠페인 진행방식을 적어주세요. <br>
									ex) 비대면 줌 형식, 과외 ...
								</span>
							</div>
							<div class="inputBox">
								<div class="processBox">
									<span class="line"> <input id="process"
									class="inputValue" type="text" placeholder="답변을 입력해주세요."
									value="">
									</span>
									<span class="buttonBox">
										<button id="processCheck" type="button" class="checkButton">
										확인
										</button>
									</span>
								</div>		
							</div>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="innerBox">
							<div class="questionBox">
								<div>
									<span>Step3</span> <span>멘토의 소속된 회사 및 직무를 알려주세요</span>
								</div>
								<span class="subQeustion">카테고리를 선택해주신후 명칭을 입력해주세요<br>
								 ex) 프로커 / 프론트엔드 </span>
							</div>
							<div class="inputBox">
								<span class="jobCategoryBox">
									<select id="jobCategoryNum" class="categoryNum" name="categoryNum">
										<option value=0>category</option>
										<option value=1>사기업</option>
										<option value=2>공기업</option>
										<option value=3>프리랜서</option>
										<option value=4>개인</option>
									</select>
								</span>
								<span class="line"> <input id="job" class="inputValue"
									type="text" placeholder="답변을 입력해주세요.">
								</span>
								<span class="buttonBox">
									<button id="jobCheck" type="button" class="checkButton">
										확인
									</button>
								</span>
							</div>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="innerBox">
							<div class="questionBox">
								<div>
									<span>Step4</span> <span>멘토의 포트폴리오를 등록해주세요.</span>
								</div>
								<span class="subQeustion"> 멘토의 활동내용이 담겨있는 깃허브주소 또는 블로그
									주소를 적어주세요 </span>
							</div>
							<div class="inputBox">
								<span class="line">
								<input id="link" class="inputValue"
									type="text" placeholder="답변을 입력해주세요.">
								</span>
								<span class="buttonBox">
									<button id="linkCheck" type="button" class="checkButton">
										확인
									</button>
								</span>
							</div>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="innerBox">
							<div class="questionBox">
								<div>
									<span>Step5</span>
									<span>멘토의 인증서류를 등록해주세요</span>
								</div>
								<span class="subQeustion"> 멘토님의 전문성을 확인할 수 있도록 <br>
									유효한 사업자등록증이나 재직증명서 또는 자격증,기타 서류를 등록해주세요.
								</span>
							</div>
							<div class="inputBox">
								<form id="fileForm" class="fileForm" action="/main/create/fileUpload.do?_csrf=${_csrf.token }" method="POST" encType="multipart/form-data">
									<div class="fileBox">
										<input id="file" class="upload-name" value="파일을 등록해주세요."
											disabled="disabled">
										<label for="file1">업로드</label>
										<input id="file1" class="inputFile" type="file" name="file1" value="file1"
											accept="image/jpg,image/png,image/jpeg,image/gif, .pdf, .hwp">
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="innerBox">
							<div class="questionBox">
								<div>
									<span>Step6</span>
									<span> 마지막으로 멘토님의 추가정보를 입력해주세요</span>
								</div>
								<span class="subQeustion"> 멘토님의 활동경험이나 경력사항, 외주경험 등<br>
									멘토님 분야에 대한 전문성, 차별점 등을 간단히 적어주세요.
								</span>
							</div>
							<div class="inputBox">
								<span class="line">
									<input id="information" class="inputValue" type="text" placeholder="답변을 입력해주세요.">
								</span>
								<span class="buttonBox">
									<button id="informationCheck" type="button" class="checkButton">
										확인
									</button>
								</span>
							</div>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="innerBox">
							<div class="questionBox">
								<div>
									<span>Final </span>
									<span>멘토등록 요청하기</span>
								</div>
								<span class="subQeustion">
									멘토신청내용을 검토, 승인 후 멘토등록이 완료됩니다.
								</span>
							</div>
							<div class="inputBox">
								<div class="submitBox">
									<button id="submitButton" type="submit" class="submitButton" value="제출">
										신청하기
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<span class="swiperButtonBox">
				<div class="swiper-button-prev"></div>
				<div id="nextButton" class="swiper-button-next"></div>
			</span>

		</div>
	</div>



	<!-- swiper -->
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
	<!-- <script src="/main/js/main/mentor/jquery.js"></script> -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="/main/js/main/mentor/mentor.js"></script>
</body>

</html>