<%@page import="java.util.List"%>
<%@page import="kr.co.sist.user.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>이력서 및 채용공고</title>
<style type="text/css">
.wrap {
	margin-top: 80px;
	margin-bottom: 50px;
}

.login {
	padding: 10px;
	background-color: #EAEAEA;
	border: 1px solid #BDBDBD;
	text-align: center;
}

.contents {
	margin: 30px;
	height: 300px;
	background: rgb(255,255,255);
	background: linear-gradient(0deg, rgba(255,255,255,1) 0%, rgba(245,245,245,1) 100%);
	text-align: center;
	vertical-align: middle;
}

.link_login {
	display:block;
	background-color: #00D8FF;
	text-align: center;
	height: 50px;
	font-size: 14pt;
	font-weight: bold;
	color: #FFFFFF;
	text-decoration: none;
	border-radius: 2px;
    width:240px;
    line-height:30px;
    vertical-align: middle;
    padding-top: 10px;
}

.sub_area {
	margin-top: 20px;
}

.userInfo{
	background-color: #FFFFFF;
	padding: 10px;
}

.no1 {
}

.content_wrap {
}
</style>
<!--jQuery CDN-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">

</script>
</head>
<body>
	<%
	MemberDAO md=new MemberDAO();
	List<String> listNotice=md.selNoticeTitle();
	List<String> listJob=md.selJobPostTitle();
	pageContext.setAttribute("listNotice", listNotice);
	pageContext.setAttribute("listJob", listJob);
	%>
	<!-- header -->
	<jsp:include page="/headerfooter/header.jsp"/>
	
	<div class="container">
		<div class="wrap">
			<div class="row">
				<div class="col-md-3">
					<div class="login">
						<c:choose>
							<c:when test="${ empty sessionScope.id }">
								<a href="http://localhost/sist_resume/login/login_page.jsp" class="link_login">로그인</a>
								<div class="sub_area">
									<a href="http://localhost/sist_resume/login/find.jsp" class="link_look">아이디 비밀번호 찾기</a>
									 / 
									<a href="http://localhost/sist_resume/login/sign_up.jsp" class="link_join">회원가입</a>
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
								<div class="userInfo">
									<h3><%= iv.getName() %>님</h3>
									안녕하세요?
									<br>
										<div class="sub_area">
											<a href="http://localhost/sist_resume/login/logout.jsp">로그아웃</a>
											/
											<a href="http://localhost/sist_resume/new_profile/new_profile.jsp">내 프로필</a>
										</div>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="col-md-9">
					<div class="carousel_wrap">
						<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
							<!-- Indicators -->
						 	<ol class="carousel-indicators">
							    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
							    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
							    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
							    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
							    <li data-target="#carousel-example-generic" data-slide-to="4"></li>
							    <li data-target="#carousel-example-generic" data-slide-to="5"></li>
							    <li data-target="#carousel-example-generic" data-slide-to="6"></li>
							    <li data-target="#carousel-example-generic" data-slide-to="7"></li>
						  	</ol>
						  	
							<!-- Wrapper for slides -->
							<div class="carousel-inner" role="listbox">
								<div class="item active">
									<img src="http://localhost/sist_resume/common/images/carousel/a.png">
							    </div>
							    <div class="item">
							    	<img src="http://localhost/sist_resume/common/images/carousel/b.png">
							    </div>
							    <div class="item">
							    	<img src="http://localhost/sist_resume/common/images/carousel/c.jpeg">
							    </div>
							    <div class="item">
							    	<img src="http://localhost/sist_resume/common/images/carousel/d.png">
							    </div>
							    <div class="item">
							    	<img src="http://localhost/sist_resume/common/images/carousel/e.jpg">
							    </div>
							    <div class="item">
							    	<img src="http://localhost/sist_resume/common/images/carousel/f.png">
							    </div>
							    <div class="item">
							    	<img src="http://localhost/sist_resume/common/images/carousel/g.jpg">
							    </div>
							    <div class="item">
							    	<img src="http://localhost/sist_resume/common/images/carousel/h.png">
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
				</div>
			</div>
			<div class="contents no1">
				<div class="content_wrap">
					<div class="row">
						<div class="col-md-6">
							<h2>이력서를 작성해보세요</h2>
						</div>
						<div class="col-md-6">
							사진
						</div>
					</div>
				</div>
			</div>
			<div class="contents no1">
				<div class="content_wrap">
					<div class="row">
						<div class="col-md-6">
							사진
						</div>
						<div class="col-md-6">
							<h2>포트폴리오를 작성해보세요</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="/headerfooter/footer.jsp"/>
</body>
</html>