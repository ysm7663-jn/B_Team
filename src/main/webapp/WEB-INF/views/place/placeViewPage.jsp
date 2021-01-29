<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp">
	<jsp:param value="BaraON :: 공간보기" name="title" />
</jsp:include>


<div class="title-area">
	<div class="place-title">
		<h1>제목</h1>
	</div>
	<div class="place-line-desc1">
		<h3>한줄설명</h3>
	</div>
	<div>
		<span>#카테고리명</span>
	</div>
</div>
<section>
	<article>
		<img alt="썸네일" src="resources/images/" >
		
		<div class="place-line-desc2">
			한줄설명 좀 더 크게
		</div>
		<div class="place-nav">
			<ul>
				<li>공간소개</li>
				<li>시설안내</li>
				<li>유의사항</li>
				<li>리뷰</li>
			</ul>
		</div>
		<div class="place-main-info">
			<h3>공간소개</h3>
			<p>
				소개글
			</p>
		</div>
		<div class="place-info">
			<h3>시설안내</h3>
			
		</div>
		<div class="place-remark">
			<h3>유의사항</h3>
		
		</div>
		<div class="place-review">
			<h3>리뷰</h3>
		
		</div>
	
	</article>
	<aside>
	
	</aside>
</section>


<%@ include file="../template/footer.jsp" %>