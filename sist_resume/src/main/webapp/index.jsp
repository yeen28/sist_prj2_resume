<%@page import="kr.co.sist.user.LoginVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.user.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	info="메인 페이지"
%>
<%@ include file="/common/jsp/common_code.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <% session.setAttribute("id", "android123"); %> --%>
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
MemberDAO md=new MemberDAO();
List<String> listNotice=md.selNoticeTitle();
List<String> listJob=md.selJobPostTitle();
pageContext.setAttribute("listNotice", listNotice);
pageContext.setAttribute("listJob", listJob);
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

List<String> listSub=md.selectSub(id);
List<String> listUrl=md.selectUrl(id);
List<String> listPhone=md.selectPhone(id);

iv.setEmail(md.selUserInfo(id).getEmail());
iv.setName(md.selUserInfo(id).getName());

pageContext.setAttribute("listSub", listSub);
pageContext.setAttribute("listUrl", listUrl);
pageContext.setAttribute("listPhone", listPhone);
%>
<div id="user">
  <h3><%= iv.getName() %></h3>
  <a href="http://localhost/sist_resume/login/logout.jsp">로그아웃</a>
  <br/><br/><br/>
  <table class="table table2">
  <tr>
    <td class="t-label" style="padding-left: 0;">전화번호</td>
    <td class="t-label">
  <c:forEach var="phone" items="${ listPhone }">
  <%-- <c:out value="${ phone }"/><br/> --%>
  ${ phone }<br/>
  </c:forEach>
	</td>
  </tr>
  <tr>
    <td class="t-label lab" style="padding-left: 0;">이메일</td>
    <td class="t-label t-content"><%= iv.getEmail() %></td>
  </tr>
  <tr>
    <td class="t-label lab" style="padding-left: 0;">관심분야</td>
    <td class="t-label t-content">
       <c:forEach var="sub" items="${ listSub }">
		<c:out value="${ sub }"/><br/>
	   </c:forEach>
	</td>
  </tr>
  <tr>
    <td class="t-label lab" style="padding-left: 0;">홈페이지</td>
    <td class="t-label t-content">
       <c:forEach var="url" items="${ listUrl }">
		<c:out value="${ url }"/><br/>
	   </c:forEach>
	</td>
  </tr>
  </table>
</div>
</c:otherwise>
</c:choose>
		</div>

		<div id="container_right">
				<!-- 채용공고 -->
				<div id="bottom-left" class="panel panel-default">
					<div class="panel-heading notice_subtitle">
						<span class="notice_subtitle_text">채용공고</span>&nbsp;&nbsp;&nbsp;&nbsp;
						<div id="moreView">
						<a href="http://localhost/sist_resume/new_job_post/job_post_list.jsp">
						<span id="moreView"><img src="http://localhost/sist_resume/common/images/icons/moreView.PNG" width="25px"/></span>
						</a>
						</div>
					</div>
				<div class="panel-body">
					<ul id="notice">
					<c:forEach var="job_post" items="${ listJob }">
						<li><a href="http://localhost/sist_resume/new_job_post/job_post_list.jsp"><c:out value="${ job_post }"/></a></li>
					</c:forEach>
					</ul>
					</div>
				</div>
				<!-- 공지사항 -->
				<div id="bottom-right" class="panel panel-default">
					<div class="panel-heading notice_subtitle">
						<span class="notice_subtitle_text">공지사항</span>&nbsp;&nbsp;&nbsp;&nbsp;
						<div id="moreView">
						<a href="http://localhost/sist_resume/new_notice/notice_list.jsp">
						<span id="moreView"><img src="http://localhost/sist_resume/common/images/icons/moreView.PNG" width="25px"/></span>
						</a>
						</div>
					</div>
				<div class="panel-body">
					<ul id="notice">
					<c:forEach var="notice" items="${ listNotice }">
						<li><a href="http://localhost/sist_resume/new_notice/notice_list.jsp"><c:out value="${ notice }"/></a></li>
					</c:forEach>
					</ul>
					</div>
				</div>

				<div class="blank"></div>
				
				<!-- 유튜브 추천 -->
				<div id="mid" style="clear: both;">
					<div class="subtitle">
						<span class="subtitle_text">유튜브 추천</span>
					</div>
					<div>
						<iframe width="500" height="280"
							src="https://www.youtube.com/embed/ThGbP9wgkz8"
							title="YouTube video player" frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen style="flot:left"></iframe>
						<iframe width="490" height="280" 
						src="https://www.youtube.com/embed/3H4umWD5bwI" 
						title="YouTube video player" frameborder="0" 
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
					</div>
				</div>
				
			</div>
		</div>

<!-- footer -->
<jsp:include page="/headerfooter/footer.jsp"/>
</div>
</body>
</html>