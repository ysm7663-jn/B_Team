<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script>
	

</script>


<h3>마이페이지</h3>
<h3>이용 후기 관리</h3>
<h5>  -이용 후기 목록</h5>
<br/>
<form method="get">
	<select>
		<option>등록일순</option>
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

<table>
	<thead>
		<tr>
			<th>공간명</th>
			<th>후기</th>
			<th>작성자</th>
			<th>별점</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="PlaceDto2" items="${list}">
			<tr>
				<td>${PlaceDto2.p_title}</td>
				<td>${PlaceDto2.review}</td>
				<td>${PlaceDto2.s_no}</td>
				<td>${PlaceDto2.p_star}</td>
			</tr>
		</c:forEach>
	</tbody>
	
</table>






<%@ include file="../template/footer.jsp" %>