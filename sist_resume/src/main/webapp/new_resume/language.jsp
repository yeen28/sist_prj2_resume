<%@page import="org.springframework.dao.DataAccessException"%>
<%@page import="kr.co.sist.resume.LanguageVO"%>
<%@page import="kr.co.sist.resume.ResumeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String id = (String) session.getAttribute("id");

ResumeDAO rDAO = new ResumeDAO();

try {
	LanguageVO langVO = rDAO.selectLang(id);
	pageContext.setAttribute("langVO", langVO);
} catch (DataAccessException e) {
	e.printStackTrace();
}
%>
<div class="row resume_card_header">
	<div class="resume_card_left col-md-4">
		<h4 class="card_title">외국어</h4>
	</div>
	<div class="resume_card_right col-md-2 col-md-offset-6">
		<button class="btn btn-primary btn-lg" type="button"
			data-toggle="collapse" data-target="#language" aria-expanded="false"
			aria-controls="language">+ 상세</button>
	</div>
</div>
<div>
	<div class="selected_data">
		<h4>${ langVO.exam_title }</h4>
		<h5>${ langVO.score }</h5>
	</div>
	<div class="collapse" id="language">
		<div class="well resume_form">
			<form id="lang_frm" action="language_process.jsp" method="post">
				<div class="form-group">
					<label for="lang_name">* 외국어명</label> <input type="text"
						class="form-control" id="lang_name" placeholder="ex) 영어" name="lang" value="${langVO.lang}">
				</div>
				<div class="form-group">
					<label for="name">* 시험 이름</label> <input type="text"
						class="form-control" id="exam_title" placeholder="ex) TOEIC" name="exam_title" value="${langVO.exam_title}">
				</div>
				<div class="form-group">
					<label for="ework_period">* 점수</label> <input type="text"
						class="form-control" id="lang_score" placeholder="ex) 870" name="score" value="${langVO.score}">
				</div>
				<input type="hidden" name="id" value="<%=id%>">
				<input type="hidden" name="idx" value="${ langVO.idx }">
			</form>
		</div>
		<div class="row">
			<div class="col-md-2 col-md-offset-4">
				<button type="button" class="btn btn-success btn-lg" id="save_lang">저장</button>
			</div>
			<div class="col-md-2">
				<button type="button" class="btn btn-default btn-lg" id="reset_lang">삭제</button>
			</div>
		</div>
		<form id="remove_lang" action="remove_process.jsp" method="post">
			<input type="hidden" name="table" value="language">
			<input type="hidden" name="idx" id="lang_idx" value="${ langVO.idx }">
		</form>
	</div>
</div>
