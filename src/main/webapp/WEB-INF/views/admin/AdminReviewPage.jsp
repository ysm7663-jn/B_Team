<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function(){
		reviewList();
		reviewDelete();
	});
	function reviewList() {
		$.ajax({
			url: 'review',
			type: 'get',
			dataType: 'json',
			success: function(responseList) {
				if (responseList.result == true) {
					reviewListTable(responseList.list);  // 서브 함수 호출
				}
			},
			error: function(){
				alert('실패');
			}
		});
	}
	function reviewListTable(list) {
		$('#reviewList').empty();  
		$.each(list, function(idx, review){
			$('<tr>')
			.append( $('<td>').html(review.rv_no) )
			.append( $('<td>').html(review.rv_content) )
			.append( $('<input type="hidden" name="no" />').val(review.rv_no) )
			.append( $('<td>').html('<input type="button" value="삭제" id="btnDelete" />'))
			.appendTo('#reviewList');
		});
	}
	function reviewDelete() {
		$('body').on('click', '#btnDelete', function(){
	        var no = $(this).parents('tr').find('input:hidden[name="no"]').val();
	        var check = confirm(no + '번 후기를 삭제할까요?');
	        if (check) {
		        $.ajax({
		        	url: 'review/' + no,
		        	type: 'delete',
		        	dataType: 'json',
		        	success: function(responseObj) {
		        		if (responseObj.result == 1) {
							alert('댓글이 삭제되었습니다.');
							reviewList();
						} else {
							alert('댓글 삭제가 실패했습니다.');
						}
		        	},
		        	error: function(){
						alert('실패');
					}
		        });
	        }
		});
	}
</script>
<title></title>
<style type="text/css">
	
	table {
		border-collapse: collapse;
	}
	td, th {
		border-top: 1px solid black;
		border-bottom: 1px solid black;
		padding: 8px 8px;
		text-align: center;
	}
	th {
		background: silver;
	}
</style>
</head>
<body>
	<div class="review">
			<h3>댓글 목록</h3>
			<table>
				<thead>
					<tr>
						<th>후기번호</th>
						<th>후기내용</th>
						<th colspan="2">비고</th>
					</tr>
				</thead>
				<tbody id="reviewList"></tbody>
			</table>
		</div>
</body>
</html>