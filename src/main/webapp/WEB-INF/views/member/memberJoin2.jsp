<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<script>
	
	$(function(){
		fn_search();
	});
	
	
	function fn_search(){
		$('#mId').keyup(function(){
			var mId=$('#mId').val();
			$.ajax({
				url:'memberSearch.member?mId='+mId,
				type:'get',
				dataType: 'json',
				success: function(data){
					if (data.resultMap == 1) {
						alert('이미 등록되어있는 아이디 입니다');
					} else {
						var regExpID = /[a-zA-Z0-9]{6,16}$/;
						var result = document.getElementById('result');
						if(regExpID.test(mId)){
							result.textContent ='사용가능한 아이디입니다.';
							result.setAttribute('class', 'check-mId-result-ok');
							return true;
						}else{
							result.textContent = '사용이 불가능한 아이디입니다.';
							result.setAttribute('class', 'check-mId-result-not');
							return false;
						}
					}
				},
				error: function(){
					alert('실패');
				}
			});
		});
	}
		
	
	function mPw2Check(f){
		if(f.mPw1.value == f.mPw2.value){
			result.textContent ='비밀번호가 일치합니다.';
			result.setAttribute = ('class', 'check-mPw2-result-ok');
			return true;
		}else{
			result.textContent = '비밀번호가 일치하지 않습니다.';
			result.setAttribute = ('class', 'check-mPw1-result-not');
			return false;
		}
	}
	function mNick2Check(f){
		var Nick=f.mNick.value;
		var regExpNick = /[a-zA-Z0-9가-힣]{6,16}$/;
		var result3 = document.getElementByNick('result3');
	}
	function yearCheck(f){
		var year=f.year.value;
		var regExpYear=/[0-9]{4,4}$/;
	}
	
	
</script>

	
	<form method="post" action="memberInsert.do">
		<label for="mId">아이디</label><br/>
		<input type="text" name="mId" id="mId" /><br/>
		<div id="result" class="check-mId-result"></div>
		<br/><br/>
		
		<label for="mPw">비밀번호</label><br/>
		<input type="text" name="mPw1" id="mPw1" onblur="mPwCheck(this.form)"/><br/>
		<div id="result2" class="check-mPw1-result"></div>
		<br/><br/>
		
		<label for="mPw2">비밀번호 재확인</label><br/>
		<input type="text" name="mPw2" id="mPw2" onblur="mPw2Check(this.form)"/><br/>
		<div id="result2" class="check-mPw2-result"></div>
		<br/><br/>
		
		<label for="nicName">닉네임</label><br/>
		<input type="text" name="mNick" id="mPw2" onblur="mNickCheck(this.form)"/><br/>
		<input type="text" name="mNick" id="mNick"/><br/>
		<br/><br/>
		
		<label for="name">이름</label><br/>
		<input type="text" name="name" id="name"/><br/>
		<br/><br/>
		
		<label for="year">생년월일</label><br/>
		<input type="text" name="year" id="year" placeholder="년(4자) 예) 1984" onblur="yearCheck(this.form)"/>
		<input type="number" name="month" id="month" placeholder="월"/>
		<input type="text" name="day" id="day" placeholder ="일" onblur="dayCheck(this.form)"/><br/>
		<br/><br/>
		
		<label for="phone">휴대전화</label><br/>
		<input type="radio" name="country" id="country"/><br/>
		<input type="text" name="phone" id="phone" placeholder="선택입력" onblur="phoneCheck(this.form)"/><br/>
		<br/><br/>
		
		<label for="email">이메일</label><br/>
		<input type="text" name="email" id="email" onblur="emailCheck(this.form)"/><br/>
		<input type="text" name="" id=""/><br/>
		<br/><br/>
		
		<input type="text" name="" id=""/><br/>
		<br/><br/>
		
		
	</form>
	
	
<%@ include file="../template/footer.jsp" %>