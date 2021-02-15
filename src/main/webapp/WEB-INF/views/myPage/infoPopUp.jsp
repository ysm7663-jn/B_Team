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
	var birth = opener.document.getElementById("birth").value;
	
	var year = new Date().getFullYear();
	var addIcon = '';
	for(var i = 0; i < card; i ++) {
		addIcon += '<i class="fas fa-skull"></i>' ; 
	}
	
	$(function() {
		$('#nameAndAge').html(opener.document.getElementById("name").value + "(" +  + ")"); 
		$('#nick').html(opener.document.getElementById("nick").value); 
		$('#phone').html(opener.document.getElementById("phone").value); 
		$('#email').html(opener.document.getElementById("email").value); 
		$('#card-icon').html(addIcon);
		$('#cl_card').val(opener.document.getElementById("card").value); 
		$('#cl_no').val(opener.document.getElementById("cl_no").value); 
	});
	
	function fn_cardPlus(f) {
		f.action='cardPlus.myPage';
		f.submit();
	}
</script>
	<div class="popup-top">
		<span id="nameAndAge"></span>
			<form method="post">
				<!-- hidden -->
				<input type="hidden" id="cl_card" name="cl_card" />
				<input type="hidden" id="cl_no" name="cl_no" />
				<input type="button" value="옐로카드" onclick="fn_cardPlus(this.form)" />
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
	</div>