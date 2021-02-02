<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<%-- 머리글 포함(파라미터(title)가 있으므로 동적 페이지 포함) --%>
<jsp:include page="../template/header.jsp" >
	<jsp:param value="아이디/비밀번호 찾기" name="title"/>
</jsp:include>

<link rel="stylesheet" href="resources/style/findPage.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script>
	$(function(){
		$(".footer-wrap").css("background" , "white");
	});
	/* css */
	/* $(document).ready(function(){
		if($('#findId:checked'.val() == 'checked')) {
			$('.tab-contents:first-of-type').css('display', 'block');
			$('hr').css("display", block);
		} else if($('#findPw:checked.val() == 'checked')) {
			$('.tab-contents:last-of-type').css('display', 'block');
			$('hr').css("display", block);
		}
	}); */
	
	function fn_findId(f){
		if (f.name.value == '') {
			alert('이름을 입력하세요.');
			f.name.focus();
			return;
		} else if (f.email.value == '') {
			alert('이메일을 입력하세요.');
			f.email.focus();
			return;
		} else if(f.domains.value == '') {
			alert('도메인을 입력하세요.');
			f.domains.focus();
			return;
		}
		f.action='findId.member';
		f.submit();
	}
	function fn_findPw(f){
		if (f.id.value == '') {
			alert('아이디를 입력하세요.');
			f.id.focus();
			return;
		} else if (f.name.value == '') {
			alert('이름을 입력하세요.');
			f.name.focus();
			return;
		} else if (f.email.value == '') {
			alert('이메일을 입력하세요.');
			f.email.focus();
			return;
		} else if(f.domains.value == '') {
			alert('도메인을 입력하세요.');
			f.domains.focus();
			return;
		}
		f.action='findPw.member';
		f.submit();
	}
	
	/* 아이디 찾기 결과 */
	if('${findIdResult}') { // findIdCommand에서 넘어왔으면
		if(${id eq null}) {
			alert('일치하는 정보가 없습니다.');
		} else {
			location.href='findIdPage.member?id=${id}';
		}
	}
	
	/* 비밀번호 찾기 결과 */
	if('${findPwResult}') {
		if(${no == 0}) {
			alert('일치하는 정보가 없습니다.');
		} else {
			location.href='findPwPage.member';
		}
	}
	
</script>
<div class="box">
	<div class="inner-box">
		<div class="main-aside">
			<form method="post">
				<input type="radio" name="tab" id="findId" checked="checked" />
				<input type="radio" name="tab" id="findPw" />
				<div class="tab-buttons">
					<label for="findId">아이디 찾기<hr></label>&nbsp;&nbsp;&nbsp;
					<label for="findPw">비밀번호 찾기<hr></label>
				</div>
				
				<!-- 아이디 찾기 -->
				<table class="tab-contents">
					<tbody>
						<tr>
							<td colspan="2">
								<input type="radio" name="grade" id="member" value="member" checked/>
								<label for="member">멤버&nbsp;</label>
								<input type="radio" name="grade" id="seller" value="seller" />
								<label for="seller">호스트&nbsp;</label><br/>
							</td>
						</tr>
						<tr class="name">
							<td class="nameBox">이름</td>
							<td>
								<input type="text" name="name" placeholder="이름" />
							</td>
						</tr>
						<tr class="email">
							<td class="emailBox">가입 이메일</td>
							<td>
								<input type="text" name="email" placeholder="이메일" />
								@
								<input type="text" name="domains" list="domains" placeholder="직접입력" />
								<datalist id="domains">
									<option value="naver.com" />
									<option value="nate.com" />
									<option value="google.com" />
								</datalist>
							</td>
						</tr>
						<tr class="button">
							<td colspan="2"><input type="button" value="아이디 찾기" onclick="fn_findId(this.form)"/></td>
						</tr>
					</tbody>
				</table>
			</form>
			<form method="post">
				<!-- 비밀번호 찾기 -->
				<table class="tab-contents">
					<tbody>
						<tr>
							<td colspan="2">
								<input type="radio" name="grade" id="member" value="member" checked="checked"/>
								<label for="member">멤버&nbsp;</label>
								<input type="radio" name="grade" id="seller" value="seller" />
								<label for="seller">호스트&nbsp;</label><br/>
							</td>
						</tr>
						<tr class="id">
							<td class="idBox">아이디</td>
							<td>
								<input type="text" name="id" placeholder="아이디" />
							</td>
						</tr>
						<tr class="name">
							<td class="nameBox">이름</td>
							<td>
								<input type="text" name="name" placeholder="이름" />
							</td>
						</tr>
						<tr class="email">
							<td class="emailBox">가입 이메일</td>
							<td>
								<input type="text" name="email" placeholder="이메일" />
								@
								<input type="text" name="domains" list="domains" placeholder="직접입력" />
								<datalist id="domains">
									<option value="naver.com" />
									<option value="nate.com" />
									<option value="google.com" />
								</datalist>
							</td>
						</tr>
						<tr class="button">
							<td colspan="3"><input type="button" value="비밀번호 찾기" onclick="fn_findPw(this.form)"/></td>
						</tr>
					</tbody>
				</table>
			</form>				
		</div>
	</div>
</div>

<%@ include file="../template/footer.jsp" %>