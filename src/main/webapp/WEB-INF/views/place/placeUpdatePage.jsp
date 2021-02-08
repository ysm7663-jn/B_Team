<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../template/header.jsp">
	<jsp:param name="title" value="BaraON :: 공간 수정" />
</jsp:include>

<script>
    $(function(){
        $(".btn").on("click",function(event){
            console.log('btn this : '+$(this));
            console.log('btn event.currentTarget : '+$(event.currentTarget));
            console.log('btn event.target : '+$(event.target));
        });


        $("#outer").on("click",function(event){
            console.log('#outer this : '+$(this));
            console.log('#outer event.currentTarget : '+$(event.currentTarget));
            console.log('#outer event.target : '+$(event.target));
        })
    })
</script>

<input type="button" class="btn" value ="btn1">
<input type="button" class="btn" value ="btn2">
<input type="button" class="btn" value ="btn3">

<div id="outer">
    <input type="button"  value ="OuterB" id ="OuterB">
    <div id="inner">
        <input type="button" class="btn" value ="InnerB" id ="InnerB">
    </div>
</div>


<%@ include file="../template/footer.jsp" %>