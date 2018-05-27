<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="fm"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
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
 <fm:form method="post" modelAttribute="user" action="sys/user/doadd2.html" enctype="multipart/form-data">
     <fm:errors path="userCode"/><br/>
	用户编码:<fm:input path="userCode"/> <br/>
	<%-- <fm:errors path="userName"/><br/>
	用户名称:<fm:input path="userName"/> <br/>
	 <fm:errors path="userPassword"/><br/>
	用户密码:<fm:password path="userPassword"/> --%> <br/>
	
	
	
	
	<input type="file" name="a_workIdPicPath" id="a_workIdPicPath" accept="image/jpg,image/jpeg,image/png,image/gif">
    <input type="submit" value="保存"/>

</fm:form>
  </body>
</html>
