<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<%@ include file="../template/header.jsp" %>
<style type="text/css">

</style>
</head>
<body>
	<div style="width :1020px; margin: 0 auto;">
		<h3 style="margin-left: 10px">이벤트(EVENT)</h3>
		<div style="background:#3ED0C8; border-top: 1px solid black; border-bottom: 1px solid black">
			<div style="width:600px; margin: 0 0 0 10px; font-weight: bold; font-size: 18px;">
				${eventDto.e_title}
			</div>
			<div style="width:600px; margin:10px 0 10px 10px;  font-size: 16px;">
				${eventDto.e_postDate}
			</div>
		</div>
		<div>
			<div style="width:1000px; margin-left:20px;  font-size: 18px">
				<img alt="${eventDto.e_filename}" src="resources/storage/${filename}"><br/><br/>
			</div>
			<div style="height:200px; padding:30px 0 0 10px;  font-size: 18px; border-bottom:1px solid black">
				${eventDto.e_content}<br/><br/>
			</div>
		</div><br/>
		<div class="c_foot">
			<form method="post">
				<input type="button" name="list" value="목록보기" onclick="location.href='eventListPage.event'" />
				<input type="hidden" name="no" value="${eventDto.e_no}" />
				<input type="hidden" name="title" value="${eventDto.e_title}" />
				<input type="hidden" name="content" value="${eventDto.e_content}" />
			</form>
		</div>
	</div>
<%@ include file="../template/footer.jsp" %>
</body>
</html>