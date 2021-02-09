<%@page import="org.springframework.ui.Model"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="myPage.jsp" />

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w==" crossorigin="anonymous" />
<link rel="stylesheet" href="resources/style/myPage/clubList.css">	
<script>
	function fn_quit(f){
		if(confirm('모임을 나가시면 해당 모임에 대한 정보는 전부 사라집니다.               나가시려면 "확인" 취소하시려면 "취소"를 눌러주세요.')) {
			f.action = 'clubListDelete.myPage';
			f.submit();
		}
	}
	/* if('${delete}') { //clubDelete에서 왔으면
		alert('${delete}');
		alert('${deleteResult}');
		if('${deleteResult} != 1') {
			alert('일시적인 오류가 발생했습니다. 다시 시도해주세요.');			
		}
	} */
	
	if(${param.state == 1}) {  // 지난 모임이면
		$('.empty').html('진행했던 모임이 없습니다.');
		$('.quit').remove();
	}
</script>
	<div class="mypage_contents">
		<h2>번개 모임</h2>
		<hr class="top">
			
		<ul class="state">
			<li>
				<a href="regularClub.myPage?state=0">진행중&nbsp;</a>
			</li>
			<li>
				<a href="regularClub.myPage?state=1">지난모임</a>
			</li>
		</ul>	
				
		<c:if test="${empty list}">
			<div><i class="fas fa-exclamation-circle"></i></div>
			<div>진행중인 모임이 없습니다.</div>
		</c:if>
		<c:if test="${not empty list}">
			<div class="clubwrap">
				<c:forEach var="regularClubListDto" items="${list}">
					<div class="clubList">
						<div class="clubImage"><a href=""><img alt="모임이미지" src="resources/images/club/${regularClubListDto.c_mainimg}"></a></div>
						<hr class="section">
						<div class="clubContent">
							<div class="title">${regularClubListDto.c_title}</div>
							<div class="content">${regularClubListDto.c_content}</div><br/>
						</div>
						<div class="summary">
							<div class="readerName"><i class="fas fa-user-circle"></i>&nbsp;${regularClubListDto.m_no}&nbsp;&nbsp;<span class="reader">리더</span></div><br/>
							<div class="startDate">${regularClubListDto.c_startDate} 첫 모임</div><br/>
						</div>
						<div class="cl_card">
							<script>
								$('.cl_card').empty();
								var count = ${regularClubListDto.cl_card};
								for(var num in count) {
									$('.cl_card').append('<span><i class="fas fa-bookmark"></i></span>');
								}
							</script>	
						</div><br/><br/>
						<div class="quit">
							<form method="post">
								<!-- hidden -->
								<input type="hidden" name="clubNo" value="0" />
								<input type="hidden" name="clNo" value="${regularClubListDto.cl_no}" />
								<input type="button" value="Quit >" onclick="fn_quit(this.form)" />
							</form>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>
	</div>
</div>
<%@ include file="../template/footer.jsp" %>