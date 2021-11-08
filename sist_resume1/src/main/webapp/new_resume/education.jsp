<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="row resume_card_header">
	<div class="resume_card_left col-md-4">
		<h4 class="card_title">학력</h4>
	</div>
	<div class="resume_card_right col-md-2 col-md-offset-6">
		<button class="btn btn-primary btn-lg" type="button"
			data-toggle="collapse" data-target="#education" aria-expanded="false"
			aria-controls="education">+ 추가</button>
	</div>
</div>
<div class="collapse" id="education">
	<div class="well resume_form">
		<form>
			<div class="form-group">
				<label for="edu_univ_name">* 학교명</label> <input type="text"
					class="form-control" id="edu_univ_name" placeholder="ex) 남서울대학교">
			</div>
			<div class="form-group">
				<label for="edu_major">* 전공</label> <input type="text"
					class="form-control" id="edu_major" placeholder="ex) 컴퓨터소프트웨어학과">
			</div>
			<div class="form-group">
				<label for="edu_degree">* 학위</label> <input type="text"
					class="form-control" id="edu_degree" placeholder="ex) 학사">
			</div>
			<div class="form-group">
				<label for="eedu_nt">입학년도</label>
				<div class="row" id="edu_ent">
					<div class="col-xs-2">
						<select class="form-control">
							<option>2017</option>
							<option>2018</option>
							<option>2019</option>
							<option>2020</option>
							<option>2021</option>
						</select>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="edu_grad">졸업(예정) 년월</label>
				<div class="row" id="edu_grad">
					<div class="col-xs-2">
						<select class="form-control">
							<option>2017</option>
							<option>2018</option>
							<option>2019</option>
							<option>2020</option>
							<option>2021</option>
						</select>
					</div>
					<div class="col-xs-2">
						<select class="form-control">
							<option>2</option>
							<option>8</option>
						</select>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="edu_score">내 학점 / 최대학점</label>
				<div class="row" id="edu_score">
					<div class="col-xs-2">
						<input type="number" class="form-control" placeholder="3.9"
							step="0.1">
					</div>
					<div class="col-xs-2">
						<select class="form-control">
							<option>4.5</option>
							<option>4.3</option>
						</select>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="edu_description">기타 내용</label>
				<textarea class="form-control" id="edu_description" rows="7"
					placeholder="기타 학력사항을 작성해주세요."></textarea>
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
