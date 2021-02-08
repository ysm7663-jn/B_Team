<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script>
	function fn_allPlaceSearch(){
		var s_no='';	// 이부분 채울것
		$.ajax({
			url:'allPlaceSearch.seller',
			type:'get',
			data:'s_no='+s_no,
			dataType: 'json',
			success: function(data){
				alert('성공');	//지울것
				if(data.result == true){
					placeListTable(data.list)
				}
			},
			error: function(){
				alert('실패');
			}
		});
	}
	
	function placeListTable(list){
		$('#placeList').empty();
		$.each(list, function(idx, place){
			$('<tr>')
			.append($('<td>').html(place.p_img))
			.appendTo('#placeList');
		});
	}
	
	$(function(){
		$('#category1').change(function(){
			var pc_no=''; 	// 이부분 채울것
			var obj={
				'pc_no':pc_no,	
				's_no':s_no
			};
			$.ajax({
				url:'placeCaSearch.seller',
				type:'post',
				data: JSON.stringify(sendObj),	
				contentType:'application/json',
				dataType: 'json',
				success: function(resultMap){
					alert('성공'); //지울것
					
				},
				error: function(){
					alert('실패');
				}
			});
		});
	});
	
	
	$(function(){
		$('#category2').change(function(){
			var pc_no=''; 	// 이부분 채울것
			var obj={
				'pc_no':pc_no,	
				's_no':s_no
			};
			$.ajax({
				url:'placeCaSearch.seller',
				type:'post',
				data: JSON.stringify(sendObj),	
				contentType:'application/json',
				dataType: 'json',
				success: function(resultMap){
					alert('성공');
				},
				error: function(){
					alert('실패');
				}
			});
		});
	});

</script>


<h3>마이페이지</h3>
<h3>공간정보관리</h3>
<h3>OPEN</h3>
<br/>
<form method="get">
	<select name="category1" id="category1">
		<option value="">전체</option>
			<c:forEach var="PlaceCategoryDto" items="${list}">
				<option id="category${PlaceCategoryDto.pc_no}"value="${PlaceCategoryDto.pc_no}">
					${PlaceCategoryDto.pc_name}
				</option>
			</c:forEach>
	</select>
</form>

<table>
	<tbody id="placeList">
	
	</tbody>
</table>


<br/><br/>
<h3>CLOSED</h3>
<br/>

<form method="get">
	<select name="category2" id="category2">
		<option value="">전체</option>
			<c:forEach var="PlaceCategoryDto" items="${list}">
				<option id="category${PlaceCategoryDto.pc_no}"value="${PlaceCategoryDto.pc_no}" onclick="fn_PlaceCaSearch()">
					${PlaceCategoryDto.pc_name}
				</option>
			</c:forEach>
	</select>
</form>

<table>
	<tbody>
		<c:if test="${empty list}">
			<tr>
				<td>없음</td>
			</tr>
		</c:if>
		<c:if test="${not empty list}">
			<c:forEach var="PlaceDto2" items="${list}">
				<tr>
					<td>${PlaceDto2.p_img}</td>
				</tr>
		</c:forEach>
		</c:if>	
	</tbody>
</table>





<%@ include file="../template/footer.jsp" %>