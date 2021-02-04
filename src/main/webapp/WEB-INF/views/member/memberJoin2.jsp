<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<script>
	
	$(function(){
		fn_idCheck();
		fn_pwCheck();
		fn_pwCheck2();
		fn_nickCheck();
		fn_nameCheck();
		fn_birthCheck();
		fn_emailCheck();
		fn_emailAuth1();
		fn_emailAuth2();
	});
	
	
	function fn_idCheck(){
		
		$('#m_id').blur(function(){
			
			var m_id = $('#m_id').val();
			
			$.ajax({
				url:'memberSearch.member?m_id='+m_id,
				type:'post',
				dataType:'json',
				success: function(data){
					var regExpID = /[a-zA-Z0-9]{6,16}$/;
					var result = document.getElementById('result');
					if (data.resultMap == 1) {
						result.textContent ='이미 등록되어있는 아이디 입니다.';
						result.setAttribute('class', 'check-m_id-result-not2');
						return false;
					} else {
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
	
	function fn_pwCheck(){
	
		$('#m_pw').blur(function(){
			var m_pw = $('#m_pw').val();
			var regExpPW = /[a-zA-Z0-9]{6,16}$/;
			var result2 = document.getElementById('result2');
			if(regExpPW.test(m_pw)){
				result2.textContent ='사용가능한 비밀번호입니다.';
				result2.setAttribute = ('class', 'check-m_pw1-result-ok');
				return true;
			}else{
				result2.textContent = '사용 불가능한 비밀번호입니다.';
				result2.setAttribute = ('class', 'check-m_pw1-result-not');
				return false;
			}
		});
	}
	
	function fn_pwCheck2(){
		$('#m_pw2').blur(function(){
			var m_pw = $('#m_pw').val();
			var m_pw2 = $('#m_pw2').val();
			var result3 = document.getElementById('result3');
			if(m_pw == m_pw2){
				result3.textContent ='비밀번호가 일치합니다.';
				result3.setAttribute = ('class', 'check-m_pw2-result-ok');
				return true;
			}else{
				result3.textContent = '비밀번호가 일치하지 않습니다.';
				result3.setAttribute = ('class', 'check-m_pw2-result-not');
				return false;
			}
		});
	}
	
	function fn_nickCheck(){
		$('#m_nick').blur(function(){
			var m_nick=$('#m_nick').val();
			$.ajax({
				url:'memberNickSearch.member?m_nick='+m_nick,
				type:'post',
				dataType:'json',
				success: function(data){
					var regExpNick = /[a-zA-Z0-9가-힣]{1,14}$/;
					var result4 = document.getElementById('result4');
					if (data.resultMap2 == 1) {
						result4.textContent ='이미 등록되어있는 닉네임 입니다.';
						result4.setAttribute('class', 'check-m_nick-result-not2');
						return false;
					}else{
						if(regExpNick.test(m_nick)){
						result4.textContent ='사용가능한 닉네임입니다.';
						result4.setAttribute = ('class', 'check-m_nick-result-ok');
						return true;
						}else{
						result4.textContent = '사용 불가능한 닉네임입니다.';
						result4.setAttribute = ('class', 'check-m_nick-result-not');
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
	
	function fn_nameCheck(){
		
		$('#m_name').blur(function(){
			var m_name = $('#m_name').val();
			var regExpNAME = /[가-힣]{1,16}$/;
			var result5 = document.getElementById('result5');
			if(regExpNAME.test(m_name)){
				result5.textContent ='정상적인 이름입니다.';
				result5.setAttribute = ('class', 'check-m_name-result-ok');
				return true;
			}else{
				result5.textContent = '제대로 입력하셨는지 다시한번 확인해 주세요.';
				result5.setAttribute = ('class', 'check-m_name-result-not');
				return false;
			}
		});
	}
	
	function fn_birthCheck(){
		
		$('#m_birth').blur(function(){
			var m_birth = $('#m_birth').val();
			var regExpYEAR = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
			var result6 = document.getElementById('result6');
			if(regExpYEAR.test(m_birth)){
				result6.textContent = '';
				result6.setAttribute = ('class', 'check-m_birth-result-not');
				return true;
			}else{
				result6.textContent = '제대로 입력하셨는지 다시한번 확인해 주세요.';
				result6.setAttribute = ('class', 'check-m_birth-result-not');
				return false;
			}
		});
	}
	
	function fn_emailCheck(){
		
		$('#m_email').blur(function(){
			var m_email = $('#m_email').val();
			var regExpEMAIL = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
			var result7 = document.getElementById('result7');
			if(regExpEMAIL.test(m_email)){
				result7.textContent = '';
				result7.setAttribute = ('class', 'check-m_email-result-not');
				return true;
			}else{
				result7.textContent = '제대로 입력하셨는지 다시한번 확인해 주세요.';
				result7.setAttribute = ('class', 'check-m_email-result-not');
				return false;
			}
		});
	}

	var authKey=0;
	function fn_emailAuth1(){
		$('#emailAuth1').click(function(){
			var result7 = document.getElementById('result7');
			var m_email=$('#m_email').val();
			var Obj = {
					'm_email':m_email
				};
			$.ajax({
				url:'emailAuth.member',
				type:'post',
				data: JSON.stringify(Obj),
				contentType:'application/json',
				dataType:'json',
				success: function(data){
					authKey=data.resultMap;
					result7.textContent = '인증메일이 발송되었습니다';
				},
				error: function(){
					alert('실패');
				}
			});
		});
	}
	
	function fn_emailAuth2(){
		$('#emailAuth2').click(function(){
			var email2 = $('#email2').val();
			var result8 = document.getElementById('result8');
			if(email2==authKey){
				result8.textContent = '인증이 완료되었습니다';
				result8.setAttribute = ('class', 'check-m_email2-result-not');
				return true;
			}else{
				result8.textContent = '제대로 입력하셨는지 다시한번 확인해 주세요.';
				result8.setAttribute = ('class', 'check-m_email2-result-not');
				return false;
			}
		});
	}
</script>

	
	<form method="post" action="memberInsert.member">
	
		<label for="m_id">아이디</label><br/>
		<input type="text" name="m_id" id="m_id" /><br/>
		<div id="result" class="check-m_id-result" ></div>
		<br/><br/>
	
		<label for="m_pw">비밀번호</label><br/>
		<input type="password" name="m_pw" id="m_pw"/><br/>
		<div id="result2" class="check-m_pw1-result" ></div>
		<br/><br/>
	
		<label for="m_pw2">비밀번호 확인</label><br/>
		<input type="password" name="m_pw2" id="m_pw2" /><br/>
		<div id="result3" class="check-m_pw2-result" ></div>
		<br/><br/>
	
		<label for="m_nick">닉네임</label><br/>
		<input type="text" name="m_nick" id="m_nick" /><br/>
		<div id="result4" class="check-m_nick-result" ></div>
		<br/><br/>
		
		<label for="m_name">이름</label><br/>
		<input type="text" name="m_name" id="m_name" /><br/>
		<div id="result5" class="check-m_name-result"></div>
		<br/><br/>
		
		<label for="m_birth">생년월일</label><br/>
		<input type="text" name="m_birth" id="m_birth" placeholder="예)19990720"/><br/>
		<div id="result6" class="check-m_birth-result"></div>
		<br/><br/>
		
		<label for="m_email">이메일</label><br/>
		<input type="text" name="m_email" id="m_email" />
		<input type="button" value="인증번호받기" id="emailAuth1" name="emailAuth1"/><br/>
		<div id="result7" class="check-m_email-result"></div>
		<br/>
		<input type="text" name="email2" id="email2" placeholder="인증번호를 입력하세요"/><br/>
		<input type="button" value="인증완료" name="emailAuth2" id="emailAuth2"/><br/>
		<div id="result8" class="check-m_email2-result"></div>
		<br/><br/>
		
		<button>가입하기</button>
	
	</form>
	
	
	
	
<%@ include file="../template/footer.jsp" %>