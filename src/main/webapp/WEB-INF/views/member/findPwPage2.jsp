<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../template/header.jsp" >
	<jsp:param value="아이디 찾기" name="title"/>
</jsp:include>

<link rel="stylesheet" href="resources/style/findPage.css">
<script>
	$(function(){
		$(".footer-wrap").css("background" , "white");
	});

	function fn_checkPassword(f) {
		if (f.newPassword.value == '') {
			alert('새 비밀번호를 입력하세요.');
			return;
		} else if(f.newPassword.value == f.newPassword2.value){
			f.action = 'changePw.member';
			f.submit();
		} else {
			alert('새 비밀번호와 비밀번호 확인이 일치하지 않습니다.');
			return;
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
			<form method="post">
				<table>
					<tbody>
						<tr>
							<td>새 비밀번호</td>
							<td>
								<input type="password" name="newPassword" placeholder="변경하실 비밀번호를 입력해주세요." />
							</td>
						</tr>
						<tr>
							<td>비밀번호 확인</td>
							<td>
								<input type="password" name="newPassword2" placeholder="비밀번호를 다시 입력해주세요." />
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="button" value="확인" onclick="fn_checkPassword(this.form)">
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</div>


<%@ include file="../template/footer.jsp" %>