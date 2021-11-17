<%@page import="valueObject.LoginVO"%>
<%@page import="valueObject.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	info="메인 페이지"
%>
<%@ include file="/common/jsp/common_code.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=title%></title>
<link rel="stylesheet"
	href="<%=protocol%><%=domain%><%=contextRoot%><%=common_css%>/login_common.css"
	type="text/css" media="all" />
<link rel="stylesheet"
	href="<%=protocol%><%=domain%><%=contextRoot%><%= main %>/main_page.css"
	type="text/css" media="all" />

 <!--jQuery CDN-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>

<body>
<div id="main_wrap">
  <!-- header -->
  <jsp:include page="/headerfooter/header.jsp"/>

  <!-- container -->
  <div id="container">
    <div id="container_left">
    <!-- login -->
    <c:choose>
      <c:when test="${ empty sessionScope.member }">
      <div id="left_login">
      <div id="account" class="sc_login">
      <a href="<%=protocol%><%=domain%><%=contextRoot%><%=login%>/login_page.jsp" class="link_login">로그인</a>
      <div class="sub_area">
        <div class="look_box">
        <a href="<%=protocol%><%=domain%><%=contextRoot%><%=login%>/find.jsp" class="link_look">아이디</a>
<a href="<%=protocol%><%=domain%><%=contextRoot%><%=login%>/find.jsp" class="link_look">비밀번호찾기</a>
</div>
<a href="<%=protocol%><%=domain%><%=contextRoot%><%=login%>/sign_up.jsp" class="link_join">회원가입</a>
</div>
</div>
</div>
</c:when>
<c:otherwise>
<%
LoginVO lVO=(LoginVO)session.getAttribute("member");
String id=lVO.getId();
				
MemberDAO mDAO=new MemberDAO();
List<String> listSub=mDAO.selectSub(id);
List<String> listUrl=mDAO.selectUrl(id);
List<String> listPhone=mDAO.selectPhone(id);
pageContext.setAttribute("listSub", listSub);
pageContext.setAttribute("listUrl", listUrl);
pageContext.setAttribute("listPhone", listPhone);
%>
<div id="user">
  <h1>${ sessionScope.member.name }</h1>
  <a href="<%=protocol%><%=domain%><%=contextRoot%>/login/logout.jsp">로그아웃</a>
  <a href="<%=protocol%><%=domain%><%=contextRoot%>/profile/profile.jsp">마이페이지</a>
  <br/>
  <span class="glyphicon glyphicon-earphone" aria-hidden="true">&nbsp;
  <c:forEach var="phone" items="${ listPhone }">
  <c:out value="${ phone }"/><br/>
  </c:forEach>
  </span><br/>
  <span class="glyphicon glyphicon-envelope" aria-hidden="true">&nbsp;${ sessionScope.member.email }</span><br/>
  <br/>
  <div style="text-align: left">관심분야&nbsp;-
  <c:forEach var="sub" items="${ listSub }">
			<c:out value="${ sub }"/><br/>
			</c:forEach>
			</div><br/>
			<div style="text-align: left">홈페이지&nbsp;-
			<c:forEach var="url" items="${ listUrl }">
			<c:out value="${ url }"/><br/>
			</c:forEach>
			</div>
		</div>
		</c:otherwise>
		</c:choose>
		<!-- login 밑의 공간 -->
		<div id="ad"></div>
		</div>

		<div id="container_right">
		<!-- 채용프로그램 -->
			<div id="top">
				<div class="subtitle">
					<span class="subtitle_text">채용프로그램</span>
				</div>
				<!-- carousel -->
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						</ol>

						<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox">
							<div class="item active">
								<a href="#void">
									<img src="<%=protocol%><%=domain%><%=contextRoot%><%=common_images%>/carousel1.PNG" alt="first image">
								</a>
							</div>
							<div class="item">
								<a href="#void">
									<img src="<%=protocol%><%=domain%><%=contextRoot%><%=common_images%>/carousel2.PNG" alt="second image">
								</a>
							</div>
							<div class="item">
								<a href="#void">
									<img src="<%=protocol%><%=domain%><%=contextRoot%><%=common_images%>/carousel3.PNG" alt="third image">
								</a>
							</div>
						</div>
						<!-- Controls -->
						<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
							<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a>
						<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>
				<div class="blank"></div>
				<!-- 유튜브 추천 -->
				<div id="mid">
					<div class="subtitle">
						<span class="subtitle_text">유튜브 추천</span>
					</div>
					<div>
						<iframe width="1000" height="563"
							src="https://www.youtube.com/embed/ThGbP9wgkz8"
							title="YouTube video player" frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
					</div>
				</div>

				<!-- 공지사항 -->
				<div id="bottom">
					<div class="subtitle">
						<span class="subtitle_text">공지사항</span>&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="<%= protocol %><%= domain %><%= contextRoot %>/notice/notice_a.jsp"><span id="moreView">더보기</span></a>
					</div>
					<ul id="notice">
						<li><a href="<%= protocol %><%= domain %><%= contextRoot %>/notice/notice_a.jsp">공지입니다.</a></li>
					</ul>
				</div>
			</div>
		</div>

<!-- footer -->
<jsp:include page="/headerfooter/footer.jsp"/>
</div>
</body>
</html>