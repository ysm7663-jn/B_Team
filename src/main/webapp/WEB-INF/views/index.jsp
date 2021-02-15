<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<%-- 머리글 포함(파라미터(title)가 있으므로 동적 페이지 포함) --%>
<jsp:include page="template/header.jsp" />
	
	<div class="slick-slide">
		
	</div>
			
	<section class="main">
		<article id="main-event">
			<div class="main-subtitle">
				<div class="larger-subtitle">
					EVENT
				</div>
				<div class="smaller-subtitle">
					BaraON 이벤트
				</div>
				<div>
					<a href="adminEventListPage.admin">+ 더 보기</a>
				</div>
			</div>
			<div class="main-content">
				<c:if test="${eventList eq null}">
					<div>
						진행중인 이벤트가 없습니다.
					</div>
				</c:if>
				<c:if test="${eventList ne null}">
					<c:forEach var="eventDto" items="${eventList}" >
						<a href="eventViewPage.admin?no=${eventDto.e_no}">
							<div>
								<img src="resources/images/EventImages/${eventDto.e_filename}" />
							</div>
						</a>
					</c:forEach>
				</c:if>
			</div>
		</article>
		<article id="main-notice">
			<div class="main-subtitle">
				<div class="larger-subtitle">
					NOTICE
				</div>
				<div class="smaller-subtitle">
					공지사항
				</div>
				<div>
					<a href="adminNoticeListPage.admin">+</a>
				</div>
			</div>
			<div class="main-content">
				<c:if test="${noticeList eq null}">
					<div class="not-exist">등록된 공지사항이 없습니다.</div>
				</c:if>
				<c:if test="${noticeList ne null}">
					<c:forEach var="noticeDto" items="${noticeList}" >
						<a href="noticeViewPage.admin?no=${noticeDto.n_no}">
							<div class="row">
								<div class="dot"></div>
								<div class="board-title">${noticeDto.n_title}</div>
								<div class="board-date">${noticeDto.n_postDate}</div>
							</div>
						</a>
					</c:forEach>
				</c:if>
			</div>
		
		</article>
		<article id="main-faq">
			<div class="main-subtitle">
				<div class="larger-subtitle">
					FAQ
				</div>
				<div class="smaller-subtitle">
					자주묻는질문
				</div>
				<div>
					<a href="adminFaqListPage.admin">+</a>
				</div>
			</div>
			<div class="main-content">
				<c:if test="${faqList eq null}">
					<div class="not-exist">등록된 자주묻는 질문이 없습니다.</div>
				</c:if>
				<c:if test="${faqList ne null}">
					<c:forEach var="faqDto" items="${faqList}" >
						<a href="faqViewPage.admin?no=${faqDto.f_no}">
							<div class=row">
								<div class="dot"></div>
								<div class="board-title">${faqDto.f_title}</div>
								<div class="board-date">${faqDto.f_postDate}</div>
							</div>
						</a>
					</c:forEach>
				</c:if>
			</div>
		
		</article>
		<article id="main-club">
			<div class="main-subtitle">
			
			</div>
			<div class="main-content">
			
			</div>
		
		</article>
	</section>

<%@ include file="template/footer.jsp" %>