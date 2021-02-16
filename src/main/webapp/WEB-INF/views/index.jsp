<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<%-- 머리글 포함(파라미터(title)가 있으므로 동적 페이지 포함) --%>
<jsp:include page="template/header.jsp" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js" integrity="sha512-XtmMtDEcNz2j7ekrtHvOVR4iwwaD6o/FUJe6+Zq+HgcCsk3kj4uSQQR8weQ2QVj1o0Pk6PwYLohm206ZzNfubg==" crossorigin="anonymous"></script>
<script>
	$(function(){
		$('.event-slider').slick({
			autoplay:true,
			autoplaySpeed:1000,
			nextArrow:$('.next'),
			prevArrow:$('.prev'),
			dots:true
		});
		$('.club-slide').slick({
			slidesToShow:3,
			slidesToScroll:1,
			autoplay:true,
			autoplaySpeed:1000,
			centerMode: true,
			centerPadding: '60px'
		});
	});
</script>
<link rel="stylesheet" href="resources/style/index.css" />
<link rel="stylesheet" href="resources/style/slick-1.8.1/slick/slick-theme.css" />
<link rel="stylesheet" href="resources/style/slick-1.8.1/slick/slick.css" />
	
	<section class="slide-wrap">
		<div class="prev">
			<i class="fas fa-chevron-left"></i>
		</div>
		<div class="next">
        	<i class="fas fa-chevron-right"></i>
        </div>
		<div class="event-slider">
			<div class="event-list">
				<img src="resources/images/car.jpg" />
			</div>
			<div class="event-list">
				<img src="resources/images/bottles.jpg" />
			</div>
			<div class="event-list">
				<img src="resources/images/books.jpg" />
			</div>
			<div class="event-list">
				<img src="resources/images/car.jpg" />
			</div>
			<div class="event-list">
				<img src="resources/images/bottles.jpg" />
			</div>
			<div class="event-list">
				<img src="resources/images/books.jpg" />
			</div>
			<div class="event-list">
				<img src="resources/images/car.jpg" />
			</div>
			<div class="event-list">
				<img src="resources/images/bottles.jpg" />
			</div>
			<div class="event-list">
				<img src="resources/images/books.jpg" />
			</div>
		</div>
	</section>
			
	<section class="main">
		<article id="main-event">
			<div class="main-subtitle">
				<div class="subtitle-wrap">
					<div class="larger-subtitle">
						EVENT
					</div>
					<div class="smaller-subtitle">
						BaraON 이벤트
					</div>
				</div>
				<div class="plus">
					<a href="eventListPage.event">+ 더 보기</a>
				</div>
			</div>
			<hr>
			<div class="main-content">
				<c:if test="${empty eventList}">
					진행중인 이벤트가 없습니다.
				</c:if>
				<c:if test="${not empty eventList}">
					<c:forEach var="eventDto" items="${eventList}" >
						<a href="eventViewPage.event?no=${eventDto.e_no}&page=1">
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
				<div class="subtitle-wrap">
					<div class="larger-subtitle">
						NOTICE
					</div>
					<div class="smaller-subtitle">
						공지사항
					</div>
				</div>
				<div class="plus">
					<button type="button" onclick="location.href='noticeListPage.notice'">+</button>
				</div>
			</div>
			<hr>
			<div class="main-content">
				<c:if test="${empty noticeList}">
					등록된 공지사항이 없습니다.
				</c:if>
				<c:if test="${not empty noticeList}">
					<c:forEach var="noticeDto" items="${noticeList}" >
						<a href="noticeViewPage.notice?no=${noticeDto.n_no}&page=1">
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
				<div class="subtitle-wrap">
					<div class="larger-subtitle">
						FAQ
					</div>
					<div class="smaller-subtitle">
						자주묻는질문
					</div>
				</div>
				<div class="plus">
					<button type="button" onclick="location.href='faqListPage.faq'">+</button>
				</div>
			</div>
			<hr>
			<div class="main-content">
				<c:if test="${empty faqList}">
					등록된 자주묻는 질문이 없습니다.
				</c:if>
				<c:if test="${not empty faqList}">
					<c:forEach var="faqDto" items="${faqList}" >
						<a href="faqViewPage.faq?no=${faqDto.f_no}&page=1">
							<div class=row">
								<div class="dot"></div>
								<div class="board-title">${faqDto.f_title}</div>
								<div class="board-date">${faqDto.f_regDate}</div>
							</div>
						</a>
					</c:forEach>
				</c:if>
			</div>
		
		</article>
		<article id="main-club">
			<div class="main-subtitle">
				<div class="subtitle-wrap">
					<div class="larger-subtitle">
						BaraON
					</div>
					<div class="smaller-subtitle">
						모임
					</div>
				</div>
				<div class="plus">
					<a href="clubListPage.club">+ 더 보기</a>
				</div>
			</div>
			<hr/>
			<div class="main-content">
				<c:if test="${empty clubList}">
					<div class="not-exist">
						<span class="not-exist"><i class="fas fa-sad-tear"></i>등록된 클럽이 없습니다.</span>
					</div>
				</c:if>
				<c:if test="${not empty clubList}">
					<div class="club-slide">
						<c:forEach var="clubDto" items="${clubList}" >
							<a href="clubViewPage.club?c_no=${clubDto.c_no}">
								<div class="club-card">
									<img src="resources/images/club/${clubDto.c_mainImg}" />
									<div class="club-card-title">
										<span class="text-stroke">${clubDto.c_title}</span>
									</div>
									<div class="club-card-desc">
										<span class="text-stroke">${clubDto.c_desc}</span>
									</div>
								</div>
							</a>
						</c:forEach>
					</div>
				</c:if>
			</div>
		
		</article>
		
		<article id="main-place">
			<div class="main-subtitle">
				<div class="subtitle-wrap">
					<div class="larger-subtitle">
						BaraON
					</div>
					<div class="smaller-subtitle">
						공간
					</div>
				</div>
				<div class="plus">
					<a href="placeListPage.place">+ 더 보기</a>
				</div>
			</div>
			<hr/>
			<div class="main-content">
				<c:if test="${empty clubList}">
					<div class="not-exist">
						
					</div>
				</c:if>
				<c:if test="${not empty clubList}">
					<div class="club-slide">
						<c:forEach var="clubDto" items="${clubList}" >
							<a href="clubViewPage.club?c_no=${clubDto.c_no}">
								<div class="club-card">
									<img src="resources/images/club/${clubDto.c_mainImg}" />
									<div class="club-card-title">
										<span class="text-stroke">${clubDto.c_title}</span>
									</div>
									<div class="club-card-desc">
										<span class="text-stroke">${clubDto.c_desc}</span>
									</div>
								</div>
							</a>
						</c:forEach>
					</div>
				</c:if>
			</div>
		
		</article>
	</section>

<%@ include file="template/footer.jsp" %>