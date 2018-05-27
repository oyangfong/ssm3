<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="fm"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>

<div class="right content">
	<div class="location">
		<strong>你现在所在的位置是:</strong> <span>用户管理页面 >> 用户添加页面</span>
	</div>
	<div class="providerAdd">
		<%--文件上传表单的编码类型必须是"multipart/form-data"--%>
		<form id="userForm" name="userForm" method="post"
			action="${pageContext.request.contextPath }/sys/user/doadd.html"
			enctype="multipart/form-data">
			<input type="hidden" name="method" value="add">
			<!--div的class 为error是验证错误，ok是验证成功-->
			<div>
				<label for="userCode">账号：</label> <input type="text"
					name="userCode" id="userCode" value="">
				<!-- 放置提示信息 -->
				<font color="red"></font>
			</div><fm:errors path="userCode"></fm:errors>
			<div>
				<label for="userName">姓名：</label> <input type="text"
					name="userName" id="userName" value=""> <font color="red"></font>
			</div>
			<div>
				<label for="userPassword">密码：</label> <input type="password"
					name="userPassword" id="userPassword" value=""><font color="red"></font>
			</div>
			<div>
				<label for="ruserPassword">确认密码：</label> <input type="password"
					name="ruserPassword" id="ruserPassword" value=""><font color="red"></font>
			</div>
			<div>
				<label>性别：</label> <select name="gender" id="gender">
					<option value="男" selected="selected">男</option>
					<option value="女">女</option>
				</select>
			</div>
			<div>
				<label for="birthday">出生日期：</label> <input type="text" Class="Wdate"
					id="birthday" name="birthday" readonly="readonly"
					onclick="WdatePicker();"> <font color="red"></font>
			</div>
			<div>
				<label for="userState">状态：</label> 
			    <input type="radio" name="userState"  value="1" checked ='checked'>正常
				<input type="radio" name="userState"  value="0">禁用
				<font color="red"></font>
			</div>
			
			<div>
				<label for="job">职称：</label>				
				<select name="job" id="userRole">
				   <!--  <option value="0">请选择职称</option> -->
					<c:forEach items="${roleList}" var="role">
						<option value="${role.roleName}"
							<c:if test="${role.roleName eq '高级教师'}">selected="selected"</c:if>>
							${role.roleName}</option>
					</c:forEach>
				</select> 
				<font color="red"></font>
			</div>
			
			
			<div>
				<label for="institution">事业单位：</label>
				<select name="institution" id="institution">
					<c:forEach items="${institutionList}" var="item">
						<option value="${item}">${item}</option>
					</c:forEach>
				</select> 
				<font color="red"></font>
			</div>
			
				<div>
				<label for="email">邮箱：</label> 
				<input type="text" name="email" id="email">
					<font color="red"></font>
			</div>
			<div>
				<label for="phone">电话：</label> <input type="text" name="phone"  id="phone" >
				<font color="red"></font>
			</div>

			<div>
				<label for="teachingFeature">授课特点：</label> <input type="text"
					name="teachingFeature" id="teachingFeature">
			</div>
			<div>
				<label for="address">详细地址：</label> <input type="text" name="address" id="address">
			</div>
			
		
			
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
			    <input type="hidden" id="summery" name="summery"/>
				<label for="summery">资历简介：</label>
				
				<textarea rows="10" cols="30" name="myeditor"
					id="myeditor"></textarea>
			</div>
			
			<div class="providerAddBtn">
				<input type="button" name="add" id="add" value="保存"> 
				<input type="button" id="back" name="back" value="返回">
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
<%-- <script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/js/getrolelist.js"></script> --%>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/js/useradd.js"></script> 
<script type="text/javascript">  
    // 设置 CKEditor 中的内容
    CKEDITOR.instances.myeditor.setData("${user.summery}");
</script>


