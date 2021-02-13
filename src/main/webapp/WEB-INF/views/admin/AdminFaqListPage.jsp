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
		location.href = 'adminFaqListPage.admin?f_category=${faqDto.f_category}' + 1;
	});
	}
	function fn_payList() {
	$('#payBtn').click(function(){
		location.href = 'adminFaqListPage.admin?f_category=${faqDto.f_category}' + 2;  // location은 get 방식의 요청이고, 별도 파라미터를 가지고 가지 않기 때문에 ?로 직접 파라미터를 추가해서 보내줘야 합니다. 컨트롤러는 request에 f_category가 저장되어 있다고 보면 됩니다. 
	});
	}
	function fn_accountList(){
	$('#accountBtn').click(function(){
		location.href = 'adminFaqListPage.admin?f_category=${faqDto.f_category}' + 3; 
	});
	}
	function fn_usingList(){
	$('#usingBtn').click(function(){
		location.href = 'adminFaqListPage.admin?f_category=${faqDto.f_category}' + 4; 
	});
	}
</script>
<title></title>
<link rel="stylesheet" href="resources/style/common.css">
<style type="text/css">
	 a:link { color: black; text-decoration: none;}
 	 a:visited { color: black; text-decoration: none;}
	 a:hover { color: blue; text-decoration: underline;}
	 
	 #wrap{
	 	height: 600px;
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
	 #allBtn,#payBtn,#accountBtn,#usingBtn{
	 	background: none;
		border: none;
		font-size: 16px;
		margin: 0 20px 0 20px;
		font-weight: 600px;
	 }
</style>
</head>
<body>
	<div id="wrap" style="width :1020px; margin: 0 auto;">
	<br/>
	<h1>자주묻는질문(FAQ) - 관리자모드</h1><br/>
	<h3>전체 : ${totalRecord}개 FAQ</h3>
	<input type="button" value="FAQ추가" style="float:right; width:100px" onclick="location.href='faqInsertPage.admin'" /><br/><br/>
	<div  style="display: flex; flex-direction: column;">
		<div style="text-align: center">
			<form>
				<input type="button" id="allBtn"value="전체">
				<input type="button" id="payBtn"value="결제 및 환불">
				<input type="button" id="accountBtn"value="계정">
				<input type="button" id="usingBtn"value="이용안내">
			</form><br/>
		</div>
			<section>
				<div style="background:#3ED0C8">
						<div style="width:620px; margin: 0 auto; height:50px; line-height:50px;
						float: left; text-align: center; 
						font-size: 24px; background:#3ED0C8; border-top: 1px solid black; border-bottom: 1px solid black">
							제목
						</div>
						<div style="width:400px; margin: 0 auto; height:50px; line-height:50px;
						float: left; text-align: center;  
						font-size: 24px; background:#3ED0C8; border-top: 1px solid black; border-bottom: 1px solid black">
							작성일
						</div>
				</div>
			</section>
			<section class="content">
			<c:if test="${empty list}"></c:if>
			<c:if test="${not empty list}">
				<c:forEach var="faqDto" items="${list}" varStatus="k">
						<div style="width:620px; margin: 0 auto; float: left; text-align: center; border-bottom: 1px solid black; height:40px; line-height:40px">
							<a href="faqViewPage.admin?no=${faqDto.f_no}&page=${page}">${faqDto.f_title}</a>
						</div>
						<div style="width:400px; margin: 0 auto; float: left; text-align: center; border-bottom: 1px solid black; height:40px; line-height:40px;">
							${faqDto.f_regDate}
						</div>
				</c:forEach>
			</c:if>
			<br/><br/>
			<div id="paging"style="width:1020px; margin: 0 auto; float: left; text-align: center; font-weight: 800px; font-size: 20px">
				${paging}
			</div>
			</section>		
		</div>
	</div>
	<%@ include file="../template/footer.jsp" %>
</body>
</html>