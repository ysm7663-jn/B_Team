<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script>
	function fn_memberDrop(f){
		f.submit();
		f.action='memberDrop.member';
	}


</script>


	<h1>회원탈퇴</h1>
	<h3>회원탈퇴 전 다음사항을 꼭 확인해주세요</h3>
	<div>
			
	</div>
	<br/><br/>
	<button>모임탈퇴 페이지로 이동</button>
	<div>
		<form method="post">
			<input type="radio" name="just" id="drop"/>그냥
			<input type="radio" name="price" id="drop"/>가격 불만
			<input type="radio" name="place" id="drop"/>장소 불만
			<input type="radio" name="kind" id="drop"/>종류 부족
			<input type="radio" name="guest" id="drop"/>고객 응대 불만
			<input type="radio" name="etc" id="drop"/>기타
		</form>
	</div>
	<br/><br/>
	위의 내용을 모두 확인하였으며 회원정보, 구매정보의 소멸에 동의 합니다
	<input type="button" value="탈퇴하기" onclick="fn_memberDrop"/>

<%@ include file="../template/footer.jsp" %>
