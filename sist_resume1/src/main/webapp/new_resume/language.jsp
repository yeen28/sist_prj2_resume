<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="row resume_card_header">
	<div class="resume_card_left col-md-4">
		<h4 class="card_title">외국어</h4>
	</div>
	<div class="resume_card_right col-md-2 col-md-offset-6">
		<button class="btn btn-primary btn-lg" type="button"
			data-toggle="collapse" data-target="#language" aria-expanded="false"
			aria-controls="language">+ 추가</button>
	</div>
</div>
<div class="collapse" id="language">
	<div class="well resume_form">
		<form>
			<div class="form-group">
				<label for="lang_name">* 외국어명</label> <input type="text"
					class="form-control" id="lang_name" placeholder="ex) 영어">
			</div>
			<div class="form-group">
				<label for="name">* 시험 이름</label> <input type="text"
					class="form-control" id="task_name" placeholder="ex) TOEIC">
			</div>
			<div class="form-group">
				<label for="ework_period">* 점수</label> <input type="text"
					class="form-control" id="work_period" placeholder="ex) 870">
			</div>
		</form>
	</div>
	<div class="row">
		<div class="col-md-2 col-md-offset-4">
			<button type="button" class="btn btn-success btn-lg">저장</button>
		</div>
		<div class="col-md-2">
			<button type="button" class="btn btn-default btn-lg">취소</button>
		</div>
	</div>
</div>
