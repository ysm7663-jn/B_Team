<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<h3>자주묻는질문(FAQ)</h3>
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list}">
				<tr>
					<td colspan="3">없음</td>
				</tr>
			</c:if>
			<c:if test="${not empty list}">
				<c:forEach var="faqDto" items="${list}" varStatus="k">
					<tr>
						<td>${totalRecord - ((page - 1) * recordPerPage + k.index)}</td>
						<td><a href="faqViewPage.do?no=${faqDto.f_no}&page=${page}">${faqDto.f_title}</a></td>
						<td>${faqDto.f_regtDate}</td>
					</tr>
				</c:forEach>
					 
			</c:if>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="3">
					${paging}
				</td>
			</tr>
		</tfoot>
	</table>
</body>
</html>