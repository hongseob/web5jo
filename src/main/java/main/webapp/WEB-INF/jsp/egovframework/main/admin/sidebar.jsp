<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head> 
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
</head>
<body>
	<nav id="sidebar" class="sidebar js-sidebar">
	<div class="sidebar-content js-simplebar">
		<a class="sidebar-brand" href="<c:url value='/admin/adminIndex.do' />">
			<span class="align-middle">Proker 관리자 페이지</span>
		</a>

		<ul class="sidebar-nav">
			<li class="sidebar-header">캠페인 관리</li>

			<li class="sidebar-item "><a class="sidebar-link"
				href="/admin/adminIndex.do"> <i class="align-middle"
					data-feather="bell"></i> <span class="align-middle">캠페인 승인</span>
			</a></li>

			<li class="sidebar-item"><a class="sidebar-link"
				href="/admin/campaignApprove.do"> <i class="align-middle"
					data-feather="check"></i> <span class="align-middle">캠페인 승인목록</span>
			</a></li>

			<li class="sidebar-item"><a class="sidebar-link"
				href="/admin/campaignRefuse.do"> <i class="align-middle"
					data-feather="x"></i> <span class="align-middle">캠페인 거절목록</span>
			</a></li>

			<li class="sidebar-item"><a class="sidebar-link"
				href="/admin/campaignProgress.do"> <i class="align-middle"
					data-feather="chevrons-right"></i> <span class="align-middle">진행중인 캠페인</span>
			</a></li>

			<li class="sidebar-header">유저 관리</li>

			<li class="sidebar-item"><a class="sidebar-link"
				href="/admin/memberManagement.do"> <i class="align-middle"
					data-feather="user"></i> <span class="align-middle">사용자 인증 요청</span>
			</a></li>

			<li class="sidebar-item"><a class="sidebar-link"
				href="/admin/authManagement.do"> <i class="align-middle"
					data-feather="user-check"></i> <span class="align-middle">인증된 사용자</span>
			</a></li>

			<li class="sidebar-header">메뉴 관리</li>

			<li class="sidebar-item"><a class="sidebar-link"
				href="/admin/setSidebar.do"> <i class="align-middle"
					data-feather="sidebar"></i> <span class="align-middle">사이드바 관리</span>
			</a></li>

		
			<li class="sidebar-header">로그 관리</li>

			<li class="sidebar-item"><a class="sidebar-link"
				href="/admin/logManagement.do"> <i class="align-middle"
					data-feather="log-in"></i> <span class="align-middle">로그</span>
			</a></li>
			
			<li class="sidebar-item"><a class="sidebar-link"
				href="/admin/SchedulerlogManagement.do"> <i class="align-middle"
					data-feather="log-in"></i> <span class="align-middle">스케줄러 로그</span>
			</a></li>
			
			<li class="sidebar-header">알람 관리</li>

			<li class="sidebar-item"><a class="sidebar-link"
				href="/admin/alarm.do"> <i class="align-middle"
					data-feather="bell"></i> <span class="align-middle">알람</span>
			</a></li>
		</ul>


	</div>
	</nav>
</body>
<script>

$(function() {
 	
/*     $(".sidebar-item").click(function(){
    	console.log('click');
    	  // If this isn't already active
    	  if (!$(this).hasClass("active")) {
    	    // Remove the class from anything that is active
    	    $(".sidebar-item.active").removeClass("active");
    	    // And make this active
    	    $(this).addClass("active");
    	  }
    	}); */
  	
  	if(window.location.pathname == '/admin/adminIndex.do'){
  		$(".sidebar-item:eq(0)").addClass("active")
  	}
  	else if(window.location.pathname == '/admin/campaignApprove.do'){
  		$(".sidebar-item:eq(1)").addClass("active");
  	}
  	else if(window.location.pathname == '/admin/campaignRefuse.do'){
  		$(".sidebar-item:eq(2)").addClass("active");
  	}
  	else if(window.location.pathname == '/admin/campaignProgress.do'){
  		$(".sidebar-item:eq(3)").addClass("active");
  	}
  	else if(window.location.pathname == '/admin/memberManagement.do'){
  		$(".sidebar-item:eq(4)").addClass("active");
  	}
  	else if(window.location.pathname == '/admin/authManagement.do'){
  		$(".sidebar-item:eq(5)").addClass("active");
  	}
  	else if(window.location.pathname == '/admin/setSidebar.do'){
  		$(".sidebar-item:eq(6)").addClass("active");
  	}
 	else if(window.location.pathname == '/admin/logManagement.do'){
  		$(".sidebar-item:eq(7)").addClass("active");
  	}
 	else if(window.location.pathname == '/admin/SchedulerlogManagement.do'){
  		$(".sidebar-item:eq(8)").addClass("active");
  	}
 	else if(window.location.pathname == '/admin/alarm.do'){
 		$(".sidebar-item:eq(9)").addClass("active");
 	}
  	
  	
	 
});




</script>


</html>