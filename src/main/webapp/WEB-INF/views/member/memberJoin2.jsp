<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<script>
	
	$(function(){
		fn_idCheck();
	});
	
	
	function fn_idCheck(){
		
		$('#m_id').blur(function(){
			
			var m_id = $('#m_id').val();
			var result = document.getElementById('result');
			
			$.ajax({
				url:'memberSearch.member?m_id='+m_id,
				type:'post',
				dataType:'json',
				success: function(data){
					if (data.resultMap == 1) {
						result.textContent ='이미 등록되어있는 아이디 입니다.';
						result.setAttribute('class', 'check-m_id-result-not2');
					} else {
						var regExpID = /[a-zA-Z0-9]{6,16}$/;
						if(regExpID.test(m_id)){
							result.textContent ='사용가능한 아이디입니다.';
							result.setAttribute('class', 'check-m_id-result-ok');
							return true;
						}else{
							result.textContent = '사용이 불가능한 아이디입니다.';
							result.setAttribute('class', 'check-m_id-result-not');
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
	
	function fn_pwCheck(f){
		var m_pw = $('#m_pw').val();
		var regExpPW = /[a-zA-Z0-9]{6,16}$/;
		var result2 = document.getElementByPw('result2');
		if(regExpPW.test(m_pw)){
			result2.textContent ='사용가능한 비밀번호입니다.';
			result2.setAttribute = ('class', 'check-m_pw1-result-ok');
			return true;
		}else{
			result2.textContent = '사용 불가능한 비밀번호입니다.';
			result2.setAttribute = ('class', 'check-m_pw1-result-not');
			return false;
		}
	}
	
	function fn_pwCheck2(f){
		var result3 = document.getElementByPw('result3');
		if(f.m_pw.value == f.m_pw2.value){
			result3.textContent ='비밀번호가 일치합니다.';
			result3.setAttribute = ('class', 'check-m_pw2-result-ok');
			return true;
		}else{
			result3.textContent = '비밀번호가 일치하지 않습니다.';
			result3.setAttribute = ('class', 'check-m_pw2-result-not');
			return false;
		}
	}
	
	function fn_nickCheck(f){
		var Nick=f.m_nick.value;
		var regExpNick = /[a-zA-Z0-9가-힣]{1,14}$/;
		var result4 = document.getElementByNick('result4');
		if(regExpNick.test(m_nick)){
			result4.textContent ='사용가능한 비밀번호입니다.';
			result4.setAttribute = ('class', 'check-m_nick-result-ok');
			return true;
		}else{
			result4.textContent = '사용 불가능한 비밀번호입니다.';
			result4.setAttribute = ('class', 'check-m_nick-result-not');
			return false;
		}
	}
	
	function yearCheck(f){
		var year=f.year.value;
		var regExpYear=/[0-9]{4,4}$/;
	}
	
	
</script>

	
	<form method="post" action="memberInsert.do">
	
		<label for="m_id">아이디</label><br/>
		<input type="text" name="m_id" id="m_id" /><br/>
		<div id="result" class="check-m_id-result"></div>
		<br/><br/>
	
		<label for="m_pw">비밀번호</label><br/>
		<input type="text" name="m_pw" id="m_pw" onblur="fn_pwCheck(this.form)"/><br/>
		<div id="result2" class="check-m_pw1-result"></div>
		<br/><br/>
	
		<label for="m_pw2">비밀번호 확인</label><br/>
		<input type="text" name="m_pw2" id="m_pw2" onblur="fn_pwCheck2(this.form)"/><br/>
		<div id="result3" class="check-m_pw2-result"></div>
		<br/><br/>
	
		<label for="m_nick">닉네임</label><br/>
		<input type="text" name="m_nick" id="m_nick" onblur="fn_nickCheck(this.form)"/><br/>
		<div id="result4" class="check-m_nick-result"></div>
		<br/><br/>
		
		<label for="m_name">이름</label><br/>
		<input type="text" name="m_name" id="m_name" /><br/>
		<div id="result5" class="check-m_name-result"></div>
		<br/><br/>
	
	
	
	
	</form>
	
	
	
	
<%@ include file="../template/footer.jsp" %>