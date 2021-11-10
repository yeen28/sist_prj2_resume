<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>이력서 관리 및 채용공고 관리자 페이지</title>
<jsp:include page="admin_header.jsp"/>
<style type="text/css">
.item_margin {margin: 0px auto; width: 1300px;}
.main1{width: 600px; height: 250px; margin: 0px auto; border: 1px solid #333; margin-top: 100px; margin-right:100px; float: left}
.main2{width: 600px; height: 250px; margin: 0px auto; border: 1px solid #333; margin-top: 100px; float: left}
.main3{width: 1300px; height: 250px; margin: 0px auto; border: 1px solid #333; margin-top: 400px;}
</style>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(function () {
	$("#main_user").click(function() {
		location.href="http://localhost/jsp_prj/project/admin_user_main.jsp";
	});//main_user
	$("#main_user1").click(function() {
		location.href="http://localhost/jsp_prj/project/admin_user_main.jsp";
	});//main_user
	$("#main_job_post").click(function() {
		location.href="http://localhost/jsp_prj/project/admin_job_post_main.jsp";
	});//main_user
})//ready
</script>
</head>
<body>
<div class="item_margin">
	<div class="main1" id="main_user">
		전체회원수
	</div>
	<div class="main2" id="main_user1">
		신규등록 회원
	</div>
</div>
	<div class="main3" id="main_job_post">
		신규등록 채용공고
	</div>

</body>
</html>