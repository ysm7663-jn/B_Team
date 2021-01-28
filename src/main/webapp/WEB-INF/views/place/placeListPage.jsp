<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp">
	<jsp:param value="BaraON :: 장소공유" name="title"/>
</jsp:include>

<h3>어떤 공간을 찾고 있나요?</h3>

<h3>오늘의 추천공간</h3>
<div class="list-wrap">
	<!-- Todo : 로그인된 회원이 판매자인지 확인 후 판매자면 공간등록버튼 생성 -->
	<h2>공간 목록</h2>
	<c:if test="${empty list}">
		<div class="empty-list-box" >등록된 공간이 없어요!</div>
	</c:if>
	<c:if test="${not empty list}">
		<div class="place-list-wrap">
		<c:forEach var="placeList" items="${list}" >
			<article class="place-list">
				<a href="placeViewPage.place">
					<img class="list-thumbnail" alt="${list.pTitle}" src="resources/images/${list.pImg}">
					<div class="place-list-info" >
						<h3>${list.pTitle}</h3>
						<div class="place-list-detail">
							<span id="place-list-addr"><i class="fas fa-map-marker-alt"></i>${list.pAddr}</span>
							<span id="place-list-category">#${list.pcName}</span><br/>
						</div>
						<div id="info-price">
							<strong class="place-price" >${list.poMinPrice}</strong>
							<span class="txt-unit" >원/일</span>
						</div>
						<div id="info-people-reviews">
							<span>
								<i class="fas fa-user-friends"></i>최대 ${list.poMaxPeople}인
							</span>
							<span>
								<i class="fas fa-comment-dots"></i>${list.rvCount}
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