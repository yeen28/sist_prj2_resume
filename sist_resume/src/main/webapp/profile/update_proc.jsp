<%@page import="org.springframework.dao.DataAccessException"%>
<%@page import="kr.co.sist.profile.ProfileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="pVO" class="kr.co.sist.profile.ProfileVO" scope="page"/>
<jsp:setProperty property="*" name="pVO"/>

<script type="text/javascript">
<%
ProfileDAO pDAO = new ProfileDAO();
try{
	pDAO.updateProfile(pVO);
%>
alert("회원정보가 수정되었습니다");
location.href="javascript:history.back()";
<%} catch (DataAccessException dae){ %>
	<%-- ${e} --%>
location.href="http://localhost/sist_resume/common/error/error.jsp";
<%}%>
</script>	