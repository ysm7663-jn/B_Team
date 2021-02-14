<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp" />
<jsp:include page="../myPage/myPage.jsp" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script>
	fn_memberDelete(f){
		var drop=confirm('정말로 탈퇴하시겠습니까?');
		if(drop==true){
			f.action='memberDelete.member';
			f.submit();
		}
	}

</script>

	<h1>회원탈퇴</h1>
	<h3>회원탈퇴 전 다음사항을 꼭 확인해주세요</h3>
	<div>
			
	</div>
	<br/><br/>
	<button>모임탈퇴 페이지로 이동</button>
	<br/><br/>
	위의 내용을 모두 확인하였으며 회원정보, 구매정보의 소멸에 동의 합니다
	<form method="post">
	<input type="hidden" name="m_no" value="${loginDto.m_no}"/>
	<input type="button" value="탈퇴하기" onclick="fn_memberDelete(this.form)"/>
	</form>

<%@ include file="../template/footer.jsp" %>
