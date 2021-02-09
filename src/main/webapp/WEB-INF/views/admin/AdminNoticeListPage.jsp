<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css">
	a{
		text-decoration: none;
		width: 400px;
		color: white;
	}
	div{
	display: flex;
	background : gray;
	margin : 20px 0px 0px 20px;
	
	
	}
	.title {
		width : 400px;
		text-align: center;
	}
	.date{
		width : 300px;
		text-align: center;
	}
	.date1{
		padding-left:90px;
	}
	.paging{
		margin : 50px;
		width: 700px;
		text-align: center;
	}
</style>
</head>
<body>
<h3>공지사항(NOTICE)</h3>
	
	<input type="button" value="공지사항추가" onclick="location.href='noticeInsertPage.admin'" /><br/><br/>
	
		<div  style="display: flex; flex-direction: column;">
			<section class="top">
				<div>
					<div>
						<span class="title">제목</span>
						<span class="date">작성일</span>
					</div>
				</div>
			</section>
			<section class="content">
			<c:if test="${empty list}"></c:if>
			<c:if test="${not empty list}">
				<c:forEach var="noticeDto" items="${list}" varStatus="k">
					<div>
						<div class="title1"><a href="noticeViewPage.admin?no=${noticeDto.n_no}&page=${page}">${noticeDto.n_title}</a></div>
						<div>
						<span class="date1">${noticeDto.n_postDate}</span>
						</div>
					</div>	
						
				</c:forEach>
			</c:if>
			<div>
				<span class="paging">${paging}</span>
			</div>
			</section>		
		</div>
			
				
						<!-- 
						<td>${totalRecord - ((page - 1) * recordPerPage + k.index)}</td>
						 -->
		
	
				
	

</body>
</html>