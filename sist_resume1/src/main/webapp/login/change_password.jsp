<%@page import="valueObject.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="비밀번호 변경 페이지"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/jsp/common_code.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= title %></title>

<style type="text/css">
#chang_container{width: 350px; height: 500px; margin: 80px auto;}
#chang_container > h1{text-align: center;margin-bottom: 50px;}
#container-mid{font-size: 18px;}
#container-mid > input{width: 350px; height: 40px; font-size: 18px;}
#container-btn{text-align: center;}
#btn{width: 100px; height: 40px; font-size: 18px; font-weight: bold;background-color: #3498DB; border: 0px; color: #fff;}
</style>

 <!--jQuery CDN-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>

<body>
<c:if test="${ empty sessionScope.member_name }">
<c:redirect url="login_page.jsp"/>
</c:if>
<%
String id=(String)session.getAttribute("id");
/* session에 있는 아이디 */
/* String id="test";
pageContext.setAttribute("id", id); */
%>
<div id="chang_password_wrap">
<!-- header -->
<jsp:include page="/headerfooter/header.jsp"/>

<div id="chang_container">
<h1>비밀번호 변경</h1>

<!-- 비밀번호 변경이 가능하면 alert로 변경됐다고 보여주고, My프로필 페이지로 이동 -->
<form name="change_frm" action="../process/change_pw_process.jsp" method="post">
<div id="container-mid">
<label>이전 비밀번호</label><br/>
<input type="password" id="before_pass" name="before_pass" class="form-control" required autofocus/><br/>
<label>새로운 비밀번호</label><br/>
<input type="password" id="new_pass" name="new_pass" class="form-control" required/><br/>
<label>새로운 비밀번호 확인</label><br/>
<input type="password" id="new_pass2" name="new_pass2" class="form-control" required/><br/>
<input type="hidden" name="id" value="${ id }"/>
</div>

<div id="container-btn">
<input type="submit" id="btn" name="btn" value="완료"/>
</div>
</form>
</div>

<!-- footer -->
<jsp:include page="/headerfooter/footer.jsp"/>
</div>

</body>
</html>