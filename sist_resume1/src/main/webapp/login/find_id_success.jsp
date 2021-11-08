<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="아이디 찾기 성공"
    %>
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
String name=(String)session.getAttribute("user_name");
String id=(String)session.getAttribute("user_id");
%>
<div id="find_wrap">
<!-- header -->
		<jsp:include page="/headerfooter/header.jsp"></jsp:include>

<div class="find_container">

<div class="find_img">
<img alt="find" src="<%= protocol %><%= domain %><%= contextRoot %><%= common_images %>/find.png">
</div>

<div class="container-mid result-mid">
<span><strong><%= name %></strong>님의 아이디입니다.<br/>
아이디 : <strong><%= id %></strong></span>
</div>

<div id="result-bottom">
<a class="btn" href="<%= protocol %><%= domain %><%= contextRoot %><%= login %>/login_page.jsp">로그인</a>
</div>
</div>

<!-- footer -->
			<jsp:include page="/headerfooter/footer.jsp"></jsp:include>
</div>

</body>
</html>