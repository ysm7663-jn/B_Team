<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function(){
	fn_allList();	
	fn_payList();
	fn_accountList();
	fn_usingList();
});
	function fn_allList(){
	$('#allBtn').click(function(){
		location.href = 'faqListPage.admin?f_category=${faqDto.f_category}'+ 1;
	});
	}
	function fn_payList() {
	$('#payBtn').click(function(){
		location.href = 'faqListPage.admin?f_category=${faqDto.f_category}' + 2;  // location은 get 방식의 요청이고, 별도 파라미터를 가지고 가지 않기 때문에 ?로 직접 파라미터를 추가해서 보내줘야 합니다. 컨트롤러는 request에 f_category가 저장되어 있다고 보면 됩니다. 
	});
	}
	function fn_accountList(){
	$('#accountBtn').click(function(){
		location.href = 'faqListPage.admin?f_category=${faqDto.f_category}' + 3; 
	});
	}
	function fn_usingList(){
	$('#usingBtn').click(function(){
		location.href = 'faqListPage.admin?f_category=${faqDto.f_category}' + 4; 
	});
	}
</script>
<title></title>
</head>
<body>
<h3>자주묻는질문(FAQ)</h3>
	<div  style="display: flex; flex-direction: column;">
		<div>
			<form>
				<input type="button" id="allBtn"value="전체">
				<input type="button" id="payBtn"value="결제 및 환불">
				<input type="button" id="accountBtn"value="계정">
				<input type="button" id="usingBtn"value="이용안내">
			</form>
		</div>
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
				<c:forEach var="faqDto" items="${list}" varStatus="k">
					<div>
						<div class="title1"><a href="faqViewPage.admin?no=${faqDto.f_no}&page=${page}">${faqDto.f_title}</a></div>
						<div>
						<span class="date1">${faqDto.f_regDate}</span>
						</div>
					</div>	
				</c:forEach>
			</c:if>
			<br/><br/>
			
			<input type="button" value="FAQ추가" onclick="location.href='faqInsertPage.admin'" /><br/>
			<div>
				<span class="paging">${paging}</span>
			</div>
			</section>		
		</div>
</body>
</html>