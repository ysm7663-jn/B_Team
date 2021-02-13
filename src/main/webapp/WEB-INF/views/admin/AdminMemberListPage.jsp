<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function(){
		memberList();
		memberView();
		memberDelete();
		memberUpdate();
	});
	var page = 1; 
	
	function memberList() {
		
		var obj= {
				"page": page
			};
			
			$.ajax({
				url: 'member',
				type: 'post',
				data: JSON.stringify(obj),  // 컨트롤러로 보내는 JSON 데이터
				contentType: 'application/json',  // 컨트롤러로 보내는 데이터의 타입
				dataType: 'json',
				success: function(result) {
					
					var paging = result.paging;
					
					$('#memberList').empty();  // 기존 목록 제거
					
					// 회원이 있으면,
					if (result.exist) {
						$('#totalRecord').html('전체: ' + paging.totalRecord + '명');  // 전체 인원수 출력
						memberListTable(result.list);  // 목록 출력
					}
					// 회원이 없으면,
					else {
						$('<tr>')
						.append($('<td colspan="6" style="height: 20px;">').html('데이터가 없습니다.'))
						.appendTo('#memberList');
					}
					
					
					// 여기서부터 memberList() 끝까지 페이징 처리
					
					$('#paging').empty();  // 기존 페이징 초기화
					
					// 링크가 필요한 모든 곳에는 data-page 속성에 이동할 페이지 번호를 계산해 두고
					// $(this).attr('data-page') 를 통해서 그 값을 꺼내서 사용합니다.
					
					// ◀
					if (paging.beginPage <= paging.pagePerBlock) {
						// class 의미
						// disable : css (클릭 안 되는 건 실버색) 적용하려고
						$('#paging').append('<div class="disable"><a>◀</a></div>');
					} else {
						// class 의미
						// 1) prev-block : 이전(◀)으로 이동하려고
						// 2) go-page : css (cursor: pointer) 적용하려고
						$('#paging').append('<div class="prev-block go-page" data-page="' + (paging.beginPage - 1) + '"><a>◀</a></div>');
					}
					
					// 1 2 3 4 5
					for (let p = paging.beginPage; p <= paging.endPage; p++) {
						if (paging.page == p) {  // 현재페이지는 링크가 안 됩니다.
							// class 의미
							// now-page : css (현재 페이지는 녹색) 적용하려고
							$('#paging').append('<div class="now-page"><a>' + p + '</a></div>')
						} else {
							// class 의미
							// go-page : css (cursor: pointer) 적용하려고
							$('#paging').append('<div class="go-page" data-page="' + p + '"><a>' + p + '</a></div>');
						}
					}
					
					// ▶
					if (paging.endPage >= paging.totalPage) {
						// class 의미
						// disable : css (클릭 안 되는 건 실버색) 적용하려고
						$('#paging').append('<div class="disable"><a>▶</a></div>');
					} else {
						// class 의미
						// 1) next-block : 다음(▶)으로 이동하려고
						// 2) go-page : css (cursor: pointer) 적용하려고
						$('#paging').append('<div class="next-block go-page" data-page="' + (paging.endPage + 1) + '"><a>▶</a></div>');
					}
					
				},
				error: function(){
					alert('실패');
				}
				
			});
			
			// 링크가 걸릴 때 이동할 페이지 번호를 알아내서 다시 목록을 뿌리는 함수들
			$('body').on('click', '.prev-block', function(){
				page = $(this).attr('data-page');
				memberList();
			});
			$('body').on('click', '.go-page', function(){
				page = $(this).attr('data-page');
				memberList();
			});
			$('body').on('click', '.next-block', function(){
				page = $(this).attr('data-page');
				memberList();
			});
		
		}
	function memberListTable(list) {
		$.each(list, function(idx, member){
			$('<tr>')
			.append( $('<td>').html(member.m_no) )
			.append( $('<td>').html(member.m_id) )
			.append( $('<td>').html(member.m_pw) )
			.append( $('<td>').html(member.m_phone) )
			.append( $('<td>').html(member.m_name) )
			.append( $('<td>').html(member.m_birth) )
			.append( $('<td>').html(member.m_nick) )
			.append( $('<td>').html(member.m_email) )
			.append( $('<td>').html(member.m_regDate) )
			.append( $('<input type="hidden" name="no" />').val(member.m_no) )
			.append( $('<input type="hidden" name="id" />').val(member.m_id) )  // 회원 삭제에서 사용할 id를 새로 추가했습니다.
			.append( $('<td>').html('<input type="button" value="조회" id="btnView" />'))
			.append( $('<td>').html('<input type="button" value="삭제" id="btnDelete" />'))
			.appendTo('#memberList');
		});
	}
		function memberView() {
			$('body').on('click', '#btnView', function(){
		        var no = $(this).parents('tr').find('input:hidden[name="no"]').val();
		        $.ajax({
		        	url: 'member/' + no,  
		        	type: 'get',
		        	dataType: 'json',
		        	success: function(responseObj) {
		        		if (responseObj.result == true) {
		        			$('input:text[name="name"]').val(responseObj.adminMemberDto2.m_name);
		        			$('input:text[name="pw"]').val(responseObj.adminMemberDto2.m_pw);
		        			$('input:text[name="phone"]').val(responseObj.adminMemberDto2.m_phone);
		        			$('.left input:hidden[name="no"]').remove();  
		        			$('.left').append($('<input type="hidden" name="no" />').val(no));  
		        		}
		        	},
		        	error: function(){
						alert('실패');
					}
		        });
			});
		}	
	function memberDelete() {
		$('body').on('click', '#btnDelete', function(){
	        var no = $(this).parents('tr').find('input:hidden[name="no"]').val();
	        var id = $(this).parents('tr').find('input:hidden[name="id"]').val();
	        var check = confirm(id + '님 정보를 삭제할까요?');
	        if (check) {
		        $.ajax({
		        	url: 'member/' + no,
		        	type: 'delete',
		        	dataType: 'json',
		        	success: function(responseObj) {
		        		if (responseObj.result == 1) {
							alert('회원 정보가 삭제되었습니다.');
							memberList();
						} else {
							alert('회원 정보 삭제가 실패했습니다.');
						}
		        	},
		        	error: function(){
						alert('실패');
					}
		        });
	        }
		});
	}
	function memberUpdate() {
		$('#btnUpdate').click(function(){
			var no = $(this).parents('div.left').find('input:hidden[name="no"]').val();  // 수정할 회원의 회원번호
			var name = $('input:text[name="name"]').val();
			var pw = $('input:text[name="pw"]').val();
			var phone = $('input:text[name="phone"]').val();
			var sendObj = {
					"m_no": no,
					"m_name": name,
					"m_pw": pw,
					"m_phone" : phone
				};
			$.ajax({
				url: 'member',
				type: 'put',
				data: JSON.stringify(sendObj),
				contentType: 'application/json',
				dataType: 'json',
				success: function(responseObj) {
					if (responseObj.result == 1) {
						alert('회원 정보가 수정되었습니다.');
						memberList();
					} else {
						alert('회원 정보 수정이 실패했습니다.');
					}
				},
				error: function(){
					alert('실패');
				}
			});
			
		});
	}
