<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script type="text/javascript">

	// 페이지 로드 이벤트
	$(document).ready(function(){
		memberList();
		memberView();
		memberInsert();
		memberUpdate();
		memberDelete();
		init();
	});
	
	// 페이징 처리
	var page = 1;  // 초기화
		
	/***** 1. 회원 목록 *****/
	function memberList() {

		var obj= {
			"page": page
		};
		
		$.ajax({
			url: 'memberList.do',
			type: 'post',
			data: JSON.stringify(obj),  // 컨트롤러로 보내는 JSON 데이터
			contentType: 'application/json',  // 컨트롤러로 보내는 데이터의 타입
			dataType: 'json',
			success: function(result) {
				/*
					result = {
						"list": [
							{
								"no": 1,
								"id": "user1",
								"name": "제임스",
								"gender": "남",
								"address": "서울"
							},
							...
						],
						"paging": {
							"totalRecord": 20,
							"page": 1,
							"totalPage": 7,
							"pagePerBlock": 5,
							"beginPage": 1,
							"endPage": 4
						},
						"exist": true
					}
				*/

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
	
	}  // end memberList()

	
	// 서브 함수: 회원 목록을 테이블로 만들어 주는 함수
	function memberListTable(list) {
		$.each(list, function(idx, member){
			$('<tr>')
			.append( $('<td>').html(member.no) )
			.append( $('<td>').html(member.id) )
			.append( $('<td>').html(member.name) )
			.append( $('<td>').html(member.gender) )
			.append( $('<td>').html(member.address) )
			.append( $('<input type="hidden" name="no" />').val(member.no) )
			.append( $('<input type="hidden" name="id" />').val(member.id) )  // 회원 삭제에서 사용할 id를 새로 추가했습니다.
			.append( $('<td>').html('<input type="button" value="조회" id="btnView" /><input type="button" value="삭제" id="btnDelete" />'))
			.appendTo('#memberList');
		});
	}
	
	/***** 2. 회원 정보 *****/
	function memberView() {
		
		$('body').on('click', '#btnView', function(){
			
	        var no = $(this).parents('tr').find('input:hidden[name="no"]').val();
	        var obj = {
	        	"no": no	
	        };
	        
	        $.ajax({
	        	url: 'memberView.do',
	        	type: 'post',
	        	data: JSON.stringify(obj),
	        	contentType: 'application/json',
	        	dataType: 'json',
	        	success: function(responseObj) {
	        		/*
					responseObj = {
						"memberDto": {
								"no": 1,
								"id": "user1",
								"name": "제임스",
								"gender": "남",
								"address": "서울"
						},
						"result": true
					}
					*/
	        		if (responseObj.result == true) {
	        			$('input:text[name="id"]').val(responseObj.memberDto.id);
	        			$('input:text[name="name"]').val(responseObj.memberDto.name);
	        			$('input:radio[name="gender"][value="' + responseObj.memberDto.gender + '"]').prop('checked', true);
	        			$('select[name="address"]').val(responseObj.memberDto.address);
	        			$('.left input:hidden[name="no"]').remove();  // 먼저 있던 hidden 제거
	        			$('.left').append($('<input type="hidden" name="no" />').val(no));  // 새로운 hidden 추가
	        		}
	        	},
	        	error: function(){
					alert('실패');
				}
	        });
	        
		});
		
	}
	
	/***** 3. 회원 삽입 *****/
	function memberInsert() {
		
		$('#btnInsert').click(function(){
			
			var id = $('input:text[name="id"]').val();
			var name = $('input:text[name="name"]').val();
			var gender = $('input:radio[name="gender"]:checked').val();
			var address = $('select[name="address"]').val();
			
			var obj = {
				"id": id,
				"name": name,
				"gender": gender,
				"address": address
			};
			
			$.ajax({
				url: 'memberInsert.do',
				type: 'post',
				data: JSON.stringify(obj),
				contentType: 'application/json',
				dataType: 'json',
				success: function(responseObj) {
					/*
						responseObj = {
							"result": 1 (성공)
							또는
							"result": 0 (실패)
							또는
							"result": -1 (중복 회원 존재)
						}
					*/
					if (responseObj.result == 1) {
						alert('신규 회원이 등록되었습니다.');
						memberList();  // 새로 회원 목록을 출력합니다.
					} else if (responseObj.result == 0) {
						alert('신규 회원 등록에 실패했습니다.');
					} else if (responseObj.result == -1) {
						alert('이미 사용 중인 아이디입니다.');
					}
				},
				error: function(){
					alert('실패');
				}
			});
			
		});
		
	}
	
	/***** 4. 회원 수정 *****/
	function memberUpdate() {
		
		$('#btnUpdate').click(function(){
			
			var no = $(this).parents('div.left').find('input:hidden[name="no"]').val();  // 수정할 회원의 회원번호
			
			var id = $('input:text[name="id"]').val();
			var name = $('input:text[name="name"]').val();
			var gender = $('input:radio[name="gender"]:checked').val();
			var address = $('select[name="address"]').val();
			
			var obj = {
				"no": no,
				"id": id,
				"name": name,
				"gender": gender,
				"address": address
			};
			
			$.ajax({
				url: 'memberUpdate.do',
				type: 'post',
				data: JSON.stringify(obj),
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
	
	/***** 5. 회원 삭제 *****/
	function memberDelete() {
		
		$('body').on('click', '#btnDelete', function(){
	        
	        var no = $(this).parents('tr').find('input:hidden[name="no"]').val();
	        
	        // 삭제할 회원의 id를 먼저 보여주기 위해서 회원 목록을 표시할 때 회원 아이디를 추가해 주었습니다. (memberList() 함수)
	        var id = $(this).parents('tr').find('input:hidden[name="id"]').val();
	        
	        var obj = {
	        	"no": no	
	        };
	        
	        var check = confirm(id + '님 정보를 삭제할까요?');
	        if (check) {
		        $.ajax({
		        	url: 'memberDelete.do',
		        	type: 'post',
		        	data: JSON.stringify(obj),
					contentType: 'application/json',
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
	
	/***** 6. 초기화 *****/
	function init() {
		$('#btnInit').click(function(){
			$('input:text[name="id"]').val('');
			$('input:text[name="name"]').val('');
			$('input:radio[name="gender"]').prop('checked', false);
			$('select[name="address"]').val('');
			memberList();
		});
	}
	
</script>
<title>Insert title here</title>
<style type="text/css">
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
</head>
<body>
	
	<div class="wrap">
		
		<div class="left">
			<!-- 등록/수정/보기 페이지 -->
			<h3>회원 등록/수정/보기</h3>
			아이디<br/>
			<input type="text" name="id" /><br/><br/>
			이름<br/>
			<input type="text" name="name" /><br/><br/>
			성별<br/>
			<input type="radio" name="gender" value="남" />남
			<input type="radio" name="gender" value="여" />여<br/><br/>
			주소<br/>
			<select name="address">
				<option value="">지역 선택</option>
				<option value="서울">서울</option>
				<option value="인천">인천</option>
				<option value="부산">부산</option>
				<option value="제주">제주</option>
				<option value="강원">강원</option>
			</select><br/><br/>
			<input type="button" value="등록" id="btnInsert" />
			<input type="button" value="수정" id="btnUpdate" />
			<input type="button" value="초기화" id="btnInit" />
		</div>
		
		<div class="right">
			<!-- 목록/삭제 페이지 -->
			<h3>회원 목록</h3>
			<div id="totalRecord"></div>
			<table>
				<thead>
					<tr>
						<th>회원번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>성별</th>
						<th>주소</th>
						<th colspan="2">비고</th>
					</tr>
				</thead>
				<tbody id="memberList"></tbody>
				<tfoot>
					<tr>
						<td colspan="7">
							<div id="paging"></div>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
		
	</div>
	
</body>
</html>