<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <style type="text/css">
        #wrap {
            width: 490px;
            text-align :center;
            margin: 0 auto 0 auto;
        }
        
        #chk{
            text-align :center;
        }
        
        #cancelBtn{
            visibility:visible;
        }
</style>
<script type="text/javascript">
function openPop(){
    var popup = window.open('profile.jsp', '', 'width=700px,height=800px');
}

</script>
</head>
<body>
	<div id="wrap">
	    <br>
	  	  <b><font size="4" color="gray">비밀번호 확인</font></b>
	    <hr size="1" width="460">
	    <br>
	    <div id="chk">
	        <form id="checkForm">
	            <input type="text" name="pwinput" id="userPw">
	            <input type="button" value="확인" onclick="pwCheck()">
	        </form>
	    <div id="msg"></div>
	        <input id="cancelBtn" type="button" value="취소" onclick="window.close()"><br>
    	</div>
	</div> 
</body>
</html>


<%@ include file="../template/footer.jsp" %>
