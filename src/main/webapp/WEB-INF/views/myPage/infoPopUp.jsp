<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w==" crossorigin="anonymous" />
			
<h2>회원정보</h2>
<hr>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script>

	/* var nick = opener.document.getElementById("nick").value;
	var name = opener.document.getElementById("name").value;
	var phone = opener.document.getElementById("phone").value;
	var email = opener.document.getElementById("email").value;
	var birth = opener.document.getElementById("birth").value;
	var card = opener.document.getElementById("card").value;
	var cl_no = opener.document.getElementById("cl_no").value; */
	
	alert('${clubListDto}');
	let nick = '${clubListDto.m_nick}';
	let name = '${clubListDto.m_name}';
	let phone = '${clubListDto.m_phone}';
	let email = '${clubListDto.m_email}';
	let birth= '${clubListDto.m_birth}';
	let card = '${clubListDto.cl_card}';
	let cl_no = '${clubListDto.cl_no}';
	
	var year = new Date().getFullYear();
	//var age = year - (Number)birth.subString(3) + 1;
	
	var addIcon = '';
	for(var i = 0; i < card; i ++) {
		addIcon += '<i class="fas fa-skull"></i>' ; 
	}
	
	$(function() {
		//$('#nameAndAge').html(name + "(" + age + "살)"); 
		$('#nick').html(nick); 
		$('#phone').html(phone); 
		$('#email').html(email); 
		$('#card-icon').html(addIcon);
		$('#cl_card').val(card); 
		$('#cl_no').val(cl_no); 
	});
	
	function fn_cardPlus() {
		$.ajax({
			url: 'cardPlus/' + cl_no,
			type: 'get',
			dataType: 'json',
			success: function(responseObj){
				if(responseObj.cardCount == 0) {
					location.href='history.back()';
				} else {
					$('#card-icon').empty();
					for(var i = 0; i < responseObj.cardCount; i++) {
						$('#card-icon').append('<i class="fas fa-skull"></i>');
					}
					alert('옐로카드가 추가되었습니다.');
				}
			},
			error: function() {
				alert('문제가 발생했습니다. 다시 시도하세요.');
			}
			
		});
	}
</script>
	<div class="popup-top">
		<span id="nameAndAge"></span>
			<form method="post">
				<!-- hidden -->
				<!-- <input type="hidden" id="cl_card" name="cl_card" />
				<input type="hidden" id="cl_no" name="cl_no" /> -->
				<input type="button" value="옐로카드" onclick="fn_cardPlus()" />
			</form>
	</div>
	<div class="popup-body">
		<table>
			<tbody>
				<tr>
					<td>닉네임</td>
					<td id="nick"></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td id="phone"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td id="email"></td>
				</tr>
			</tbody>
		</table>
		<div id="card-icon"></div>
		<input type="text" id="index" />
	</div>