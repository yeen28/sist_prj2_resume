<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="row resume_card_header">
	<div class="resume_card_left col-md-4">
		<h4 class="card_title">업무 경험</h4>
	</div>
	<div class="resume_card_right col-md-2 col-md-offset-6">
		<button class="btn btn-primary btn-lg" type="button"
			data-toggle="collapse" data-target="#carrer" aria-expanded="false"
			aria-controls="carrer">+ 추가</button>
	</div>
</div>
<div class="collapse" id="carrer">
	<div class="well resume_form">
		<form>
			<div class="form-group">
				<label for="company_name">* 회사 이름</label> <input type="text"
					class="form-control" id="company_name" placeholder="ex) 삼성SDS">
			</div>
			<div class="form-group">
				<label for="task_name">* 직무</label> <input type="text"
					class="form-control" id="task_name" placeholder="ex) 프론트엔드 개발자">
			</div>
			<div class="form-group">
				<label for="work_period">* 근무 기간</label> <input type="text"
					class="form-control" id="work_period" placeholder="ex) 2년 3개월">
			</div>
			<div class="form-group">
				<label for="using_stack">사용 기술</label> <input type="text"
					class="form-control" id="using_stack"
					placeholder="ex) android, Java, ...">
			</div>
			<div class="form-group">
				<label for="career_description">업무 내용</label>
				<textarea class="form-control" id="career_description" rows="7"
					placeholder="업무 및 성과를 작성해주세요."></textarea>
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
