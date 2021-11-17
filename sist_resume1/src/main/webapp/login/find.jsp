<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="아이디 비밀번호 찾기 페이지"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/jsp/common_code.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= title %></title>
<link rel="stylesheet" href="<%= protocol %><%= domain %><%= contextRoot %><%= common_css %>/find.css"/>

 <!--jQuery CDN-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>

<body>
<div id="find_wrap">
<!-- header -->
<jsp:include page="/headerfooter/header.jsp"/>

<div class="find_container">
<div class="find_img">
<img alt="findLogin_sist" src="<%= protocol %><%= domain %><%= contextRoot %><%= common_images %>/find.png">
</div>

<div class="container-mid">
<form class="form-signin" action="<%= protocol %><%= domain %><%= contextRoot %><%= login %>/process/find_id_process.jsp" method="post">
<div id="left">
<table>
	<tr><td><span>아이디 찾기<br/>회원님의 이름과 이메일을 입력해주세요.</span></td></tr>
	<tr><td><input type="text" id="name" name="name" placeholder="이름" class="inputBox form-control" required></td></tr>
	<tr><td><input type="email" id="email" name="email" placeholder="이메일" class="inputBox form-control" required></td></tr>
	<tr><td><input type="submit" id="find_id" name="find_id" class="btn" value="확인"></td></tr>
</table>
</div>
</form>

<form action="<%= protocol %><%= domain %><%= contextRoot %><%= login %>/process/find_pass_process.jsp" method="post">
<div id="right">
<table>
	<tr><td><span>비밀번호 찾기<br/>회원님의 이름과 아이디, 이메일을 입력해주세요.</span></td></tr>
	<tr><td><input type="text" id="name" name="name" placeholder="이름" class="inputBox form-control" required></td></tr>
	<tr><td><input type="text" id="id" name="id" placeholder="아이디" class="inputBox form-control" required></td></tr>
	<tr><td><input type="email" id="email" name="email" placeholder="이메일" class="finputBox form-control" required></td></tr>
	<tr><td><input type="submit" id="find_pass" name="find_pass" class="btn" value="확인"></td></tr>
</table>
</div>
</form>
</div>
</div>

<!-- footer -->
<jsp:include page="/headerfooter/footer.jsp"/>
</div>

</body>
</html>