<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="아이디 찾기 실패"
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
<div id="find_wrap">
<!-- header -->
		<jsp:include page="/headerfooter/header.jsp"></jsp:include>

<div class="find_container">
<div class="find_img">
<img alt="find" src="<%= protocol %><%= domain %><%= contextRoot %><%= common_images %>/find.png">
</div>

<div class="container-mid result-mid">
<span>이름과 이메일을 확인해주세요.</span>
</div>

<div id="result-bottom">
<a class="btn" href="<%= protocol %><%= domain %><%= contextRoot %><%= login %>/find.jsp">확인</a>
</div>
</div>

<!-- footer -->
			<jsp:include page="/headerfooter/footer.jsp"></jsp:include>
</div>

</body>
</html>