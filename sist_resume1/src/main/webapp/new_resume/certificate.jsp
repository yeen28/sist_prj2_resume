<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="row resume_card_header">
	<div class="resume_card_left col-md-4">
		<h4 class="card_title">수상 / 자격증</h4>
	</div>
	<div class="resume_card_right col-md-2 col-md-offset-6">
		<button class="btn btn-primary btn-lg" type="button"
			data-toggle="collapse" data-target="#certificate"
			aria-expanded="false" aria-controls="certificate">+ 추가</button>
	</div>
</div>
<div class="collapse" id="certificate">
	<div class="well resume_form">
		<form>
			<div class="form-group">
				<label for="cert_title">* 수상/자격명</label> <input type="text"
					class="form-control" id="cert_title" placeholder="ex) 정보처리기사">
			</div>
			<div class="form-group">
				<label>* 취득 년월</label>
				<div class="row">
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
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
							<option>9</option>
							<option>10</option>
							<option>11</option>
							<option>12</option>
						</select>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label>설명</label>
				<textarea class="form-control" rows="7"
					placeholder="수상/자격증에 관한 사항을 작성해주세요."></textarea>
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