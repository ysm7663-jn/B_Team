<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" href="resources/style/common.css">
<%@ include file="../template/header.jsp" %>
<style type="text/css">
	 a:link { color: black; text-decoration: none;}
 	 a:visited { color: black; text-decoration: none;}
	 a:hover { color: blue; text-decoration: underline;}
	
	 #wrap{
	 	height: 300px;
	 	margin-bottom: 20px;
	 }
	 
	 body{
	 	background: #F8EBEE;
	 }
	 .disable{
	 	margin:0 10px 0 10px;
	 }
	 #paging > a{
	 	margin: 0 10px 0 10px;
	 }
</style>
</head>
<body>
	<div id="wrap" style="width :1020px; margin: 0 auto;">
		<h3>공지사항(NOTICE)</h3>
			<section>
				<div style="background:#3ED0C8">
					<div style="width:620px; margin: 0 auto; height:50px; line-height:50px;
						float: left; text-align: center; font-weight: 800px; 
						font-size: 24px; background:#3ED0C8; border-top: 1px solid black; border-bottom: 1px solid black">
						제목
					</div>
					<div style="width:400px; margin: 0 auto; height:50px; line-height:50px;
					float: left; text-align: center; font-weight: 800px; 
					font-size: 24px; background:#3ED0C8; border-top: 1px solid black; border-bottom: 1px solid black">
						작성일
					</div>
				</div>
			</section>
			<section class="content">
			<c:if test="${empty list}"></c:if>
			<c:if test="${not empty list}">
				<c:forEach var="noticeDto" items="${list}" varStatus="k">
						<div style="width:620px; margin: 0 auto; float: left; text-align: center; border-bottom: 1px solid black; height:40px; line-height:40px">
							<a href="noticeViewPage.notice?no=${noticeDto.n_no}&page=${page}">${noticeDto.n_title}</a>
						</div>
						<div style="width:400px; margin: 0 auto; float: left; text-align: center; border-bottom: 1px solid black; height:40px; line-height:40px;">
							${noticeDto.n_postDate}
						</div>
				</c:forEach>
			</c:if>
				<div id="paging" style="width:1020px; margin: 0 auto; float: left; text-align: center; font-weight: 800px; font-size: 20px">
					${paging}
				</div>
			</section>		
		</div>
<%@ include file="../template/footer.jsp" %>		
</body>
</html>