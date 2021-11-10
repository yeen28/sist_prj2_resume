<%@page import="dao.MemberDAO"%>
<%@page import="valueObject.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="비밀번호 변경 처리"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>

<body>
<c:catch var="e">
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="uVO" class="valueObject.UpdatePwdVO" scope="page"/>
<jsp:setProperty property="*" name="uVO"/>
<%
String beforePw=(DataEncrypt.messageDigest( "MD5", request.getParameter("before_pass") ));
String newPw=(DataEncrypt.messageDigest( "MD5", request.getParameter("new_pass") ));
String newPw2=(DataEncrypt.messageDigest( "MD5", request.getParameter("new_pass2") ));
String msg="비밀번호를 다시 확인해주세요.";
String url="javascript:history.back()";

/* 입력한 비밀번호와 로그인한 아이디가 맞는지 확인 */
MemberDAO mDAO=new MemberDAO();
String dbPw=mDAO.selectPw( uVO );

if(beforePw.equals(dbPw) && newPw.equals(newPw2)){
	mDAO.updatePw(uVO);
	msg="비밀번호를 변경했습니다.";
	url="http://localhost/sist_resume/profile/profile.jsp"; /* 마이페이지로 이동 */
}//end if

pageContext.setAttribute("msg", msg);
pageContext.setAttribute("url", url);
%>

<script type="text/javascript">
alert( "${ msg }" );
location.href="${ url }";
</script>
</c:catch>

<c:if test="${ not empty e }">
<script type="text/javascript">
alter("비밀번호를 틀렸습니다.");
location.href="javascript:history.back()";
</script>
<%-- <span style="color:#FF0000">세션에 있는 아이디로 회원정보 찾던 중 문제발생!!</span> --%>
</c:if>

</body>
</html>