<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="/WEB-INF/jsp/common/head.jsp"%>

<div class="right content">
	<div class="location">
		<strong>你现在所在的位置是:</strong> <span>师资档案管理页面</span>
	</div>
	<div class="search">
		<form method="get"
			action="${pageContext.request.contextPath }/sys/user/list2.html">
			<input name="method" value="query" class="input-text" type="hidden">
			<span>讲师账号：</span> 
			<input name="queryUserCode" class="input-text" type="text" value="${queryUserCode}"> 
			<span>讲师姓名：</span> 
			<input name="queryUserName" class="input-text" type="text" value="${queryUserName}"> 
			
			<!-- 设置当前页码参数值 -->
			<input type="hidden" name="currentPageNo" value="1" /> 
			
			<input value="查 询" type="submit" id="searchbutton"> 
			<!-- <input value="批量禁用" type="submit" id="forbiddenbutton">  -->
			<a href="#" id="batchModifyUserState">批量禁用</a>
			<%-- <a href="${pageContext.request.contextPath}/sys/user/add">添加用户</a> --%>
		</form>
	</div>
	<div>
	<!--用户#DCDCDC-->
	<table class="providerTable" cellpadding="0" cellspacing="0">
		<tr class="firstTr">
		    <th width="5%">序号<input type="checkbox" id="selectAll"/></th>
			<th width="10%">账号</th>
			<th width="20%">姓名</th>
			<th width="10%">性别</th>
			<th width="10%">职称</th>
			<th width="10%">事业单位</th>
			<th width="10%">电话</th>
			<th width="10%">邮箱</th>
			<th width="15%">操作</th>
		</tr>
		 <c:forEach items="${teacherList}" var="user" varStatus="status">
           <tr <c:if test="${status.index%2!=0}">style="background-color:#F0F0F0"</c:if>>
          <td><input type="checkbox" name="checkItem" value="${user.id}"/>&nbsp;${user.id}</td>
           <td>${user.userCode}</td>
            <td>${user.userName}</td>
             <td>${user.gender}</td>
              <td>${user.job}</td>
               <td>${user.institution}</td>
                <td class="phone">${user.phone}</td>
                 <td>${user.email}</td>
                  <td><span>
				  <a class="modifyUser" href="#" userid=${user.id } username=${user.userName }>编辑</a>
				</span> <span>
				  <a class="deleteUser" href="#" userid=${user.id } username=${user.userName }>禁用</a>
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

<%-- 增加一个div区域用于显示用户的明细信息--%>
<div class="providerAdd userdetail" style="display:none">
	<div>
		<label>账号：</label> <input type="text" id="v_userCode" value=""
			readonly="readonly">

	</div>
	<div>
		<label>姓名：</label> <input type="text" id="v_userName" value=""
			readonly="readonly">

	</div>
	<div>
		<label>性别：</label> <input type="text" id="v_gender" value=""
			readonly="readonly">
	</div>
<!-- 	<div>
		<label>出生日期：</label> <input type="text" Class="Wdate" id="v_birthday"
			value="" readonly="readonly" onclick="WdatePicker();">

	</div> -->

<div>
		<label>职称：</label> <input type="text" id="v_job" value=""
			readonly="readonly">

	</div>
	<div>
		<label>事业单位：</label> <input type="text" id="v_institution" value=""
			readonly="readonly">

	</div>
	<div>
		<label>电话：</label> <input type="text" id="v_phone" value=""
			readonly="readonly">

	</div>
	<div>
		<label for="email">邮箱：</label> <input type="text"
			id="v_email" value="" readonly="readonly">
	</div>
<!-- 	<div>
		<label>用户角色：</label> <input type="text" id="v_userRoleName" value=""
			readonly="readonly">

	</div> -->
</div>

 
</div>


</section>

<!--点击删除/禁用按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeUse">
	<div class="removerChid">
		<h2>提示</h2>
		<div class="removeMain">
			<p>你确定要删除/禁用该用户吗？</p>
			<a href="#" id="yes">确定</a> <a href="#" id="no">取消</a>
		</div>
	</div>
</div>



<%@include file="/WEB-INF/jsp/common/foot.jsp"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/js/userlist.js"></script>


<script type="text/javascript">
$(function(){
  //js控制手机号码中间用星号代替
 $(".phone").each(function(){
     var strObj=$(this).html();
     var phone=strObj.replace(/(\d{3})\d{5}(\d{3})/, "$1****$2");
     $(this).html(phone);
  });
});
 
</script>
