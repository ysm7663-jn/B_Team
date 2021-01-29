<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp">
	<jsp:param value="BaraON :: 공간목록" name="title"/>
</jsp:include>
<link rel="stylesheet" href="resources/style/place-list.css">

<h1 class="title">어떤 공간을 찾고 있나요?</h1>

<div class="category-wrap">
	<div class="category-list">
		<c:if test="${categoryList eq null}" >
			<h4>아직 카테고리가 없네요!</h4>
		</c:if>
		<c:if test="${categoryList ne null}">
			<c:forEach var="categoryDto" items="${categoryList}" >
				<div class="category">
					${categoryDto.pc_name}
				</div>
			</c:forEach>
		</c:if>
	</div>
</div>

<div class="list-wrap">
	<!-- Todo : 로그인된 회원이 판매자인지 확인 후 판매자면 공간등록버튼 생성 -->
	<h3 class="subtitle">공간 목록</h3>
	<c:if test="${empty list}">
		<div class="empty-list-box" >등록된 공간이 없어요!</div>
	</c:if>
	<c:if test="${not empty list}">
		<div class="place-list-wrap">
		<c:forEach var="placeList" items="${list}" >
			<article class="place-list">
				<a href="placeViewPage.place?no=${placeList.p_no}">
					<img class="list-thumbnail" alt="${placeList.p_title}" src="resources/images/${placeList.p_img}.jpg">
					<div class="place-list-info" >
						<h3>${placeList.p_title}</h3>
						<div class="place-list-detail">
							<span id="place-list-addr"><i class="fas fa-map-marker-alt"></i>${placeList.p_addr}</span>
							<span id="place-list-category"># ${placeList.pc_name}</span><br/>
						</div>
						<div id="info-price">
							<strong class="place-price" >${placeList.minPrice}</strong>
							<span class="txt-unit" >원/일</span>
						</div>
						<div id="info-people-reviews">
							<span>
								<i class="fas fa-user-friends"></i>최대 ${placeList.maxPeople}인
							</span>
							<span>
								<i class="fas fa-comment-dots"></i>${placeList.rvCount}
							</span>
						</div>
					</div>
				</a>
			</article>
		</c:forEach>
		</div>	
	</c:if>
</div>

<%@ include file="../template/footer.jsp" %>