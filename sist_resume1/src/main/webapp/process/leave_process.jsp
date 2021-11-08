<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/jsp/common_code.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%= title %></title>

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
mVO.setPassword(DataEncrypt.messageDigest( "MD5", mVO.getPassword() ));
String pw=mVO.getPassword();

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
<c:redirect url="../login/leave_success.jsp"/>
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