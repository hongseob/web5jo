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
	<link href="/css/egovframework/admin/admin.css" rel="stylesheet" type="text/css">
	
	
	<link rel="preconnect" href="https://fonts.gstatic.com">	
	<link rel="shortcut icon" href="img/icons/icon-48x48.png" />
	<link rel="canonical" href="https://demo-basic.adminkit.io/" />
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
	
</head>
<body>
<nav class="navbar navbar-expand navbar-light navbar-bg">
				<a class="sidebar-toggle js-sidebar-toggle">
          <i class="hamburger align-self-center"></i>
        </a>

				<div class="navbar-collapse collapse">
					<ul class="navbar-nav navbar-align">
						<li class="nav-item dropdown">
							<a class="nav-icon dropdown-toggle d-inline-block d-sm-none" href="#" data-bs-toggle="dropdown">
               					<i class="align-middle" data-feather="settings"></i>
              				</a>

						  	<a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-bs-toggle="dropdown">
			
			                 <span class="text-dark">Admin</span>
			            	</a>
							<div class="dropdown-menu dropdown-menu-end">
	
								<a class="dropdown-item" href="javascript:;" onclick="document.getElementById('form1').submit();;"><i class="align-middle" data-feather="log-out"></i> Log Out</a>
							</div>
						</li>
						
						<li class="nav-item dropdown">
							<form id='form1' type="hidden" action="/logout.do?_csrf=${_csrf.token }" method="post">
							</form>
						</li>
					</ul>
				</div>
			</nav>
			
			                 		

</body>
</html>