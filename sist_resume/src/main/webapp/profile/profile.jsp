<%@page import="org.springframework.dao.DataAccessException"%>
<%@page import="profile.ProfileVO"%>
<%@page import="dao.MemberDAO"%>
<%@page import="profile.TechVO"%>
<%@page import="java.util.List"%>
<%@page import="profile.ProfileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
           <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/jsp/common_code.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">
<title><%= title %></title>

<style type="text/css">


div{
	text-align: center;
}

#all{
/* 	border: 1px solid #000000;  */
	width: 1400px; 
	height:1500px; 
	margin: 80px auto;
}

#Logo{
	width: 1400px;
	height: 130px;
	text-align:left;
/* 	background-color: #FFE08C; */
}

#navibar{
	width: 1400px;
	height: 10px;
	bottom: 0px;
	text-align: right;
}

#profile{
	border: 1px solid #000000; 
	width: 1000px; 
	height: 1100px; 
	margin: auto;
	position: relative;
/* 	background-color: #B7F0B1;	 */
}

#passCh{
	top: 50px;
	left: 750px;
	position: absolute;
}

#leave{
	top: 50px;
	left: 880px;
	position: absolute;
}

#img{
	top: 80px;
	left: 30px;
	position: absolute;
/* 	background-color: #D4F4FA; */
}

#profimg{
	border: none;
	width: 200px;
	height: 200px;
	top: 30px;
	left: 5px;
	position: absolute;
/* 	background-color: #FFE08C; */
}

#upfile{
	top: 230px;
	left: 5px;
	position: absolute;
}

#id1{
	top: 350px;
	left: 30px;
	position: absolute;
}

#gender1{
	top: 450px;
	left: 30px;
	position: absolute;
}

#tech_idx1{
	top: 550px;
	left: 30px;
	position: absolute;
}

#phone1{
	top: 650px;
	left: 30px;
	position: absolute;
}

#description1{
	top: 750px;
	left: 30px;
	position: absolute;
}

#url1{
	top: 850px;
	left: 30px;
	position: absolute;
}

#save{
	top: 1000px;
	left: 800px;
	position: absolute;
}

#footerline{
	border-bottom: 1px solid #454545; 
	width: 1400px;
}


#footer {
	width: 1400px;
	height: 180px;
	bottom: 0px;
	text-align:left;
/* 	background-color: #FFE08C; */
}

</style>
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
	 /* $(function(){
	
		$("#addSave").click(function(){
			
			let upfile=$("#upfile").val();
			
			//업로드가능 확장자의 유효성검증.
			//서버에서 실행되는 언어와 같은 소스코드는 업로드하지 못하도록 막아야 함.
			//이미지파일(jpg, png, gif, bmp)만 업로드할 수 있도록 검증.
			
			let fileExt = ["jpg","png","gif","bmp"];
			let fileFlag = false;
			
			let ext = (upfile.substring(upfile.lastIndexOf(".")+1)).toLowerCase();
			for( var i=0; i<fileExt.length; i++ ){
				if( ext == fileExt[i] ){
					fileFlag = true;
					break;
				}//end if
			}//end for
			
			if( !fileFlag ){
				alert("업로드 가능 확장자가 아닙니다.");
				return;
			}//end if
			
			$("#frm").submit();
			
		});//click
		
	});//ready */
	
function insert() {
			let upfile=$("#upfile").val();
			
			//업로드가능 확장자의 유효성검증.
			//서버에서 실행되는 언어와 같은 소스코드는 업로드하지 못하도록 막아야 함.
			//이미지파일(jpg, png, gif, bmp)만 업로드할 수 있도록 검증.
			
			let fileExt = ["jpg","png","gif","bmp"];
			let fileFlag = false;
			
			let ext = (upfile.substring(upfile.lastIndexOf(".")+1)).toLowerCase();
			for( var i=0; i<fileExt.length; i++ ){
				if( ext == fileExt[i] ){
					fileFlag = true;
					break;
				}//end if
			}//end for
			
			if( !fileFlag ){
				alert("업로드 가능 확장자가 아닙니다.");
				return;
			}//end if
			
			$("#frm").submit();
}//insert	

	// 이미지 업로드한 거 보이기
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#profimg').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
	
