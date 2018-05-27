<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>系统登录 - 师资档案管理平台</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/style.css" />
   <style type="text/css">
      .loginForm{
        border:1px solid gray;
        width:400px;
        height:200px;
      }
      
      
     
   </style>
</head>
<body class="login_bg">
    <section class="loginBox">
        <header class="loginHeader">
            <h1>师资档案平台</h1>
        </header>
        <section class="loginCont">
	        <form class="loginForm" action="${pageContext.request.contextPath }/dologin.html"
	        name="loginForm" id="loginForm"  method="post" >
				<div class="info">${error}</div>
				<div class="inputbox">   
					<input type="text" class="input-text" id="userCode" name="userCode" 
					placeholder="请输入用户名" /><!-- required -->
				</div>	
				<div class="inputbox">           
                    <input type="password" id="userPassword" name="userPassword" placeholder="请输入密码" /><!-- required -->
                </div>	
                
                <div class="inputbox">                  
                      <input type="text"  id="valiCode" name="valiCode"  placeholder="验证码" /><!--required  -->
                      <label><img id="getValidateCode" title="点击更换"/></label>   
                </div>
                			
                <div class="subBtn">
                    <input type="button" class="btn btn-primary btn-lg" value="管理员登录" id="btnLogin"/>
                    <!-- <input type="reset" value="重置"/> -->
                </div>	
			</form>
        </section>
    </section>
    
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery-1.12.4.js"></script>   
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery.validate.js"></script>   
<script type="text/javascript">
    //获取验证码 
    //加载即触发该按钮的单击事件
    $("#getValidateCode").click(function(){
    	this.src ="${pageContext.request.contextPath}/getValidateCode.html?t=" + Math.random();
    }).click().show();
    
    
    //表单验证规则及提示信息设置
    $("#loginForm").validate({
      rules:{
      "userCode": {required: true},
      "userPassword":{required: true}
      },
      messages:{  
       "userCode":{required: "<font color='red'>登录账号不能为空</font>"},
       "userPassword":{required: "<font color='red'>密码不能为空</font>"}
      }
    
    });
    
    //验证通过，提交表单
    $("#btnLogin").click(function(){
      if($("#loginForm").valid()){
        $("#loginForm").submit();
      }
    });
</script>
</body>
</html>
