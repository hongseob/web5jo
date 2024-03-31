<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/css/egovframework/main/search/campaignSearch.css" type='text/css'>

<!-- nav 회원정보 수정 관련 css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous"/>
<link rel="stylesheet" href="/index/lib/bootstrap/css/bootstrap.css"/>
<link rel="stylesheet" href="/css/egovframework/main/navInfoModify.css" type='text/css'>
<!-- index.css는 문의하기 관련된 코드 분리하는대로 없앨 예정 -->
<link rel="stylesheet" href="/css/egovframework/main/campaigncard.css" type='text/css'>
<link rel="stylesheet" href="/css/egovframework/index/index.css"/>
<link rel="stylesheet" href="/css/egovframework/main/main.css" type='text/css'>

<title>Proker</title>
</head>
<body class="body">
	<%@ include file="../header.jsp"%>
	<%@ include file="../leftMenu.jsp"%>
	
	<div class="margin_header"></div>
	
	<div class="search_wrapper">
	    <div class="campaign_search_content">
	        <span class="search_keyword" id="search_keyword">'${params.keyword}'</span>
	        <span class="search_description">에 대한 검색 결과</span>
	        <div class="search_box">
	            <p class="reset_description">선택한 검색 조건 <a href="/main/search.do?keyword=${params.keyword}" class="filter_reset">초기화</a></p>
	            <div class="filter_delete_box">
		            <span>
			            <c:if test="${params.distanceCheck eq 'on' and params.campaignDistance ne '0'}"> 
			            	<a href="#" class="filter_delete" id="distance_filter_delete" name="${params.campaignDistance}">반경 ${params.campaignDistance}km 이내 <i class="fa fa-times fa_close_color" aria-hidden="true"></i></a>
			            </c:if>
			            <c:if test="${params.priceCheck eq 'on'}"> 
			            	<a href="#" class="filter_delete" id="price_filter_delete" name="${params.campaignMinPrice}/${params.campaignMaxPrice}">${params.campaignMinPrice} ~ ${params.campaignMaxPrice}원 <i class="fa fa-times fa_close_color" aria-hidden="true"></i></a>
			            </c:if>
			            <c:if test="${params.dateCheck eq 'on'}"> 
			            	<a href="#" class="filter_delete" id="date_filter_delete" name="${params.startDate},${params.endDate}">${params.startDate} ~ ${params.endDate} <i class="fa fa-times fa_close_color" aria-hidden="true"></i></a>
			            </c:if>
			            <c:if test="${params.interCheck eq 'on'}"> 
			            	<a href="#" class="filter_delete" id="inter_filter_delete" name="${params.inter}">${params.inter eq '1' ? '대면' : '비대면'} <i class="fa fa-times fa_close_color" aria-hidden="true"></i></a>
			            </c:if>
			            <c:if test="${params.memberCheck eq 'on'}"> 
			            	<a href="#" class="filter_delete" id="member_filter_delete" name="${params.campaignMember}">${params.campaignMember eq '1' ? '1:1' : '1:N'} <i class="fa fa-times fa_close_color" aria-hidden="true"></i></a>
			            </c:if>
			            <c:if test="${params.statusCheck eq 'on'}"> 
			            	<a href="#" class="filter_delete" id="status_filter_delete" name="${params.campaignStatus}">
			            		<c:choose>
			            			<c:when test="${ params.campaignStatus eq '1'}">
			            				모집중인 캠페인
			            			</c:when>
			            			<c:when test="${ params.campaignStatus eq '2'}">
			            				모집완료된 캠페인
			            			</c:when>
			            			<c:when test="${ params.campaignStatus eq '3'}">
			            				진행중인 캠페인
			            			</c:when>
			            			<c:when test="${ params.campaignStatus eq '4'}">
			            				종료된 캠페인
			            			</c:when>
			            			<c:when test="${ params.campaignStatus eq '5'}">
			            				전체 캠페인
			            			</c:when>
			            		</c:choose>
			            		<i class="fa fa-times fa_close_color" aria-hidden="true"></i>
			            	</a>
			            </c:if>
		            </span>
	            </div>
	        </div>
	        
	        <div class="campaign_list_text">
	        	<p class="ml-2">CAMPAIGN LIST</p>
	        </div>
	        <!-- 검색 결과물 표시 영역 -->
	    	<div class="campaign_search_result">
   				<c:set var="i" value="0" />
				<c:set var="j" value="3" />
				<table>
				  <c:forEach items="${keywordList}" var="list" varStatus="status">
				    <c:if test="${i%j == 0 }">
				    <tr>
					    </c:if>
					       <td>
					       		<div class="campaign_card_container">
					    			<div class="campaign_card_name_box">
					    				<c:choose>
					    					<c:when test="${list.cSt eq '2'}"><i class="fa-solid fa-circle-dot icon_yellow icon_pt card_icon"></i></c:when>
					    					<c:when test="${list.cSt eq '3'}"><i class="fa-solid fa-circle-dot icon_green icon_pt card_icon"></i></c:when>
					    					<c:when test="${list.cSt eq '4'}"><i class="fa-solid fa-circle-dot icon_black icon_pt card_icon"></i></c:when>
					    					<c:when test="${list.cSt eq '5'}"><i class="fa-solid fa-circle-dot icon_red icon_pt card_icon"></i></c:when>
					    				</c:choose>
										<p class="campaign_card_name" style="display: inline-block;">${list.cNm}	
										</p>
										<button class="btn_no campaign_card_ellipsis_btn">
												<i class="fa-solid fa-lg fa-ellipsis"></i>
										</button>
										
					    			</div>
					    			<div class="goCampaignInfo${status.count}">
					    				<input type="hidden" id="campaignId${status.count}" name="campaignId" value="${list.cId }">
						    			<div class="campaign_card_location_box">
					    					<img src="/imgpath/${list.fileSvrName}" onerror="this.src='/images/egovframework/main/common/noImage.png';" class="campaign_map"/>
						    			</div>
						    			<div class="campaign_card_price_box">
											<div class="campaign_card_price"><span class="campaign_card_price_text">가격 </span><span><fmt:formatNumber value="${list.estimate }" pattern="#,###" />원</span></div>
						    			</div>
						    			<div class="campaign_card_date_box">
						    				<div class="campaign_card_date"><span class="campaign_date_price_text">기간</span><span>${list.stDate} ~ ${list.edDate} </span></div>
						    			</div>
						    			<div class="campaign_card_inter_box">
						    				<div class="campaign_card_inter"><span class="campaign_date_inter_text">참여방식</span><span><c:if test="${list.cInter eq '1'}"><span>대면</span></c:if><c:if test="${list.cInter eq '2'}">비대면</c:if> </span></div>
						    			</div>
						    			<div class="campaign_card_member_box">
						    				<div class="campaign_card_member"><span class="campaign_date_member_text">참여인원</span><span>1 : ${list.cMbr} </span></div>
						    			</div>
					    			</div>
					    		</div>
					       </td>
					    <c:if test="${i%j == j-1 }">
				    </tr>
				    </c:if>
				    <c:set var="i" value="${i+1 }" />  
				  </c:forEach>
				</table>
				<c:if test="${keywordCount eq '0' }">
					<div class="search_result_zero">
						<p>검색결과 없음</p>
					</div>
				</c:if>
				<form id="goInfoPage" action="/main/info.do" method="get">
					 <input type="hidden" id="campaignId" name="campaignId">
				</form>
	    	</div>
	    	<div style="margin-bottom: 30px">
				<div class="footer">
					<div class="footer_page" style="width: 100% !important;">
						<ul class="footer_pagination footer_modal" id="pagination" style="justify-content: center">
							<li><a href="#" class="start" onclick="startPage()"><i class="fa-sharp fa-solid fa-angles-left mt-1"></i></a></li>
							<li><a href="#" class="arrow left" onclick="prevPage()"><i class="fa-solid fa-angle-left mt-1"></i></a></li>
							<c:forEach var="n" begin="1" end="${totalPage}">
						    	<%-- <li><a class="num" id="page${startNum +n}" href="#" onclick="paging(this)" value="${startNum +n}">${startNum +n}</a></li> --%>
						    	<li><a class="alist_default_p" id="page${startNum +n}" href="#" onclick="paging(this)" value="${startNum +n}">${startNum +n}</a></li>
						    </c:forEach>
							<li><a href="#" class="arrow right" onclick="nextPage()"><i class="fa-solid fa-angle-right mt-1"></i></a></li>
							<li><a href="#" class="last" onclick="endPage()"><i class="fa-sharp fa-solid fa-angles-right mt-1"></i></a></li>
						</ul>
					</div>
				</div>
				<input type="hidden" id="endPage" value="${totalPage}" />
	    	</div>
	    </div>
	
	    <!-- 검색 필터 -->
	    <div class="search_filter">
	    	<form name="filter_submit" id="filter_submit" action="/main/search.do" method="get">
		        <div class="search_result_count_box">
		        	<span class="search_result_count">${keywordCount}</span><span>개의 검색 결과</span>
		        </div>
			    <div class="filter_submit_box">
					<div class="filter_submit_button_box">선택한 검색 조건 적용 <button type="button" class="filter_submit_button" id="filter_submit_button">></button></div>
		        </div>
		        <input id="keyword" name="keyword" type="hidden" value="${params.keyword}"></input>
		        <input id="pageNum" name="pageNum" type="hidden" value="${params.pageNum eq null ? 1 : params.pageNum}"></input>
		        <div class="search_filter_container">
			            <div class="filter_list_first">
			            	<div class="filter2">
			            		<label id="distanceCheckName" for="distanceCheck"><input type="checkbox" class="distanceCheck" id="distanceCheck" name="distanceCheck"/> 캠페인 지역</label>
			            	</div>
			            	<div class="distanceFilter" id="distanceFilter">
				                <ul class="filter_options2">
				                    <li class="filter2_list">
				                        <span>
											${userAddress}
				                        </span>
				                    </li>
				                    <li class="filter2_list">
				                        <input type="range" id="campaignDistance" name="campaignDistance" min="0" max="100" step="5" value="0" oninput="document.getElementById('distance').innerHTML=this.value;">
				                    </li>
				                    <li class="filter2_list">
				                        <span>0km</span>
				                        <span class="distance_example">50km</span>
				                        <span class="distance_example">100km</span>
				                    </li>
				                    <li class="filter2_list">
				                        <span>반경</span><span id="distance"></span><span>km 이내</span>
				                    </li>
				                </ul>
			                </div>
			            </div>
		
			            <div class="filter_list">
			            	<div class="filter2">
			            		<label id="priceCheckName" for="priceCheck"><input type="checkbox" name="priceCheck" class="priceCheck" id="priceCheck" name="priceCheck"/> 가격</label>
			            	</div>
			            	<div class="priceFilter" id="priceFilter">
				                <ul class="filter_options2">
				                    <li class="filter2_list">
				                        <input type="text" name="campaignMinPrice" id="campaignMinPrice" class="campaign_price" placeholder="최소금액" onkeyup="inputNumberFormat(this)">
				                        ~
				                        <input type="text" name="campaignMaxPrice" id="campaignMaxPrice" class="campaign_price" placeholder="최대금액" onkeyup="inputNumberFormat(this)">
				                    </li>
				                </ul>
			                </div>
			            </div>
		
			            <div class="filter_list">
			            	<div class="filter2">
			            		<label id="dateCheckName" for="dateCheck"><input type="checkbox" class="dateCheck" id="dateCheck" name="dateCheck"/> 기간</label>
			            	</div>
			            	<div class="dateFilter" id="dateFilter">
				                <ul class="filter_options2">
				                    <li class="filter2_list">
				                        <span class="campaign_date">시작일 </span>
				                        <input type="date" name="startDate" id="startDate" class="form-control datePicker"/>
				                    </li>
				                    <li class="filter2_list">
				                        <span class="campaign_date">종료일 </span>
				                        <input type="date" name="endDate" id="endDate" class="form-control datePicker"/>
				                    </li>
				                </ul>
			                </div>
			            </div>
		
			            <div class="filter_list">
			            	<div class="filter2">
			            		<label id="interCheckName" for="interCheck"><input type="checkbox" class="interCheck" id="interCheck" name="interCheck"/> 참여방식</label>
			            	</div>
			            	<div class="interFilter" id="interFilter">
				                <ul class="filter_options2">
				                    <li class="filter2_list">
				                        <label class="campaign_join_method">
				                        	<input type="radio" class="inter" id="inter1" checked name="inter" value="1">
				                        		대면
				                       	</label>
				                        <label class="campaign_join_method">
				                        	<input type="radio" class="inter" id="inter2" name="inter" value="2">
				                        		비대면
				                        </label>
				                    </li>
				                </ul>
			                </div>
			            </div>
		
			            <div class="filter_list">
			            	<div class="filter2">
			            		<label id="memberCheckName" for="memberCheck"><input type="checkbox" class="memberCheck" id="memberCheck" name="memberCheck"/> 참여인원</label>
			            	</div>
			            	<div class="memberFilter" id="memberFilter">
				                <ul class="filter_options2">
				                    <li>
				                        <label class="campaign_join_num">
				                       		<input type="radio" id="campaignMember1" class="campaignMember" name="campaignMember" checked value="1">
				                       		1:1
				                        </label>
				                        <label class="campaign_join_num">
				                       		<input type="radio" id="campaignMember2" class="campaignMember" name="campaignMember" value="2">
				                        	1:N
				                        </label>
				                    </li>
				                </ul>
			                </div>
			            </div>
			            
			            <div class="filter_list_last">
			            	<div class="filter2">
			            		<label id="statusCheckName" for="statusCheck"><input type="checkbox" class="statusCheck" id="statusCheck" name="statusCheck"/> 캠페인 상태 </label>
			            	</div>
			            	<div class="statusFilter" id="statusFilter">
				                <ul class="filter_options2">
				                    <li>
				                        <label class="campaign_status">
				                       		<input type="radio" id="campaignStatus1" class="campaignStatus" name="campaignStatus" value="1" checked>
				                        	모집중인 캠페인
				                        </label>
				                        <label class="campaign_status">
				                       		<input type="radio" id="campaignStatus2" class="campaignStatus" name="campaignStatus" value="2">
				                        	모집완료된 캠페인
				                        </label>
				                        <label class="campaign_status">
				                       		<input type="radio" id="campaignStatus3" class="campaignStatus" name="campaignStatus" value="3">
				                        	진행중인 캠페인
				                        </label>
				                        <label class="campaign_status">
				                       		<input type="radio" id="campaignStatus4" class="campaignStatus" name="campaignStatus" value="4">
				                        	종료된 캠페인
				                        </label>
				                        <label class="campaign_status">
				                       		<input type="radio" id="campaignStatus5" class="campaignStatus" name="campaignStatus" value="5">
				                       		전체 캠페인
				                        </label>
				                    </li>
				                </ul>
			                </div>
			            </div>
			            
		        </div>
	        </form>
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

<script src="/main/js/main/search/campaignSearch.js"></script>

<script src="/main/js/main/main.js"></script>
</body>
</html>