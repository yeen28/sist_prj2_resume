<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    info="회원탈퇴 완료 페이지"
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

</body>
</html>