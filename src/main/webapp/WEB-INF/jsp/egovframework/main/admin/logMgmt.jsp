<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="/main/js/vendors/datatables/dataTables.bootstrap.css" rel="stylesheet" media="screen">
</head>
<body>
<%@ include file="./adminHeader.jsp" %>
    <div class="page-content">
    	<div class="row">
		<%@ include file="./sidebar.jsp" %>
		  <div class="col-md-10">

  			<div class="content-box-large">
  				<div class="panel-heading">
					<div class="panel-title">접속로그 이력 관리</div>
				</div>
  				<div class="panel-body">
  					<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered " id="example">
						<thead>
							<tr>
								<th>접속 ID</th>
								<th>접속 URL</th>
								<th>접속 날짜</th>
							</tr>
						</thead>
						<tbody class="logListTable" >
							
						</tbody>
					</table>
						<div class="pagination"></div>
  				</div>
  			</div>
		  </div>
		</div>
    </div>
    
<script src="/main/js/admin/logMgmt.js"></script>
<!-- <script src="/main/js/vendors/datatables/js/jquery.dataTables.min.js"></script> -->
<!--  <script src="/main/js/vendors/datatables/dataTables.bootstrap.js"></script>  -->
<script src="/main/js/admin/custom.js"></script>
<!-- <script src="/main/js/admin/tables.js"></script> -->
</body>
</html>