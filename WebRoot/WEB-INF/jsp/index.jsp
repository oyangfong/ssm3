<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
  <c:forEach items="${userList}" var="user">
     ${user.userCode}<br/>
  </c:forEach>
  
  <p>==============================================</p>
  <button class="btn">click me</button>
  <div class="userinfo">
  
  </div>
  
  
  
   <script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery-1.12.4.js"></script>
   <script type="text/javascript">
     $(function(){
       $(".btn").click(function(){
         $.ajax({
           url:"index2.html",
           data:{from:1},
           dataType:"json",
           success:function(result){
            
             for(i in result){
               $(".userinfo").html(result[i].userCode+" "+result[i].age+"<br/>");
             }
           }
           
         });
       });
     });
   </script>
  </body>
</html>
