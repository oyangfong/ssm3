<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
    <div class="right">
        <img class="wColck" src="${pageContext.request.contextPath }/images/clock.jpg" alt=""/>
        <div class="wFont">
            <h2>${userSession.userName }</h2>
            <p>欢迎来到师资档案管理系统!</p>
        </div>
        <div>
          <a href="sys/user/add.html" id="doadd">添加</a>
        </div>
        <div class="content">
        <table class="table table-striped table-bordered" >
        <tr>
          <td>序号</td>
           <td>账号</td>
            <td>姓名</td>
             <td>性别</td>
              <td>职称</td>
               <td>事业单位</td>
                <td>电话</td>
                 <td>邮箱</td>
                  <td>操作</td>
        </tr>
        <c:forEach items="${userList}" var="user">
           <tr>
          <td>${user.id}</td>
           <td>${user.userCode}</td>
            <td>${user.userName}</td>
             <td>${user.gender}</td>
              <td>${user.job}</td>
               <td>${user.address}</td>
                <td>${user.phone}</td>
                 <td>${user.email}</td>
                  <td><span>
				  <a class="viewUser" href="#" 
				        userid=${user.id } username=${user.userName }>编辑</a>
				</span> <span>
				  <a class="deleteUser" href="#" 
				        userid=${user.id } username=${user.userName }>禁用</a>
				</span></td>
        </tr>
        </c:forEach>
        </table>
        <input type="hidden" id="totalPageCount" value="${page.totalPageCount}" />
	<c:import url="/WEB-INF/jsp/rollpage.jsp">
		<c:param name="totalCount" value="${page.totalCount}" />
		<c:param name="currentPageNo" value="${page.currentPageNo}" />
		<c:param name="totalPageCount" value="${page.totalPageCount}" />
	</c:import>
        </div>
    </div>
</section>
<%@include file="/WEB-INF/jsp/common/foot.jsp" %>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/js/userlist.js"></script>
	
	<script>
	  $("#doadd").on("click",function(){
	    
	  });
	</script>