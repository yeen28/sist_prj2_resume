<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 세션에 이름이 없음 -->
<%-- <c:if test="${ empty sessionScope.userName }">
	<c:redirect url="login_page.jsp"></c:redirect>
</c:if> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>이력서 작성</title>

<!--jQuery CDN-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="http://localhost/sist_resume/new_resume/new_resume.css">

<script type="text/javascript">

</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="/headerfooter/header.jsp"></jsp:include>
	<div class="container">
		<div class="resume_wrap">
			<div class="resume_head">
				<h2>내 프로필</h2>
			</div>
			<div class="row">
				<div class="col-md-3">
					<div class="resume_profile">
						<div class="resume_profile_info">
							<h1>
								<c:out value="${ userName }"></c:out>이름위치
							</h1>
						</div>
						<div>
							<img
								src="https://assets.materialup.com/uploads/b78ca002-cd6c-4f84-befb-c09dd9261025/preview.png"
								class="img-responsive img-circle" alt="이미지를 등록하세요">
						</div>
						<div class="resume_profile_info">
							<strong>전화번호 여기에</strong><br> <strong>이메일 여기에</strong>
						</div>
						<div class="resume_profile_info">
							<strong>선호기술 </strong>
						</div>
						<div class="resume_profile_info">
							<strong>내 홈페이지 URL </strong>
						</div>
					</div>
				</div>
				<div class="col-md-9">
					<div class="resume_body">
						<div class="resume_card">
							<jsp:include page="career.jsp"></jsp:include>
						</div>
						<div class="resume_card">
							<jsp:include page="education.jsp"></jsp:include>
						</div>
						<div class="resume_card">
							<jsp:include page="certificate.jsp"></jsp:include>
						</div>
						<div class="resume_card">
							<jsp:include page="language.jsp"></jsp:include>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="/headerfooter/footer.jsp"></jsp:include>
</body>
</html>