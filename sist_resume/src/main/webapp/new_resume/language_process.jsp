<%@page import="org.springframework.dao.DataAccessException"%>
<%@page import="new_resume.ResumeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="langVO" class="new_resume.LanguageVO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="langVO"/>
<script type="text/javascript">
<%
ResumeDAO rDAO = new ResumeDAO();

try {
	rDAO.updateLang(langVO);
%>
alert("저장되었습니다.");
<%
} catch(DataAccessException e) {
	e.printStackTrace();
%>
alert("저장에 실패하였습니다.");
<%
}
%>
location.href = "http://localhost/temp1_proj/new_resume/new_resume.jsp";
</script>