<%@page import="java.util.List"%>
<%@page import="valueObject.JobListVO"%>
<%@page import="dao.JobPostDAO"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8" info="채용공고 목록"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>채용공고 목록</title>
<link rel="stylesheet" type="text/css" href="http://localhost/jsp_prj/common/css/main_v20211012.css"/>

<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<style type="text/css">

#container {height: 1000px;}

#job{ /* position: absolute; top: 120px; left: 390px; */ font-size: 25px; font-weight: bold; color: #333; width: 1100px; margin: 80px auto; }
#company{ position: absolute; top: 150px; left: 1100px; width: 200px; }
#interest{ position: absolute; top: 150px; left: 1310px; width: 200px; }
#comp1{ /* position: absolute; top: 250px; left: 500px; */ width: 450px; height: 130px; border: 1px solid #333;
	border-radius: 10px; float: left; margin: 5px 50px 5px 50px; }
/* #comp2{ position: absolute; top: 250px; left: 960px; width: 450px; height: 130px; border: 1px solid #333;
	border-radius: 10px; }
#comp3{ position: absolute; top: 390px; left: 500px; width: 450px; height: 130px; border: 1px solid #333;
	border-radius: 10px; }
#comp4{ position: absolute; top: 390px; left: 960px; width: 450px; height: 130px; border: 1px solid #333;
	border-radius: 10px; }
#comp5{ position: absolute; top: 530px; left: 500px; width: 450px; height: 130px; border: 1px solid #333;
	border-radius: 10px; }
#comp6{ position: absolute; top: 530px; left: 960px; width: 450px; height: 130px; border: 1px solid #333;
	border-radius: 10px; } */
#pagination{ /* position: absolute; top: 700px; left: 840px; */width: 1100px; margin: auto; }

/* #abs-wrap{ position: relative; } */
#mid{width: 1100px; margin: 100px auto;}
</style>

<!--jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script src="http://localhost/jsp_prj/common/bootstrap/holder.js"></script> 
<script src="http://localhost/jsp_prj/common/bootstrap/ie-emulation-modes-warning.js"></script>
<link href="http://localhost/jsp_prj/common/bootstrap/carousel.css" rel="stylesheet">

<script type="text/javascript">
</script>

</head>
<body>
<c:catch var="e">
<%
JobPostDAO jDAO=new JobPostDAO();
int blockPage=10;
int totData=jDAO.selCnt(); //전체 데이터 수
int LastPage=totData/blockPage; //가장 마지막 페이지
if(totData % blockPage > 0){
	++LastPage;
}
int numPerPage=10; //한 페이지에서 보여줄 데이터 수
int nowPage=1; //현재 페이지
try{
	nowPage=Integer.parseInt(request.getParameter("now"));
} catch (NumberFormatException nfe){
	nowPage=1;
}
int start=((nowPage-1)/blockPage)*10+1;
int end=start+blockPage-1;
if( end > LastPage ){
	end=LastPage;
}

int rowBegin=(nowPage-1)*numPerPage+1;
int rowEnd=nowPage*numPerPage;
List<JobListVO> list=jDAO.selAllTitle(rowBegin, rowEnd);

pageContext.setAttribute("start", start);
pageContext.setAttribute("end", end);
pageContext.setAttribute("nowPage", nowPage);
pageContext.setAttribute("blockPage", blockPage);
pageContext.setAttribute("jobList", list);
%>
	<div id="wrap">
	<!-- header -->
		<jsp:include page="/headerfooter/header.jsp"></jsp:include>
		<div id="container">
		<div id="abs-wrap">
			<div id="job">채용공고</div>
			<div id="company">
				<div class="input-group">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button">search</button>
					</span>
					<input type="text" class="form-control" placeholder="회사명">
				</div>
			</div>
			<div id="interest">
				<div class="input-group">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button">search</button>
					</span>
					<input type="text" class="form-control" placeholder="관심분야명">
				</div>
			</div>
			<div id="mid">
			<c:forEach var="list" items="${ jobList }">
			<div id="comp1">
				<a href="#void"><c:out value="${ list.idx }"/></a>
				<a href="#void"><c:out value="${ list.company }"/></a>
				<a href="#void"><c:out value="${ list.img }"/></a>
				<a href="#void"><c:out value="${ list.career }"/></a>
				<a href="#void"><c:out value="${ list.address }"/></a>
			</div>
			</c:forEach>
			</div>
			<!-- <div id="comp2"></div>
			<div id="comp3"></div>
			<div id="comp4"></div>
			<div id="comp5"></div>
			<div id="comp6"></div> -->
			<div style="text-align: center;">
				<nav id="pagination">
					<ul class="pagination">
						<li>
						<c:if test="${ nowPage ne 1 and param.now ne null }">
							<a href="http://localhost/sist_resume/job_post/job_post_a.jsp?now=${ nowPage-1 }" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</c:if>
						</li>
						<c:forEach var="i" begin="${ start }" end="${ end }">
						<li><a href="http://localhost/sist_resume/job_post/job_post_a.jsp?now=${ i }" <%-- onclick="page(${ i })" --%>><c:out value="${ i }"/></a></li>
						</c:forEach>
						<li>
						<% if(nowPage != LastPage){ %>
							<a href="http://localhost/sist_resume/job_post/job_post_a.jsp?now=${ nowPage+1 }" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
							<% } %>
						</li>
					</ul>
				</nav>
			</div>
			</div>
		</div>
		<!-- footer -->
		<jsp:include page="/headerfooter/footer.jsp"></jsp:include>
	</div>
	
	</c:catch>
<c:if test="${ not empty e }">
${ e }
죄송합니다. 해당 페이지에서 문제가 발생했습니다.<br/>
잠시후 다시 시도해주세요.
</c:if>
</body>
</html>