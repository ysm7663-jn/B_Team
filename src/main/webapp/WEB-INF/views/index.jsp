<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<%-- 머리글 포함(파라미터(title)가 있으므로 동적 페이지 포함) --%>
<jsp:include page="template/header.jsp" />
	
	<div id="main_img">
		
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
			</div>
			<div class="main-content">
				<c:if test="${eventList eq null}">
					<c:forEach var="" >
						<a src="resources/images/"
					
					</c:forEach>
				</c:if>
			</div>
		</article>
		<article id="main-notice">
			<div class="main-subtitle">
				
			</div>
			<div class="main-content">
			
			</div>
		
		</article>
		<article id="main-faq">
			<div class="main-subtitle">
			
			</div>
			<div class="main-content">
			
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