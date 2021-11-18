<%@page import="kr.co.sist.user.LoginVO"%>
<%@page import="kr.co.sist.user.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.user.MemberDAO"%>
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

 <!--jQuery CDN-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="http://localhost/sist_resume/common/css/login_common.css" type="text/css" media="all" />
<link rel="stylesheet" href="http://localhost/sist_resume/main_index/main_page.css" type="text/css" media="all" />

</head>

<body>
<%
MemberDAO mDAO=new MemberDAO();
List<String> listNotice=mDAO.selNoticeTitle();
pageContext.setAttribute("listNotice", listNotice);
%>
<div id="main_wrap">
  <!-- header -->
  <jsp:include page="/headerfooter/header.jsp"/>

  <!-- container -->
  <div id="container">
    <div id="container_left">
    <!-- login -->
    <c:choose>
      <c:when test="${ empty sessionScope.id }">
      <div id="left_login">
      <div id="account" class="sc_login">
      <a href="http://localhost/sist_resume/login/login_page.jsp" class="link_login">로그인</a>
      <div class="sub_area">
        <div class="look_box">
        <a href="http://localhost/sist_resume/login/find.jsp" class="link_look">아이디</a>
<a href="http://localhost/sist_resume/login/find.jsp" class="link_look">비밀번호찾기</a>
</div>
<a href="http://localhost/sist_resume/login/sign_up.jsp" class="link_join">회원가입</a>
</div>
</div>
</div>
</c:when>
<c:otherwise>
<jsp:useBean id="iv" class="kr.co.sist.user.IndexVO"/>
<%
String id=(String)session.getAttribute("id");

List<String> listSub=mDAO.selectSub(id);
List<String> listUrl=mDAO.selectUrl(id);
List<String> listPhone=mDAO.selectPhone(id);

iv.setEmail(mDAO.selUserInfo(id).getEmail());
iv.setName(mDAO.selUserInfo(id).getName());

pageContext.setAttribute("listSub", listSub);
pageContext.setAttribute("listUrl", listUrl);
pageContext.setAttribute("listPhone", listPhone);
%>
<div id="user">
  <h3><%= iv.getName() %></h3>
  <a href="http://localhost/sist_resume/login/logout.jsp">로그아웃</a>
  <a href="http://localhost/sist_resume/profile/profile.jsp">마이페이지</a>
  <br/><br/><br/>
  <table class="table">
  <tr>
    <td class="t-label"><span class="glyphicon glyphicon-earphone" aria-hidden="true">전화번호</span></td>
    <td class="t-label">
  <c:forEach var="phone" items="${ listPhone }">
  <c:out value="${ phone }"/><br/>
  </c:forEach>
	</td>
  </tr>
  <tr>
    <td class="t-label"><span class="glyphicon glyphicon-envelope" aria-hidden="true">이메일</span></td>
    <td class="t-label"><%= iv.getEmail() %></td>
  </tr>
  <tr>
    <td class="t-label">관심분야</td>
    <td class="t-label">
       <c:forEach var="sub" items="${ listSub }">
		<c:out value="${ sub }"/><br/>
	   </c:forEach>
	</td>
  </tr>
  <tr>
    <td class="t-label">홈페이지</td>
    <td class="t-label">
       <c:forEach var="url" items="${ listUrl }">
		<c:out value="${ url }"/><br/>
	   </c:forEach>
	</td>
  </tr>
  </table>
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
									<img src="http://localhost/sist_resume/common/images/carousel1.PNG" alt="first image">
								</a>
							</div>
							<div class="item">
								<a href="#void">
									<img src="http://localhost/sist_resume/common/images/carousel2.PNG" alt="second image">
								</a>
							</div>
							<div class="item">
								<a href="#void">
									<img src="http://localhost/sist_resume/common/images/carousel3.PNG" alt="third image">
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
						<iframe width="500" height="281"
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
						<a href="http://localhost/sist_resume/new_notice/notice_list.jsp"><span id="moreView">더보기</span></a>
					</div>
					<ul id="notice">
					<c:forEach var="notice" items="${ listNotice }">
						<li><a href="http://localhost/sist_resume/new_notice/notice_list.jsp"><c:out value="${ notice }"/></a></li>
					</c:forEach>
					</ul>
				</div>
			</div>
		</div>

<!-- footer -->
<jsp:include page="/headerfooter/footer.jsp"/>
</div>
</body>
</html>