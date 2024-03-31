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

<link rel="stylesheet" href="/css/egovframework/main/mentorReview/mentorReview.css">

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/25990c746d.js" crossorigin="anonymous"></script>
</head>

<body style="font-family: 'Noto Sans KR', sans-serif;">

	<%@ include file="../header.jsp"%>
	<%@ include file="../leftMenu.jsp"%>
	
	<div class="mainPage">
        <div class="mentorStarRatingBox">
            <div class="mentorRatingTitle h4">Mentor Rating</div>
            <div class="mentorStarRating">
                <div class="mentorBox">
                    <div class="mentorInfo">
                        <span class="mentorSet">멘토 </span>
                        <span id="mentor" class="mentor">멘토이름</span>
                    </div>
                    <div class="mentorReviewResult">
                        <span class="reviewSet">총 리뷰수</span>
                        <span id="reviewCount" class="reviewCount">30</span>
                    </div>
                </div>
                <div class="mentorStar">
                    <div class="rateBox">
                        <div class="starRateBox">
                            <div class="starRateSet">평점</div>
                        </div>
                        <div class="starRateViewBox">
                            <span id="starRate" class="starRate">3.3</span>
                            <!-- <i class="fa fa-star">
                                
                            </i> -->
                        </div>
                    </div>
                    <div class="starRateNumBox">
                        <div class="starRateNum">5점</div>
                        <div class="starRateNum">4점</div>
                        <div class="starRateNum">3점</div>
                        <div class="starRateNum">2점</div>
                        <div class="starRateNum">1점</div>
                    </div>
                </div>
                <div class="rating-progress-bars p-3">
                    <div class="progress-1 align-items-center">
                        <div class="progress">
                            <div id="fiveStar" class="progress-bar bg-success" role="progressbar" style="width: 100%;"
                                aria-valuenow="70" aria-valuemin="0" aria-valuemax="100">

                            </div>
                        </div>
                        <div class="progress">
                            <div id="fourStar" class="progress-bar bg-custom" role="progressbar" style="width: 55%;"
                                aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <div class="progress">
                            <div id="threeStar" class="progress-bar bg-primary" role="progressbar" style="width: 48%;"
                                aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>

                        </div>
                        <div class="progress">
                            <div id="twoStar" class="progress-bar bg-warning" role="progressbar" style="width: 30%;"
                                aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <div class="progress">
                            <div id="oneStar" class="progress-bar bg-danger" role="progressbar" style="width: 15%;"
                                aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="reviewCommentBox">
            <div class="commentTitle h4">
                Review
            </div>
            <div class="reviewTableBox" style="margin-bottom: 0;">
                <table class="table reviewTable" style="margin-bottom: 0;">
                    <thead class="table-light reviewTableTitle">
                        <tr>
                            <td>Rating</td>
                            <td>User</td>
                            <td>Campaign</td>
                            <td>Comment</td>
                            <td>Date</td>
                        </tr>
                    </thead>
                </table>
                <div class="reviewTableBodyBox">
                    <table class="table" style="table-layout: fixed">
                        <tbody id="reviewTableBody" class="reviewTableBody">
                            
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>
	
	<!-- Map objectMap = request.getAttribute(reviewMap); -->
 
	<script language="JavaScript" >
		let info = new Array();
		info.push({
			mentorPkId: "${mentorPkId}",
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
    <script src="/main/js/main/mentorReview/mentorReview.js"></script>
</body>


</html>