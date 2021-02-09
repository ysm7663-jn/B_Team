<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<div class="c_head1">
		${faqDto.f_title}
	</div>
	<div class="c_head2">
		${faqDto.f_regDate}
	</div>
	<div class="c_body">
		${faqDto.f_content}<br/><br/>
	</div>
	
	<div class="c_foot">
	<form>
		<input type="button" name="list" value="목록보기" onclick="location.href='faqListPage.admin'" />
		<input type="hidden" name="no" value="${faqDto.f_no}" />
		<input type="hidden" name="title" value="${faqDto.f_title}" />
		<input type="hidden" name="content" value="${faqDto.f_content}" />
		<input type="button" value="수정하러가기" onclick="fn_faqUpdatePage(this.form)" />
		<input type="button" value="삭제하기" onclick="fn_faqDelete(this.form)" />
	</form>
	</div>
	
	<script type="text/javascript">
		function fn_faqUpdatePage(f) {
			f.action = 'faqUpdatePage.admin';
			f.submit();
		}
		function fn_faqDelete(f) {
			if (confirm('삭제할까요?')) {
				f.action = 'faqDelete.admin';
				f.submit();
			}
		}
	</script>
</body>
</html>