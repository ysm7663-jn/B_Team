0<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script>

	$(function(){
		fn_placeSearch();	
		fn_placeSearch2();	
	});

	function fn_placeSearch(){
		var pc_no = $('select[name="category1"]').val();
		var obj1={
			's_no':'${loginDto.s_no}'
		};
		var obj2={
			'pc_no':pc_no,	
			's_no':'${loginDto.s_no}'
		};
		if(pc_no==0){
			$.ajax({
				url:'allPlaceSearch.seller',
				type:'post',
				data: JSON.stringify(obj1),
				contentType:'application/json',
				dataType: 'json',
				success: function(data){
					alert('성공1');	//지울것
					console.log('result:' + data.result);
					console.log('result:' + data.list);
					if(data.result == true){
						placeListTable(data.list);
					}
				},
				error: function(){
					alert('실패');
				}
			});
		} else {
			console.log('pc_no: ' + pc_no);		//지울것
			console.log('s_no: ' + '${loginDto.s_no}');//지울것
			$.ajax({
				url:'placeCaSearch.seller',
				type:'post',
				data: JSON.stringify(obj2),	
				contentType:'application/json',
				dataType: 'json',
				success: function(data){
					alert('성공2'); //지울것
					console.log('result:' + data.result);
					console.log('result:' + data.list);
					if(data.result == true){
						placeListTable(data.list);
					}
				},
				error: function(){
					alert('실패');
				}
			});
		}
	}
	
	function placeListTable(list){
		$('#placeList').empty();
		$.each(list, function(idx, place){
			$('<tr>')
			.append($('<td>').html(place.s_no))
			.appendTo('#placeList');
		});
	}

	
	
	// 두번째 select
	function fn_placeSearch2(){
		var pc_no = $('select[name="category1"]').val();
		var obj1={
			's_no':'${loginDto.s_no}'
		};
		var obj2={
			'pc_no':pc_no,	
			's_no':'${loginDto.s_no}'
		};
		if(pc_no==0){
			$.ajax({
				url:'allPlaceSearch.seller',
				type:'post',
				data: JSON.stringify(obj1),
				contentType:'application/json',
				dataType: 'json',
				success: function(data){
					alert('성공1');	//지울것
					console.log('result:' + data.result);
					console.log('result:' + data.list);
					if(data.result == true){
						placeListTable(data.list);
					}
				},
				error: function(){
					alert('실패');
				}
			});
		} else {
			console.log('pc_no: ' + pc_no);		//지울것
			console.log('s_no: ' + '${loginDto.s_no}');//지울것
			$.ajax({
				url:'placeCaSearch.seller',
				type:'post',
				data: JSON.stringify(obj2),	
				contentType:'application/json',
				dataType: 'json',
				success: function(data){
					alert('성공2'); //지울것
					console.log('result:' + data.result);
					console.log('result:' + data.list);
					if(data.result == true){
						placeListTable(data.list);
					}
				},
				error: function(){
					alert('실패');
				}
			});
		}
	}
	

	function placeListTable2(list){
		$('#placeList2').empty();
		$.each(list, function(idx, place){
			$('<tr>')
			.append($('<td>').html(place.p_img))
			.appendTo('#placeList2');
		});
	}

	
	
	
	
	
</script>


<h3>마이페이지</h3>
<h3>공간정보관리</h3>
<h3>OPEN</h3>
<br/>
<form method="get">
	<select name="category1" id="category1" onchange="fn_placeSearch()">
		<option value="0" selected>전체</option>
			<c:forEach var="PlaceCategoryDto" items="${list}">
				<option value="${PlaceCategoryDto.pc_no}">
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
	<select name="category2" id="category2" onchange="fn_placeSearch2()">
		<option value="">전체</option>
			<c:forEach var="PlaceCategoryDto" items="${list}">
				<option value="${PlaceCategoryDto.pc_no}">
					${PlaceCategoryDto.pc_name}
				</option>
			</c:forEach>
	</select>
</form>


<table>
	<tbody id="placeList2">
	
	</tbody>
</table>


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
				
				</tr>
		</c:forEach>
		</c:if>	
	</tbody>
</table>





<%@ include file="../template/footer.jsp" %>