<%@page import="org.springframework.dao.DataAccessException"%>
<%@page import="new_resume.CertificateVO"%>
<%@page import="new_resume.ResumeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String id = (String) session.getAttribute("id");

ResumeDAO rDAO = new ResumeDAO();

try {
	CertificateVO certVO = rDAO.selectCert(id);
	pageContext.setAttribute("certVO", certVO);
} catch (DataAccessException e) {
	e.printStackTrace();
}
%>

<div class="row resume_card_header">
	<div class="resume_card_left col-md-4">
		<h4 class="card_title">수상 / 자격증</h4>
	</div>
	<div class="resume_card_right col-md-2 col-md-offset-6">
		<button class="btn btn-primary btn-lg" type="button"
			data-toggle="collapse" data-target="#certificate"
			aria-expanded="false" aria-controls="certificate">+ 상세</button>
	</div>
</div>
<div>

	<div class="selected_data">
		<h4>${ certVO.title }</h4>
	</div>

	<div class="collapse" id="certificate">
		<div class="well resume_form">

			<form id="cert_frm" action="certificate_process.jsp" method="post">
				<div class="form-group">
					<label for="cert_title">* 수상/자격명</label> <input type="text"
						class="form-control" id="cert_title" placeholder="ex) 정보처리기사"
						name="title" value="${certVO.title}">
				</div>
				<div class="form-group">
					<label>* 취득 년월</label> <input type="month" name="get_date"
						value="${certVO.get_date}">
				</div>
				<div class="form-group">
					<label>설명</label>
					<textarea class="form-control" rows="7"
						placeholder="수상/자격증에 관한 사항을 작성해주세요." name="description">${certVO.description}</textarea>
				</div>
				<input type="hidden" name="id" value="<%=id%>"> <input
					type="hidden" name="idx" value="${certVO.idx}">
			</form>

		</div>
		<div class="row">
			<div class="col-md-2 col-md-offset-4">
				<button type="button" class="btn btn-success btn-lg" id="save_cert">저장</button>
			</div>
			<div class="col-md-2">
				<button type="button" class="btn btn-default btn-lg" id="reset_cert">삭제</button>
			</div>
		</div>
		<form id="remove_cert" action="remove_process.jsp" method="post">
			<input type="hidden" name="table" value="certificate"> <input
				type="hidden" name="idx" id="cert_idx" value="${ certVO.idx }">
		</form>
	</div>
</div>