</script>
<title></title>
<style type="text/css">
	.wrap {
		display: flex;
	}
	.left {
		width: 200px;
		margin: 50px 0 0 0;
	}
	.right {
		width: 1200px;
		margin-left: 200px;
	}
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
		background: #3ED0C8;
	}
	body{
		background: #DADADA;
	}
	#pagingBox{
		padding-left: 350px;
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
		color: red;
	}
	#paging .disable {
		color: black;
	}
</style>
</head>
<body>
	<div class="wrap">
	<div class="right">
			<h1>회원 목록</h1>
			<div id="totalRecord"></div><br/>
			<table>
				<thead>
					<tr>
						<th>회원번호</th>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>휴대폰번호</th>
						<th>이름</th>
						<th>생년월일</th>
						<th>닉네임</th>
						<th>이메일</th>
						<th>가입일</th>
						<th colspan="2">비고</th>
					</tr>
				</thead>
				<tbody id="memberList"></tbody>
				<tfoot>
					<tr>
						<td id="pagingBox" colspan="11">
							<div id="paging"></div>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
		<div class="left">
			<h3>회원 수정/보기</h3>
			이름<br/>
			<input type="text" name="name" /><br/><br/>
			비밀번호<br/>
			<input type="text" name="pw" /><br/><br/>
			휴대폰번호<br/>
			<input type="text" name="phone" /><br/><br/>
			<input type="button" value="수정" id="btnUpdate" />
		</div>
	</div>
			
</body>
</html>