function update(id) {
	//업데이트
	//function updateData( id, i ){
		if( confirm(id+"님의 회원정보를 변경하시겠습니까?") ){
			
			//hidden form 에 존재하는 Control에 값 설정
			$("#update_phone").val($("#phone").val());
			$("#update_description").val($("#description").val());
			$("#update_url").val($("#url").val());
			$("#update_img").val($("#img").val());
			$("#update_tech_idx").val($("#tech_idx").val());
			
			$("#hiddenFrm").submit();
			
		}//end if
		
	//};//updateData
}//update	
</script>
</head>
<body>
<%
String id=(String)session.getAttribute("id");
ProfileVO pv=new ProfileVO();

String name="";
try{
name=new MemberDAO().selUserInfo(id).getName();
} catch(DataAccessException dae){
	response.sendRedirect("http://localhost/sist_resume/common/error/error.jsp");
} //end catch

ProfileDAO pd=new ProfileDAO();
boolean flag=false; //include
try{
pv=pd.selProfile(id);
flag=true; //update

pageContext.setAttribute("pv", pv);

}catch(DataAccessException se){
	/* out.print(se); */
}
pageContext.setAttribute("name", name);
%>
<div id="wrap">
<!-- header -->
<jsp:include page="/headerfooter/header.jsp"></jsp:include>
	<div id="all">
	
	<form id="frm" method="post" action="insert_proc.jsp">
		
	<div id="profile"><br/>
			<div id="passCh"><a href="http://localhost/sist_resume/login/change_password.jsp">비밀번호 변경</a></div>
			<div id="leave"><a href="http://localhost/sist_resume/login/leave.jsp">회원탈퇴</a></div>
				<div id="img">
					<div style="text-align: left;">* 프로필 이미지</div>
					
					<img id="profimg"><br/>
					<% if(flag){ %>
						<input type="file" name="img" id="upfile" onchange="readURL(this);"/><br/><br/>
						<c:out value="${ pv.img }"/>
						<%} else { %>
						<input type="file" name="img" id="upfile" onchange="readURL(this);"/><br/><br/>
						<%}//end else %>
			</div>

	<div id="id1">

		<div style="text-align: left;">* 이름</div>
		<input type="text" value="${ name }" class="form-control" 
				style="width: 150px; height: 40px; font-size: 15px;" readonly="readonly"/>		
		<input type="hidden" name="id" value="<%= id %>"/>
	</div>
	
	<div id="gender1">
		<div style="text-align: left;">* 성별</div>
		<% 
		String checkM="";
		String checkG="";
		if(flag){
			if(pv.getGender().equals("M")) {
				checkM=" checked='checked'";
			} else {
				checkG=" checked='checked'";
			} //end else
		}
			%>
		<input type="radio" name="gender" id="gender" value="M"<%= checkM %>/>남<br/>
		<input type="radio" name="gender" id="gender" value="G" <%= checkG %>/>여
	</div>
	
 	<div id="tech_idx1">
		<div style="text-align: left;">* 관심분야</div>
		<select name="tech_idx" id="tech_idx" class="form-control" style="width: 160px; height: 40px; font-size: 15px;">
			<option value="none">==== 선택 ====</option>
			<% 
			List<TechVO> tList=new ProfileDAO().selectTech();
			pageContext.setAttribute("tList", tList);
			
			String sel="";
			if(flag){
				sel="selected='selected'";
			} //end if
			%>
			<c:forEach var="tech" items="${ tList }">
			<c:if test="${ not empty pv.tech_idx and pv.tech_idx eq tech.idx }">
			<option value="${ tech.idx }"<%= sel %>><c:out value="${ tech.subject }"/></option>
			<% sel=""; %>
			</c:if>
			<option value="${ tech.idx }"<%= sel %>><c:out value="${ tech.subject }"/></option>
			</c:forEach>
		</select> 
	</div>
	
	<div id="phone1">
	
		<div style="text-align: left;">* 휴대폰 번호</div>
		<%
		String ph="";
		if(flag){
			ph=pv.getPhone();
		}
		%>
		<input type="text" name="phone" id="phone" class="form-control" Placeholder="핸드폰 번호를 입력하세요." value="<%= ph %>"
				style="width: 300px; height: 40px; font-size: 15px;"/>		
	</div>
	
	<div id="description1">
		<div style="text-align: left;">* 한 줄 소개</div>
		<%
		String desc="";
		if(flag){
			desc=pv.getDescription();
		}
		%>
		<input type="text" name="description" id="description" class="form-control" Placeholder="한 줄 소개를 해주세요." value="<%= desc %>"
				style="width: 500px; height: 40px; font-size: 15px;"/>		
	</div>
	
	<div id="url1">
	
		<div style="text-align: left;">* 홈페이지</div>
		<%
		String url1="";
		if(flag){
			url1=" value='"+pv.getUrl()+"'";
		}
		%>
		<input type="text" name="url" id="url" class="form-control" Placeholder="홈페이지를 입력하세요."<%= url1 %>
				style="width: 500px; height: 40px; font-size: 15px;"/>		
	</div>
	
	<div>
	
		<p id="save">
		<%
		String onclick="insert()";
		if(flag){
			onclick="update('"+id+"')";
		}
		%>
			<button type="button" class="btn btn-primary btn-lg" id="addSave"
				style="width: 150px;" onclick="<%= onclick %>">수정</button>
		</p>
	</div>
	
	</div><!-- profile --><br/>
	
	</form>
	</div>
	
	<form name="hiddenFrm" id="hiddenFrm" method="post" action="update_proc.jsp">
		<input type="hidden" name="id" value="${ id }"/> 
		<input type="hidden" name="phone" id="update_phone"/> 
		<input type="hidden" name="description" id="update_description"/> 
		<input type="hidden" name="url" id="update_url"/> 
		<input type="hidden" name="img" id="update_img"/> 
		<input type="hidden" name="tech_idx" id="update_tech_idx"/> 
	</form>
	<!-- footer -->
