<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="회원가입 처리"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/jsp/common_code.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%= title %></title>
<link rel="stylesheet" href="<%= protocol %><%= domain %><%= contextRoot %><%= common_css %>/sign_up.css"/>

<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<%
  request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="mVO" class="valueObject.MemberVO" scope="page"/>
<jsp:setProperty property="*" name="mVO"/>

<c:catch var="e">
<%
mVO.setPassword(DataEncrypt.messageDigest( "SHA-1", mVO.getPassword() ));
MemberDAO mDAO=new MemberDAO();
mDAO.insertMember(mVO);
%>
<div id="wrap">
<!-- header -->
<jsp:include page="/headerfooter/header.jsp"></jsp:include>

<div id="success_container">
<div id="success_top">
<img alt="success" src="<%= protocol %><%= domain %><%= contextRoot %><%= common_images %>/registration.PNG"><br/>
<span>회원가입이 <strong>완료</strong>되었습니다.</span><br/>
<span>님 환영합니다.</span>
</div>
<hr/>
<div id="container_bottom">
<a href="<%= protocol %><%= domain %><%= contextRoot %>/index.jsp" id="home">홈으로</a>
<a href="<%= protocol %><%= domain %><%= contextRoot %><%= login %>/login_page.jsp" id="login">로그인</a>
</div>
</div>

<!-- footer -->
<jsp:include page="/headerfooter/footer.jsp"></jsp:include>
</div>
</c:catch>

<c:if test="${ not empty e }">
죄송합니다. 회원가입 중 문제가 발생했습니다.<br/>
잠시후 다시 실행해주세요.
</c:if>

</body>
</html>