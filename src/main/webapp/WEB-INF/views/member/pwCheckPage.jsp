<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script>
	function fn_memberView(f){
		if(${memberDto2.mpw}.equals(f.pw.value)){
			f.submit();
			f.action('memberView.member');
		}
	}

</script>


	<h3>비밀번호 확인</h3>
	<br/><br/>
	고객님의 개인정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 입력해 주세요
	<form>
		<input type="text" name="pw" id="pw"/>
		<input type="button" value="확인" onclick="fn_memberView(this.form)"/>
		<input type="button" value="취소" onclick=""/>
	</form>
	

<%@ include file="../template/footer.jsp" %>