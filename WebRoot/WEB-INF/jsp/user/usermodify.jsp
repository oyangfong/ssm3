<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<div class="right content">
	<div class="location">
		<strong>你现在所在的位置是:</strong> <span>管理页面 >> 修改页面</span>
	</div>

	<div class="providerAdd">
	    <%-- 文件上传表单的编码类型必须是"multipart/form-data"--%>
        <%-- 因设置了"multipart/form-data"，必须在配置文件中配置一个MultipartResolver解析器，才能正确获取提交form中的值--%>
		<form id="userForm" name="userForm" method="post"
			action="${pageContext.request.contextPath }/sys/user/domodify.html" 
			enctype="multipart/form-data">
			<input type="hidden" name="uid" value="${user.id }" />
			<div>
				<label for="userCode">账号：</label> <input type="text" name="userCode"
					id="userCode" value="${user.userCode }"> <font color="red"></font>
			</div>
			<div>
				<label for="userName">姓名：</label> <input type="text" name="userName"
					id="userName" value="${user.userName }"> <font color="red"></font>
			</div>
			<div>
				<label>性别：</label> 
				<input type="radio" name="gender" id="gender" value="男"
					<c:if test="${user.gender eq '男'}" >checked ='checked'</c:if>>男
				<input type="radio" name="gender" id="gender" value="女"
					<c:if test="${user.gender eq '女'}" >checked ='checked'</c:if>>女
				<font color="red"></font>
			</div>

			<div>
				<label for="userState">状态：</label>
				<%-- <input type="text" name="userState" id="userState" value="${user.userState }"> --%>
				<input type="radio" name="userState" id="userState" value="1"
					<c:if test="${user.userState ==1}" >checked ='checked'</c:if>>正常
				<input type="radio" name="userState" id="userState" value="0"
					<c:if test="${user.userState ==0}" >checked ='checked'</c:if>>禁用
				<font color="red"></font>
			</div>
			
			<div>
				<label for="job">职称：</label>
				<%-- <input type="text" name="job" id="job" value="${user.job }">  --%>
				<input type="hidden" value="${user.userRole }" id="rid" /> 
				<select name="job" id="userRole">
					<c:forEach items="${roleList}" var="role">
						<option value="${role.roleName}"
							<c:if test="${user.job eq role.roleName}">selected="selected"</c:if>>
							${role.roleName}</option>
					</c:forEach>
				</select> 
				<font color="red"></font>
			</div>

			<div>
				<label for="institution">事业单位：</label>
				<%-- <input type="text" name="address" id="address" value="${user.address }"> --%>
				<select name="institution" id="institution">
					<c:forEach items="${institutionList}" var="item">
						<option value="${item}">${item}</option>
					</c:forEach>
				</select> 
				<font color="red"></font>
			</div>
			<div>
				<label for="email">邮箱：</label> 
				<input type="text" name="email"
					id="email" value="${user.email }">
					<font color="red"></font>
			</div>
			<div>
				<label for="phone">电话：</label> <input type="text" name="phone"
					id="phone" value="${user.phone }">
					<font color="red"></font>
			</div>

			<div>
				<label for="teachingFeature">授课特点：</label> <input type="text"
					name="teachingFeature" id="teachingFeature"
					value="${user.teachingFeature }">
			</div>
			<div>
				<label for="address">详细地址：</label> <input type="text" name="address"
					id="address" value="${user.address }">
			</div>
			
			<%-- <div>
				<label for="idPicPath">头像：</label> <input type="text"
					name="idPicPath" id="idPicPath" value="${user.idPicPath }">
			</div> --%>
			
			<!--** 文件上传  CommonsMultipartResolver(spring3.0以前的版本) **-->
           <div> 
                <input type="hidden" id="errorinfo" value="${uploadFileError}"/>
				<label for="a_idPicPath">头像：</label> 
				<tr>
				<td><img alt="" src="${pageContext.request.contextPath }${user.idPicPath}"/></td>
				<td><input name="a_idPicPath"  id="a_idPicPath" type="file"/></td>
				</tr>
			</div>		
			
		    <!--** //文件上传 **-->
			</div>
			<div>
			  <%--   <input type="hidden" id="summery" name="summery" value="${user.summery }"/> --%>
				<label for="summery">资历简介：</label>
				
				<textarea rows="10" cols="30" name="summery" 
					id="myeditor">${user.summery}</textarea>
			</div>
			<div class="providerAddBtn">
				<input type="button" name="save" id="save" value="保存" /> 
				<input type="button" id="back" name="back" value="返回" />
			</div>
			
			
		</form>
	</div>
</div>
</section>
<%@include file="/WEB-INF/jsp/common/foot.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery.validate.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/ckeditor/ckeditor.js"></script> 

<script type="text/javascript">

CKEDITOR.replace("myeditor", { 
toolbar: [ 
['Bold','Italic','Underline','Strike'], ['Cut','Copy','Paste'], 
['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'], 
['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'] 
] 
}); 

</script>

<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/usermodify.js"></script>

