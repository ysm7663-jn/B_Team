<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../template/header.jsp" >
	<jsp:param value="아이디 찾기" name="title"/>
</jsp:include>

<link rel="stylesheet" href="resources/style/findPage.css">

<script>
	$(document).ready(function(){
		fn_findIdResult();
	});
	
	function fn_findIdResult(){
		if(${id eq null}) {
			location.href='findPage.member';
			alert('일치하는 정보가 없습니다.');
		} else {
			$('findIdResult').text('아이디: "' + ${id} + '"');
		}
	}
</script>
<div class="box">
	<div class="inner-box">
		<div class="main-aside">
			<input type="radio" name="tab" id="findId" checked />
			<input type="radio" name="tab" id="findPw" />
			<div class="tab-buttons">
				<label for="findId">아이디 찾기<hr></label>&nbsp;&nbsp;&nbsp;
				<label for="findPw">비밀번호 찾기<hr></label>
			</div>
			<div class="resultBox">
				<h3>아이디 찾기가 완료되었습니다.</h3>
				<div id="findIdResult"></div>
			</div>
			<input type="button" value="로그인" onclick="loginPage.member"/>
		</div>
	</div>
</div>

<%@ include file="../template/footer.jsp" %>