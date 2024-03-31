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

<link rel="stylesheet" href="/index/lib/bootstrap/css/bootstrap.css"/>
<link rel="stylesheet" href="/css/egovframework/main/navInfoModify.css" type='text/css'>
<!-- index.css는 문의하기 관련된 코드 분리하는대로 없앨 예정 -->
<link rel="stylesheet" href="/css/egovframework/main/campaigncard.css" type='text/css'>
<link rel="stylesheet" href="/css/egovframework/index/index.css"/>
<link rel="stylesheet" href="/css/egovframework/main/main.css" type='text/css'>

<link rel="stylesheet" href="/css/egovframework/main/review/review.css">

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/25990c746d.js" crossorigin="anonymous"></script>
</head>

<body style="font-family: 'Noto Sans KR', sans-serif;">

	<%@ include file="../header.jsp"%>
	<%@ include file="../leftMenu.jsp"%>

	<div class="introBody">
        <div class="intro">
            <div class="mentorIntro">
            	<br>
                <h3 class="mentorHeader">Mentor</h3>
                <span class="mentor">${mentorName}</span>
                <span>님에게 리뷰를 남겨주세요</span>
                <br><br>
                <div>
                    좋은 수강평을 남겨주시면 멘토와 이후 배우는 사람들에게 큰 도움이 됩니다!<br>회원님의 수강평을 남겨주세요!
                </div>
            </div>
        </div>
    </div>
    <div class="mainBody">
        <div class="reviewPage">
            <div class="reviewAddPage">
                <div class="starContentHeader">
                    <span class="starContentHeaderName">My Review</span>
                </div>
                <div class="reviewAddPageContent">
                    <div class="addReviewContent">
                        <div class="addStarBox">
                            <div class="starSelect">
                                <div class="stars">
                                    <i class="fa fa-star active"></i>
                                    <i class="fa fa-star active"></i>
                                    <i class="fa fa-star active"></i>
                                    <i class="fa fa-star active"></i>
                                    <i class="fa fa-star active"></i>
                                </div>
                                <div class="print">
                                    <span class="printContent">별점을 선택해주세요</span>
                                </div>
                            </div>
                        </div>
                        <div class="addReviewBox">
                            <div class="reviewBox">
                                <div class="reviewContent">
                                    <textarea id="reviewText" class="reviewText" placeholder="수강평을 작성해주세요."></textarea>
                                    <div class="reviewButtonSpace2">
                                        <button id="reviewButton" class="reviewButton"
                                            style="@style/Widget.AppCompat.Button.Borderless">리뷰<br>남기기</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="reviewAddPageBottom">

                </div>
            </div>
        </div>
        <div class="descriptionPage">
            <div class="descriptionBox">
                <h3>
                    멘토님에 대한 평가를 남겨주세요
                </h3>
                <div class="description">
                    &bull; 좋았던 점을 말해주세요!
                </div>
                <div class="descriptionContent">
                    캠페인을 진행하는동안 만족스러웠던 점, 혹은 멘토님의 전문성이 돋보였던 점, 캠페인의 일정과 진행방식에 대한 생각을 적어주세요.
                </div>
                <br>
                <div class="description">
                    &bull; 아쉬웠던 점을 말해주세요!
                </div>
                <div class="descriptionContent">
                    어떤점이 아쉬웠는지, 멘토님이 어떻게 그 점을 개선할 수 있을지 적어주세요.
                </div>
            </div>
        </div>
    </div>

<script language=JavaScript>
		let info = new Array();
		info.push({
			campaignId: "${campaignId}",
			campaignName: "${campaignName}",
			campaignStatus: "${campaignStatus}",
			mentorPkId: "${mentorPkId}",
			mentorId: "${mentorId}",
			mentorName: "${mentorName}",
			reviewCheck: "${reviewCheck}",
		});
	</script>	
	
	<!-- nav 회원정보 수정 관련 js -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4cd6acb67135d6b60671b0b2bb4257cb&libraries=services"></script>
	<script src="/index/lib/crypto/core.min.js"></script>
	<script src="/index/lib/crypto/sha256.min.js"></script>
	<script src="/main/js/main/navInfoModify.js"></script>
	<script src="/main/js/main/jquery.js"></script>
	<script src="/index/lib/jquery/jquery.min.js"></script>
	<script src="/index/lib/jquery/jquery.validate.min.js"></script>
	<!-- js -->
<!--     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="/main/js/main/main.js"></script>
	<script src="/main/js/main/info/jqeury.table.min.js"></script>
    <script src="/main/js/main/review/review.js"></script>
</body>


</html>