<jsp:include page="/headerfooter/footer.jsp"></jsp:include>
</div>
	<%-- <%
	request.setCharacterEncoding("UTF-8");
	%>
	<jsp:useBean id="pVO" class="profile.ProfileVO" scope="page"/>
	<jsp:setProperty property="*" name="pVO"/>

	<c:catch var="e">
	<%
	//DB작업
	ProfileDAO pDAO = new ProfileDAO();
	pDAO.insertProfile(pVO);//추가성공 예외
	%>
	<script type="text/javascript">
	alert("회원 정보를 수정하였습니다.");
	</script>
	<%
	pageContext.setAttribute("cnt", pDAO.updateProfile(pVO));
	
	session.setAttribute("gender", pVO.getGender());
	session.setAttribute("phone", pVO.getPhone());
	session.setAttribute("description", pVO.getDescription());
	session.setAttribute("url", pVO.getUrl());
	session.setAttribute("img", pVO.getImg());
	session.setAttribute("tech_idx", pVO.getTech_idx());
	
	String gender = (String)session.getAttribute("gender");
	String phone = (String)session.getAttribute("phone");
	String description = (String)session.getAttribute("description");
	String url = (String)session.getAttribute("url");
	String img = (String)session.getAttribute("img");
	Integer tech_idx = (Integer)session.getAttribute("tech_idx");
	%>
	<c:choose>
		<c:when test="${ cnt eq 0 }">
			<c:out value="${ param.id }"/>님은 존재하지 않습니다.
		</c:when>
		<c:otherwise>
			<c:out value="${ param.phone }"/>회원 정보를 변경하였습니다.
			<c:out value="${ param.description }"/>회원 정보를 변경하였습니다.
			<c:out value="${ param.url }"/>회원 정보를 변경하였습니다.
			<c:out value="${ param.img }"/>회원 정보를 변경하였습니다.
			<c:out value="${ param.tech_idx }"/>회원 정보를 변경하였습니다.
		</c:otherwise>
	</c:choose>
	<br/>

	</c:catch>
	<c:if test="${ not empty e }">
	<c:out value="${e}"/><br/>
	죄송합니다. 회원정보가 입력되지 않았습니다.
	잠시 후 다시 시도해주세요.
	</c:if> --%>
		
</body>
</html>