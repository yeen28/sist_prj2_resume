<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    info="회원가입 완료 페이지"
%>
<%@ include file="/common/jsp/common_code.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title><%= title %></title>
<link rel="stylesheet" href="<%= protocol %><%= domain %><%= contextRoot %><%= common_css %>/sign_up.css"/>
</head>

<body>
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
</body>
</html>