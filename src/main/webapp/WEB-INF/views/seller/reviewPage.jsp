<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>	
<script type="text/javascript">

	$(document).ready(function(){
		reviewList();
	});
	
	var page=1;
	
	function reviewList(){
		
		var obj={
				"page":page
		};
		
		$.ajax({
			url:'reviewList.seller',
			type:'post',
			data:JSON.stringify(obj),
			contentType:'application/json',
			dataType:'json',
			success:function(result){
				
				var paging = result.paging;
				
				$('#reviewList').empty();
				
				if(result.exist){
					reviewListTable(result.list);
				}else{
					$('<tr>')
					.append($('<td colspan="4" style="height: 20px;">').html('데이터가 없습니다.'))
				}
				
				$('#paging').empty();
				
				if(paging.beginPage <= paging.pagePerBlock){
					$('#paging').append('<div class="disable"><a>◀</a></div>');
				}else{
					$('#paging').append('<div class="prev-block go-page" data-page="' + (paging.beginPage - 1) + '"><a>◀</a></div>');
				}
				
				for(let p = paging.beginPage; p <= paging.endPage; p++){
					if(pagin.page==p){
						$('#paging').append('<div class="now-page"><a>' + p + '</a></div>')
					}else{
						$('#paging').append('<div class="go-page" data-page="' + p + '"><a>' + p + '</a></div>');
					}
				}
				
				if(paging.endPage >= paging.totalPage){
					$('#paging').append('<div class="disable"><a>▶</a></div>');
				}else{
					$('#paging').append('<div class="next-block go-page" data-page="' + (paging.endPage + 1) + '"><a>▶</a></div>');
				}
			},
			error: function(){
				alert('실패');
			}
		});
		
	}
	
	$('body').on('click', '.prev-block', function(){
		page = $(this).attr('data-page');
		reviewList();
	});
	$('body').on('click', '.go-page', function(){
		page = $(this).attr('data-page');
		reviewList();
	});
	$('body').on('click', '.next-block', function(){
		page = $(this).attr('data-page');
		reviewList();
	});
	
	function reviewListTable(list){
		$.each(list,function(idx, review){
			$('<tr>')
			.append($('<td>').html(place.p_title))
			.append($('<td>').html(place.p_review))
			.append($('<td>').html(place.s_no))
			.append($('<td>').html(place.p_star))
			.appendTo('#reviewList');
		})
	}
</script>
<style>
	.wrap {
		display: flex;
	}
	.left {
		width: 500px;
	}
	.right {
		width: 1000px;
	}
	table {
		border-collapse: collapse;
	}
	td, th {
		border-top: 1px solid black;
		border-bottom: 1px solid black;
		padding: 5px 20px;
		text-align: center;
	}
	th {
		background: silver;
	}
	#paging {
		display: flex;
		text-align: center;
	}
	#paging div {
		width: 40px;
		height: 20px;
	}
	#paging .go-page:hover {
		cursor: pointer;
	}
	#paging .now-page {
		color: lime;
	}
	#paging .disable {
		color: silver;
	}
</style>


<h3>마이페이지</h3>
<h3>이용 후기 관리</h3>
<h5>  -이용 후기 목록</h5>
<br/>
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

<div id="totalRecord"></div>
<table>
	<thead>
		<tr>
			<th>공간명</th>
			<th>후기</th>
			<th>작성자</th>
			<th>별점</th>
		</tr>
	</thead>
	<tbody id="reviewList"></tbody>
	<tfoot>
		<tr>
			<td colspan="4">
				<div id="paging"></div>
			</td>
		</tr>
	</tfoot>
</table>






<%@ include file="../template/footer.jsp" %>