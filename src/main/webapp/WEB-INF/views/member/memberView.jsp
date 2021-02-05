<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script>

	function fn_pwOpen(){
		if($('#divPwChange').css('display')=='none'){
			$('#divPwChange').show();
		}else{
			$('#divPwChange').hide();
		}
	}
	
	function fn_NickOpen(){
		if($('#divNickChange').css('display')=='none'){
			$('#divNickChange').show();
		}else{
			$('#divNickChange').hide();
		}
	}
	
	function fn_pwSerch(){
		var m_no={memberDto2.m_no};
		var m_pw={memberDto2.m_pw};
		$('#pw1').blur(function(){
			$.ajax({
				url:'memberPwSearch.member',
				type:'post',
				data:'m_no='+m_no,
				dataType:'json',
				success:function(resultMap){
					if(resultMap!=m_pw&&$('#text1').css('display')=='none'){
						$('#text1').show();
					}else{
						$('#text1').hide();
					}
				},
				error: function(){
					alert('실패');
				}
			})
		});
	}
	
	function fn_pwCheck(){
		var pw2=$('#pw2').value;
		var regExpPw = /[a-zA-Z0-9가-힣]{6,16}$/;
		var result = document.getElementByNick('result');
		if(regExpID.test(pw2)){
			result.textContent ='사용가능한 비밀번호입니다.';
			result.setAttribute('class', 'check-m_pw-result-ok');
			return true;
		}else{
			result.textContent = '사용이 불가능한 비밀번호입니다. 영문 대소문자, 숫자를 혼용하셔야 합니다';
			result.setAttribute('class', 'check-m_pw-result-not');
			return false;
		}
	}
	
	function fn_pwCheck2(){
		if($('#pw2').value == $('#pw3').value){
			$('#text1').hide();
		}else{
			$('#text1').show();
		}
	}
	
	function fn_memberPwUpdate(){
		var m_no=$('#m_no').val();
		var m_pw=$('#pw2').val();
		var obj={
				"m_no":m_no,
				"n_pw":m_pw
		};
		$.ajax({
			url:'memberPwUpdate.member',
			type:'post',
			dataType:'json',
			data:JSON.stringify(obj),
			contentType: 'application/json',
			success:function(responseObj){
				if (responseObj.result == 1) {
					alert('비밀번호가 수정되었습니다.');
				} else {
					alert('비밀번호 수정이 실패했습니다.');
				}
			},
			error: function(){
				alert('실패');
			}
		});
	}
	
	
	function fn_NickSearch(){
		$.ajax({
			url:'nickSearch.member',
			type:'post',
			data:'m_no='+$('#nick2').value,
			dataType:'json',
			success:function(resultMap){
				if(resultMap == null){
					alert('사용가능합니다');
				}else{
					alert('이미 있는 닉네임입니다');
				}
			},
			error: function(){
				alert('실패');
			}
		});
	}
	
	function fn_memberNickUpdate(){
		var m_no=$('#m_no').val();
		var m_nick=$('#nick2').val();
		var obj={
				"m_no":m_no,
				"m_nick":m_nick
		};
		$.ajax({
			url:'memberNickUpdate.member',
			type:'post',
			dataType:'json',
			data:JSON.stringify(obj),
			contentType: 'application/json',
			success:function(responseObj){
				if (responseObj.resultMap == 1) {
					alert('닉네임이 수정되었습니다.');
				} else {
					alert('닉네임 수정이 실패했습니다.');
				}
			},
			error: function(){
				alert('실패');
			}
		});
	}
	
	function fn_memberUpdate(){
		f.action('memberUpdate.member');
		f.submit();
	}
	
	
</script>	

<h3>마이페이지</h3>
	<form method="post">
		<table>
			<tbody>
				<tr>
					<th>아이디</th>
					<td>${memberDto2.m_id}</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${memberDto2.m_name}</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="button" id="btn1" value="비밀번호 변경" onclick="fn_pwOpen()"/></td>
				</tr>
				<!--	비밀번호 변경  시작 -->
				<tr style="display:none"; id="divPwChange">
					<th></th>
					<td>
						<table>
							<tbody>
								<tr>
									<td>현재 비밀번호</td>
									<td><input type="password" id="pw1" name="pw1"/></td>
									<td><span id="text1" style="display:none">비밀번호가 일치하지 않습니다.</span></td>
								</tr>
								<tr>
									<td>새 비밀번호</td>
									<td><input type="password" id="pw2" name="pw2" onblur="fn_pwCheck()"/></td>
									<td>
										<div id="result" class="check-m_pw-result"></div>
									</td>
								</tr>
								<tr>
									<td>새 비밀번호 확인</td>
									<td><input type="password" id="pw3" name="pw3" onblur="fn_pwCheck2()"/></td>
									<td><span id="text3" style="display:none">비밀번호가 일치하지 않습니다.</span></td>
								</tr>
								<tr>
									<td><input type="button" value="수정하기" onclick="fn_pwUpdate()"/></td>
									<td>*비밀번호 변경시 수정하기 버튼을 누르셔야 합니다</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				
				<tr>
					<th>닉네임</th>
					<td> ${memberDto2.m_nick} <input type="button" value="닉네임 변경" onclick="fn_NickOpen()"/></td>
				</tr>
				
				<!--	닉네임 변경  시작 -->
				<tr style="display:none"; id="divNickChange">
					<th></th>
					<td>
						<table>
							<tbody>
								<tr>
									<td>새 닉네임</td>
									<td><input type="text" id="nick2" name="nick2"/></td>
								</tr>
								<tr>
									<td><input type="button" value="중복검사하기" onclick="fn_NickSearch()"/></td>
								</tr>
								<tr>
									<td><input type="button" value="수정하기" onclick="fn_NickUpdate()"/></td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				
				<tr>
					<th>생년월일</th>
					<td>${memberDto2.m_birth}</td>
				</tr>
				<tr>
					<th>휴대전화</th>
					<td><input type="text" placeholder="${memberDto2.m_phone}"/></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" placeholder="${memberDto2.m_email}"/></td>
				</tr>
				<tr>
					<td>
						<input type="hidden" name="m_no" value="${memberDto2.m_no}"/>
						<input type="button" value="확인" onclick="fn_memberUpdate(this.form)"/>
					</td>
				</tr>
				
			</tbody>
		</table>
	</form>


<%@ include file="../template/footer.jsp" %>