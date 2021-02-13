<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function(){
		replyList();
		replyDelete();
	});
	function replyList() {
		$.ajax({
			url: 'reply',
			type: 'get',
			dataType: 'json',
			success: function(responseList) {
				if (responseList.result == true) {
					replyListTable(responseList.list);  // 서브 함수 호출
				}
			},
			error: function(){
				alert('실패');
			}
		});
	}
	function replyListTable(list) {
		$('#replyList').empty();  
		$.each(list, function(idx, reply){
			$('<tr>')
			.append( $('<td>').html(reply.r_no) )
			.append( $('<td>').html(reply.r_content) )
			.append( $('<td>').html(reply.r_postDate) )
			.append( $('<input type="hidden" name="no" />').val(reply.r_no) )
			.append( $('<td>').html('<input type="button" value="삭제" id="btnDelete" />'))
			.appendTo('#replyList');
		});
	}
	function replyDelete() {
		$('body').on('click', '#btnDelete', function(){
	        var no = $(this).parents('tr').find('input:hidden[name="no"]').val();
	        var check = confirm(no + '번 댓글을 삭제할까요?');
	        if (check) {
		        $.ajax({
		        	url: 'reply/' + no,
		        	type: 'delete',
		        	dataType: 'json',
		        	success: function(responseObj) {
		        		if (responseObj.result == 1) {
							alert('댓글이 삭제되었습니다.');
							replyList();
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
	<div class="reply">
			<h3>댓글 목록</h3>
			<table>
				<thead>
					<tr>
						<th>댓글번호</th>
						<th>댓글내용</th>
						<th>작성일자</th>
						<th colspan="2">비고</th>
					</tr>
				</thead>
				<tbody id="replyList"></tbody>
			</table>
		</div>
</body>
</html>