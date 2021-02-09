<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="c_head1">
		${noticeDto.n_title}
	</div>
	<div class="c_head2">
		${noticeDto.n_postDate}
	</div>
	<div class="c_body">
		${noticeDto.n_content}<br/><br/>
	</div>
	
	<div class="c_foot">
	<form>
		<input type="button" name="list" value="목록보기" onclick="location.href='noticeListPage.admin'" />
		<input type="hidden" name="no" value="${noticeDto.n_no}" />
		<input type="hidden" name="title" value="${noticeDto.n_title}" />
		<input type="hidden" name="content" value="${noticeDto.n_content}" />
		<input type="button" value="수정하러가기" onclick="fn_noticeUpdatePage(this.form)" />
		<input type="button" value="삭제하기" onclick="fn_noticeDelete(this.form)" />
	
	</form>
	</div>
	
	<script type="text/javascript">
		function fn_noticeUpdatePage(f) {
			f.action = 'noticeUpdatePage.admin';
			f.submit();
		}
		function fn_noticeDelete(f) {
			if (confirm('삭제할까요?')) {
				f.action = 'noticeDelete.admin';
				f.submit();
			}
		}
	</script>

</body>
</html>