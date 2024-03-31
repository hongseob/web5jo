<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PROKER</title>
<!-- css 파일들 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous" />
<link rel="stylesheet" href="/index/lib/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" href="/fonts/index/css/all.css" />
<link rel="stylesheet" href="/css/egovframework/index/index.css" />
<link rel="stylesheet" href="/index/lib/bootstrap/css/carousel.css" />
<link rel="stylesheet" href="/index/lib/openlayers/css/ol.css" />

</head>

<body>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<!-- 가장 큰 레이아웃 -->
	<div class="container-fluid fixed-top min-vh-100 bgi-a" id="bg-image"></div>
	<!-- 상단 네비바를 감싸는 박스 -->
	<div class="container-fluid fixed-top top-contents">
		<nav class="navbar navbar-dark navbar-expand flexflow-row"> <a class="ml-3 mt-3 mb-3 navbar_brand_font" href="/">PROKER</a>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ml-auto mr-auto underline silkabold description">
				<li class="nav-item mr-5"><a class="nav-link" href="#solution"> SOLUTION </a></li>
				<li class="nav-item mr-5""><a class="nav-link" href="#before-tech"> TECH </a></li>
				<li class="nav-item mr-5""><a class="nav-link" href="#contact"> CONTACT </a></li>
			</ul>
			<ul class="navbar-nav mr-5 mt-3 mb-3 silkamedium user-action">
				<c:choose>
					<c:when test="${auth eq 'A' or auth eq 'B' or auth eq 'R'}">
						<li class="nav-item">
							<form type="hidden" action="/logout.do?_csrf=${_csrf.token }" method="post">
								<button type="submit" class="nav-link index_logout_button">LOGOUT</button>
							</form>
						</li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link" id="LOGIN"> LOG IN </a></li>
						<li class="nav-item"><a class="nav-link" id="JOIN"> JOIN </a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		</nav>
	</div>

	<!-- LOGIN -->
	<div class="sub-window shadow" id="bg-LOGIN">
		<div class="fixed-window12">
			<a type="button" class="closebtn" id="closebtn" aria-label="Close"> <span aria-hidden="true">&times;</span>
			</a>
		</div>
		<div class="create-window-part">
			<div class="form-group">
				<div class="text-center">
					<b class="LOGIN-font mr-2">LOGIN</b>
				</div>
				<div class="protocol-contents">
					<p>재 방문을 환영합니다. 서비스 이용을 위해 로그인 부탁드립니다.</p>
				</div>
				<br> <br>
				<form id="campaign_loginform" name="campaign_loginform" action="/loginProcess?_csrf=${_csrf.token }" method="post" novalidate="novalidate">
					<div class="info-body mb-3">
						<div class="mb-2">
							<input type="text" class="form-control input-underline mb-4" id="uId" name="id" placeholder="ID(e-mail)"> <input type="password" class="form-control input-underline mb-4" id="uPw" name="password" placeholder="Password">
						</div>
						<div>
							<input type="checkbox" id="Remember-check" name="_spring_security_remember_me" value=""> <label class="form-check-label ml-2" for="Remember-check">Remember me</label> <a class="password_search" id="passwordch">비밀번호 찾기</a>
						</div>
						<br> <br>
					</div>
				</form>
				<div class="row m-0 py-2 text-align-center">
					<button class="btn1 btm-primary-login btn-lg btn-no-radius w-40 font-11 mr-5 ml-auto" id="submitLOGIN">확인</button>
					<button class="btn1 btm-primary-join btn-lg btn-no-radius w-40 font-11 mr-auto" id="submitJOIN">가입하기</button>
				</div>
			</div>
		</div>
	</div>

	<!-- JOIN -->
	<div class="sub-window shadow" id="bg-JOIN">
		<div class="fixed-window12">
			<a type="button" class="closebtn" id="closebtn1" aria-label="Close"> <span aria-hidden="true">&times;</span>
			</a>
		</div>
		<div class="create-window-part-join">
			<div class="form-group">
				<div class="text-center">
					<b class="LOGIN-font mr-2">JOIN</b>
				</div>
				<br>
				<div class="protocol-join">
					<p class="join_welcome">
						환영합니다. 서비스 이용을 위해 아래 절차에 따라 회원가입을 부탁<br>드립니다.
					</p>
				</div>
				<br>
				<form id="campaign_joinform" name="campaign_joinform" action="/join.do?_csrf=${_csrf.token }" method="POST">
					<div class="info_body mb-3">
						<div class="mb-2 ml-1">
							<div class="float-left w-100 mb-2 email_certify_form">
								<input type="text" id="join_id" name="join_id" class="form-control input-underline join_id" placeholder="E-mail(ID) (이용중인 이메일 계정을 입력해주세요)">
								<div class="float-left email_certify_btn_form">
									<a class="form-control w-100 float-left text-center certify-btn" onclick="certify()">이메일 인증</a>
								</div>
							</div>
							<div class="float-left w-100 mb-2 email_certify_form">
								<input type="text" id="mail_check_input" class="form-control input-underline mail-check-input" placeholder="인증번호 5자리를 입력해주세요" disabled="disabled" maxlength="5">
								<div class="float-left email_certify_btn_form">
									<a class="form-control w-100 float-left text-center certify-btn" onclick="codeCheck()">확인</a>
								</div>
							</div>

							<div class="float-left w-100 mb-2">
								<input type="password" class="form-control input-underline" id="join_pw" name="join_pw" placeholder="비밀번호 (6자리이상 소문자/숫자/특수기호를 사용해주세요)">
							</div>

							<div class="float-left w-100 mb-2">
								<input type="password" class="form-control input-underline" id="join_pwchk" name="join_pwchk" placeholder="비밀번호 재입력">
							</div>

							<!-- <div class="float-left w-60 mb-2 pr-1">
								<input type="text" class="form-control input-underline" id="cNm"
									name="cNm" placeholder="회사명">
							</div> -->

							<!-- <div class="float-left w-40 mb-2 pl-1">
								<select id="cCtgrNo" name="cCtgrNo" class="form-select input-underline">
									<option value=0>category</option>
									<option value=1>사기업</option>
									<option value=2>공기업</option>
									<option value=3>프리랜서</option>
									<option value=4>개인</option>
								</select>
							</div> -->

							<div class="float-left w-100 mb-2">
								<input type="text" class="form-control input-underline" id="uNm" name="uNm" placeholder="이름">
							</div>


							<div class="float-left w-100 mb-2">
								<input type="text" class="form-control input-underline" id="uHp" name="uHp" placeholder="휴대전화 (-를 제외하고 입력해 주세요)" required>
							</div>

							<div class="float-left w-100 mb-2 address_input_form">
								<input type="text" id="uAddr" name="uAddr" class="form-control input-underline" placeholder="주소를 입력하세요" readonly> <input type="hidden" name="uLonX" id="uLonX"> <input type="hidden" name="uLatY" id="uLatY">
								<div class="float-left address_find_btn_form">
									<a class="form-control w-100 float-left text-center address_find_btn" id="addressSearch" onclick="sample6_execDaumPostcode()">검색</a>
								</div>
							</div>

							<div class="float-left w-100 mt-3 mb-2 ml-3">
								<input type="checkbox" id="idGenAgr" name="idGenAgr"> <label class="form-check-label ml-2" for="idGenAgr">PROKER 이용 약관에 동의합니다.</label>
							</div>
						</div>
					</div>
				</form>
				<div class="float-left w-100 mt-4">
					<button class="btn1 btm-primary-login btn-lg join_btn btn-no-radius w-40 font-11" id="submitJOIN-GO">확인</button>
					<!-- e-mail에서 회원 아이디 받아오기 -->
				</div>
			</div>
		</div>
	</div>

	<!-- 비밀전호 찾기 -->
	<div class="sub-window shadow" id="bg-PASSWORD-SEARCH">
		<div class="fixed-window12">
			<a type="button" class="closebtn" id="closebtn1" aria-label="Close"> <span aria-hidden="true">&times;</span>
			</a>
		</div>
		<div class="create-window-part px-4">
			<div class="form-group">
				<div class="password_recover">
					<b class="password_font mr-2">PASSWORD 찾기</b><br>
				</div>
				<div class="protocol-contents">
					<P>
						가입하신 이메일로 비밀번호 변경 메일을 발송합니다.<br> 이메일을 받지 못한 경우 스팸함 혹은 수신 차단 여부를 확인해주<br> 세요.
					</P>
				</div>
				<form id="campaign_pwchkform" name="campaign_pwchkform">
					<div class="info-body mb-3">
						<div class="mb-2 ">
							<input type="text" class="form-control input-underline mb-3" id="pwchk_id" name="pwchk_id" placeholder="ID(e-mail)"> <span id="pwchk_idConfirmMsg"></span> <input type="text" class="form-control input-underline mb-2" id="pwchk_name" name="pwchk_name" placeholder="이름">
						</div>
					</div>
				</form>
				<div class="row m-0 py-2">
					<button class="btn1 btm-primary-login btn-lg btn-no-radius font-11 mt-3 recover_btn" id="pwchkSubmit">보내기</button>
				</div>
			</div>
		</div>
	</div>
	<c:if test="${rewrite eq true }">
		<!-- 비밀전호 변경 -->
		<div class="sub-window shadow show" id="bg-PASSWORD-CHANGE">
			<div class="fixed-window12 ">
				<a type="button" class="closebtn" id="closebtn1" aria-label="Close"> <span aria-hidden="true">&times;</span>
				</a>
			</div>
			<div class="create-window-part px-4">
				<div class="form-group">
					<div class="password_change">
						<b class="password-font mr-2">PASSWORD 변경</b>
					</div>
					<br> <br>

					<div class="protocol-contents">

						<!-- LOGIN에서 비밀번호 변경 클릭시  회원 아이디 받아오기 -->
						<p class="PwdSameCk">${userEmail}</p>
						<p>계정의 새 비밀번호를 입력하세요.</p>
					</div>
					<form id="member_pwChangeForm" name="member_pwChangeForm">
						<div class="info-body mb-3">
							<div class="mb-2">
								<input type="hidden" id="pwChange_id" name="uId" value="${userEmail}"> <input type="password" class="form-control input-underline " id="pwChange_pw" name="uPw" placeholder="새 비밀번호 (6자 이상 소문자/숫자/특수기호 포함)"> <span id="pwChange_pwConfirmMsg"></span> <input type="password" class="form-control input-underline mt-3" id="pwchkChange_pw" name="pwchkChange_pw" placeholder="비밀번호 재입력"> <span id="pwchkConfirmMsg"></span>
							</div>
						</div>
						<a type="button" class="btn1 btm-primary-login btn-lg btn-no-radius w-50 font-11 mt-4 password_change_btn" id="pwChange" disabled="disabled">보내기</a>
				</div>
				</form>
			</div>
		</div>
	</c:if>

	<!-- contents1 -->
	<div class="container-fluid h-800 pt-105 contents1" id="solution">
		<div class="container">
			<div class="intro-left w-50 h-400 ">
				<div class="intro-title" style="padding-top: 93px;">PROKER</div>
				<div class="w-60 intro_description_1" style="margin-top: 163px;">
					<a>프로그래밍 언어 과외 중계 서비스 플랫폼</a>
				</div>
				<p class="pt-1" style="color: white; font-size: 11pt; font-weight: 300; margin-top: 86px">
					PROKER는 국내 유일 프로그래밍 언어 전문 과외<br> 중계 플랫폼 입니다.<br> 타 과외 중계 플랫폼과는 다르게 주류,비주류<br> 가릴 것 없이 많은 언어 과외들을 지원하며<br> 실제 현업에서 근무하는 개발자들과 수강생들을<br> 효과적으로 매칭하여 학습을 제공합니다.
				</p>
			</div>
			
			<div class="intro-img w-50 h-500">
			</div>
		</div>
		<div class="container">
			<div class="intro_description_2 w-50">
				<div class="intro-start move-lr">
					<c:choose>
						<c:when test="${auth eq 'A' or auth eq 'B' or auth eq 'R'}">
							<a id="authentic-start">시작하기</a>
						</c:when>
						<c:otherwise>
							<a id="start">시작하기</a>
						</c:otherwise>
					</c:choose>
					<div class="animation">
						<div class="ease-out">
							<div></div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="intro-scroll">
				<a class="rotate-270 content">scroll</a> <span class="arrow"></span>
			</div>
		</div>
	</div>

	<!-- conntents2-->
	<div class="h-600"></div>

	<!-- contents3 -->
	<div id="before-tech"></div>
	<div id="tech" class="carousel slide" data-ride="carousel">
		<!-- carousel => 밑에 점 3개 -->
		<ol class="carousel-indicators" id="index-slidebar">
			<li data-target="#tech" data-slide-to="0" class="index-slide active"></li>
			<li data-target="#tech" data-slide-to="1" class="index-slide2"></li>
			<li data-target="#tech" data-slide-to="2" class="index-slide3"></li>
		</ol>

		<div id="slideContainer">
			<section class="panel blue item bck-1 active" id="slide1">
			<div class="container-fluid bg-tech ph-tech" id="tech1">
				<div class="container">
					<div class="row">
						<div class="col h-600">
							<div class="h-300 mt-120">
								<span class="carousel-num text-shadow-black silkabold fc-second">01</span>
								<p class="carousel-title">프로그래밍 언어 전문 과외</p>
								<p class="carousel-contents">
									PROKER는 국내 타사 과외 플랫폼과는 다르게<br> 비주류 언어 뿐만 아니라 최신 스택이나 배워볼<br> 기회가 없었던 여러 경험을 제공합니다. <br>
								</p>
							</div>
						</div>
						<div class="col tech-area">
							<img alt="" src="/images/egovframework/index/tech1.png" class="mt-120 tech1_img">
						</div>
					</div>
				</div>
			</div>
			</section>
			<section class="panel turqoise item" id="slide2">
			<div class="container-fluid bg-tech ph-tech" id="tech2">
				<div class="container">
					<div class="row">
						<div class="col h-600">
							<div class="h-300 mt-150">
								<span class="carousel-num text-shadow-white silkabold fc-primary">02</span>
								<p class="carousel-title white-color">쉽고 직관적인 매칭</p>
								<p class="carousel-contents white-color">
									PROKER는 쉽고 직관적인 UI로 관심있거나 학습하고 싶은<br> 기술의 캠페인을 제안합니다.<br> 또한 보다 안전하게 선생님과의 소통 및 과외금액 정산을<br> 진행할 수 있는 환경을 지원합니다.
								</p>
							</div>
						</div>
						<div class="col tech-area">
							<img alt="" src="/images/egovframework/index/tech2.png" class="mt-150 tech2_img">
						</div>
					</div>
				</div>
			</div>
			</section>
			<section class="panel green item bck-1" id="slide3">
			<div class="container-fluid bg-tech ph-tech" id="tech3">
				<div class="container">
					<div class="row">
						<div class="col h-600">
							<div class="h-300 mt-150">
								<span class="carousel-num text-shadow-black silkabold fc-second">03</span>
								<p class="carousel-title">현업 개발자와의 학습</p>
								<p class="carousel-contents">
									PROKER는 실제 검증 및 인증된 현업 개발자를 통하여 직접적으로<br> 과외를 받으며 학습을 극대화 할 수 있으며 선생님들은 퇴근 후<br> 경험을 토대로 학습을 제공하며 부수입과 학습제공 경험을 획득합니다.<br>
								</p>
							</div>
						</div>
						<div class="col tech-area">
							<img alt="" src="/images/egovframework/index/tech3.png" class="mt-140 tech3_img">
						</div>
					</div>
				</div>
			</div>
			</section>
		</div>
	</div>

	<!-- content4 -->
	<div class="container-fluid bg-intro h-700" id="contact">
		<div class="container h-100">
			<div class="row h-100">
				<div class="col my-auto">
					<p class="contact-title">CONTACT</p>
					<p class="contact-contents mb-5">
						proker@yonsei.ac.kr <br> 강원도 원주시 연세대길 1, 컨버젼스홀 305호
					</p>
					<!-- <div class="contact-icon m-auto" data-toggle="modal" data-target="#inquireModal"></div> -->
					<button type="button" class="btn btn-outline-light mt-3" data-toggle="modal" data-target="#inquireModal">문의하기</button>
				</div>
				<div id="mapp" class="mapp"></div>
			</div>
		</div>
	</div>

	<!-- 문의하기 modal -->
	<div class="modal fade" id="inquireModal" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-labelledby="inquireModalLabel" aria-modal="true">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content no-border-radius">
				<div class="modal-header no-border-bottom">
					<h2 class="modal-title mx-auto fw-bold" id="inquireModalLabel">문의하기</h2>
				</div>
				<div class="modal-body">
					<form action="/index/indexInquire.do?_csrf=${_csrf.token }" method="post" name="inquireForm">
						<div class="container-fluid">
							<div class="row">
								<div class="col-2 no-padding-right">
									<p class="inquire-p">ID(이메일)</p>
								</div>
								<div class="col-10 form-group">
									<input type="text" class="form-control no-border-radius border-color-primary" id="inq-email" name="email" aria-describedby="emailHelp">
								</div>
							</div>
							<div class="row">
								<div class="col-2 no-padding-right">
									<p class="inquire-p">제목</p>
								</div>
								<div class="col-10 form-group">
									<input type="text" class="form-control no-border-radius border-color-primary" id="inq-title" name="title" aria-describedby="titleHelp">
								</div>
							</div>
							<div class="row">
								<div class="col-2 no-padding-right">
									<p class="inquire-p">내용</p>
								</div>
								<div class="col-10 form-group">
									<textarea class="form-control no-border-radius border-color-primary" id="inq-contents" name="contents" rows="5"></textarea>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer no-border-top">
					<div class="w-50 mx-auto mb-3">
						<button type="button" data-dismiss="modal" aria-label="Close" class="btn btn-secondary bg-secondary w-45 btn-no-radius float-left">닫기</button>
						<button type="button" id="inquireSubmit" class="btn btn-primary bg-primary w-45 btn-no-radius float-right">보내기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4cd6acb67135d6b60671b0b2bb4257cb&libraries=services"></script>
	<script src="/index/lib/crypto/core.min.js"></script>
	<script src="/index/lib/crypto/sha256.min.js"></script>
	<script src="/index/lib/jquery/jquery.min.js"></script>
	<script src="/index/lib/jquery/jquery.mousewheel.min.js"></script>
	<script src="/index/lib/jquery/jquery.validate.min.js"></script>
	<script src="/index/lib/bootstrap/js/popper.js"></script>
	<script src="/index/lib/bootstrap/js/bootstrap.js"></script>
	<script src="/index/lib/greensock/TweenMax.min.js"></script>
	<script src="/index/lib/scrollmagic/scrollmagic.min.js"></script>
	<script src="/index/lib/scrollmagic/plugins/animation.gsap.min.js"></script>
	<script src="/index/lib/bootstrap/js/carousel.js"></script>
	<script src="/index/lib/openlayers/js/ol.js"></script>
	<script src="/index/js/common.js"></script>
	<script src="/index/js/map.js"></script>
	<script>
	$("#authentic-start").on("click", function(){ //시작하기
		
		var auth = "${auth}";
	
		
		if(auth == 'A'){
		location.href="/mainATable.do";
		}
		else if(auth == 'B'){
			location.href="/mainBTable.do";
		}

	});
	
	</script>
</body>
</html>