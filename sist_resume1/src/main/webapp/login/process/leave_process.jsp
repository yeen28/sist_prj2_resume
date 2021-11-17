<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<jsp:useBean id="mVO" class="valueObject.MemberVO" scope="page"/>
<jsp:setProperty property="*" name="mVO"/>

<c:catch var="e">
<%
mVO.setPassword(DataEncrypt.messageDigest( "SHA-1", mVO.getPassword() ));
String pw=mVO.getPassword(); //암호화된 비밀번호

MemberDAO mDAO=new MemberDAO();
boolean flag = pw.equals(mDAO.selectPw(mVO));
if( flag ){
	mDAO.deleteMember(mVO);
	session.invalidate();
}//end if
pageContext.setAttribute("flag", flag);
%>
<c:choose>
<c:when test="${ flag }">
<div id=wrap>
<!-- header -->
<jsp:include page="/headerfooter/header.jsp"></jsp:include>

<div id="success_container_wrap">

<div id="success_container">
<div id="container_top">
<img alt="success" src="<%= protocol %><%= domain %><%= contextRoot %><%= common_images %>/registration.PNG"><br/>
<span>회원탈퇴가 <strong>완료되었습니다.</strong></span>
</div>

<div id="container_mid">
그동안 이용해주셔서 감사합니다.
</div>

<div id="container_bottom">
<a href="<%= protocol %><%= domain %><%= contextRoot %>/index.jsp" id="home">첫화면</a>
</div>
</div>

</div>

<!-- footer -->
<jsp:include page="/headerfooter/footer.jsp"></jsp:include>
</div>
</c:when>
<c:otherwise>
<script type="text/javascript">
alert("비밀번호가 일치하지 않습니다.");
location.href="javascript:history.back()";
</script>
</c:otherwise>
</c:choose>
</c:catch>

<c:if test="${ not empty e }">
죄송합니다. 회원탈퇴 중 문제가 발생했습니다.<br/>
잠시후 다시 시도해주세요.
<%-- ${ e } --%>
</c:if>

</body>
</html>