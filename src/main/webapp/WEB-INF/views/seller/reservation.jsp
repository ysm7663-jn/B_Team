<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>	
<h1>예약 리스트</h1>
<h3>-현재 예약 대기 목록</h3>


<form method="get">
	<select>
		<option>공간명순</option>
		<option>별점 높은순</option>
		<option>별점 낮은순</option>
	</select>
</form>

<form method="get">
	<select>
		<option>15</option>
		<option>30</option>
	</select>
</form>


예약상태가 들어가있는 place 검색




<%@ include file="../template/footer.jsp" %>