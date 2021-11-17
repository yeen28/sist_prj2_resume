<%@page import="kr.co.sist.profile.ProfileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
%>
	<jsp:useBean id="pVO" class="kr.co.sist.profile.ProfileVO" scope="page"/>
	<jsp:setProperty property="*" name="pVO"/>

	<c:catch var="e">
	<%
	//DB작업
	ProfileDAO pDAO = new ProfileDAO();
	pDAO.insertProfile(pVO);//추가성공 예외
	%>
	<script type="text/javascript">
	alert("회원 정보를 수정하였습니다.");
	location.href="javascript:history.back()";
	</script>
	</c:catch>
	<c:if test="${ not empty e }">
	<%-- <c:out value="${e}"/> --%>
	<c:redirect url="http://localhost/sist_resume/common/error/error.jsp"/>
	</c:if>