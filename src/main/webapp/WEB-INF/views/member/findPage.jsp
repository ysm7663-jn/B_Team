<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<%-- 머리글 포함(파라미터(title)가 있으므로 동적 페이지 포함) --%>
<jsp:include page="../template/header.jsp" >
	<jsp:param value="아이디/비밀번호 찾기" name="title"/>
</jsp:include>

<link rel="stylesheet" href="resources/style/findPage.css">
<script>
	$(document).ready(function(){
		$(".footer-wrap").css("background" , "white");
	});
	
	function fn_findId(f){
		f.action='';
		f.submit();
	}
	function fn_fn_findPw(f){
		f.action='';
		f.submit();
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
			
			<!-- 아이디 찾기 -->
			<table class="tab-contents">
				<tbody>
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
							<select>
								<option value="">직접 입력</option>
								<option value="naver.com">naver.com</option>
								<option value="nate.com">nate.com</option>
								<option value="google.com">google.com</option>
							</select>
						</td>
					</tr>
					<tr class="button">
						<td colspan="2"><input type="button" value="아이디 찾기" onclick="fn_findId(this.form)"/></td>
					</tr>
				</tbody>
			</table>
			
			
			<!-- 비밀번호 찾기 -->
			<table class="tab-contents">
				<tbody>
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
							<select>
								<option value="">직접 입력</option>
								<option value="naver.com">naver.com</option>
								<option value="nate.com">nate.com</option>
								<option value="google.com">google.com</option>
							</select>
						</td>
					</tr>
					<tr class="button">
						<td colspan="3"><input type="button" value="비밀번호 찾기" onclick="fn_findPw(this.form)"/></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

<%@ include file="../template/footer.jsp" %>