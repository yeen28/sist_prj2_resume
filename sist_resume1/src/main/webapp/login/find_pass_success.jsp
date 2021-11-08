<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="dao.MemberDAO"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="비밀번호 찾기 성공"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/jsp/common_code.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= title %></title>
<link rel="stylesheet" href="<%= protocol %><%= domain %><%= contextRoot %><%= common_css %>/find.css"/>
</head>

<body>
<%
String id=(String)session.getAttribute("user_id");
String name=(String)session.getAttribute("user_name");
/* String pw=(String)session.getAttribute("user_pw"); */

String pw = "";
for(int i=0; pw.length()<8; i++) {
	int rand = (int) (Math.random() * 75) + 48;
	if (rand < 58 || (rand > 64 && rand < 91) || rand > 96) { // 숫자, 대문자, 소문자
		pw += (char) rand;
	} else continue;
}//end while
pageContext.setAttribute("id", id);
pageContext.setAttribute("pw", pw);
%>
<jsp:useBean id="uVO" class="valueObject.UpdatePwdVO" scope="page"/>
<jsp:setProperty property="id" name="uVO" value="${ id }"/>
<jsp:setProperty property="new_pass" name="uVO" value="${ pw }"/>

<div id="find_wrap">
<!-- header -->
<jsp:include page="/headerfooter/header.jsp"></jsp:include>

<div class="find_container">
<div class="find_img">
<img alt="find" src="<%= protocol %><%= domain %><%= contextRoot %><%= common_images %>/find.png">
</div>

<div class="container-mid result-mid">
<span><strong><%= name %></strong>님의 임시비밀번호입니다.<br/>
임시비밀번호 : <strong><c:out value="${ pw }"/></strong></span>
</div>

<div id="result-bottom">
<a class="btn" href="<%= protocol %><%= domain %><%= contextRoot %><%= login %>/login_page.jsp">로그인</a>
</div>
</div>

<!-- footer -->
<jsp:include page="/headerfooter/footer.jsp"></jsp:include>
</div>

<%
uVO.setNew_pass(DataEncrypt.messageDigest( "MD5", uVO.getNew_pass() ));

MemberDAO mDAO=new MemberDAO();
mDAO.updatePw(uVO);
%>
</body>
</html>