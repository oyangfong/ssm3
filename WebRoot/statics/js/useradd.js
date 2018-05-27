var userCode=null;
var userName = null;
var userPassword=null;
var gender = null;
var phone = null;

var userState=null;
var userRole = null;
var institution=null;
var email=null;

var birthday=null;
var phone=null;
var teachingFeature=null;
var address=null;
var a_idPicPath=null;

var summery=null;


var addBtn = null;
var backBtn = null;


$(function(){
	userCode = $("#userCode");
	userName = $("#userName");
	userPassword=$("#userPassword");
	ruserPassword=$("#ruserPassword");
	gender = $("#gender");
	birthday = $("#birthday");

	userRole = $("#userRole");
	//job = $("#userRole");
	institution = $("#institution");
	email = $("#email");
	phone = $("#phone");

	teachingFeature = $("#teachingFeature");
	address = $("#address");
	a_idPicPath = $("#a_idPicPath");
	summery = $("#summery");
	
	addBtn = $("#add");
	backBtn = $("#back");
	
	
	
  
     //表单非空验证规则及提示信息设置
    $("#userForm").validate({
      rules:{
      "userCode": {required: true},
      "userName":{required: true},
      "userPassword":{required: true},
      "ruserPassword":{required: true,equalTo:"#userPassword"},
      "userRole":{required: true},
      "institution":{required: true},
      "email":{required: true},
      "phone":{required: true},
      "teachingFeature":{required: true},
      "address":{required: true},
      "summery":{required: true}
      },
      messages:{  
       "userCode":{required: "<font color='red'>账号不能为空</font>"},
       "userName":{required: "<font color='red'>姓名不能为空</font>"},
       "userPassword":{required: "<font color='red'>密码不能为空</font>"},
       "ruserPassword":{required:"<font color='red'>确认密码不能为空</font>", equalTo:"<font color='red'>确认密码与密码不一致</font>"},

       "userRole":{required: "<font color='red'>职称不能为空</font>"},
       "institution":{required: "<font color='red'>事业单位不能为空</font>"},
       "email":{required: "<font color='red'>邮箱不能为空</font>"},
       "phone":{required: "<font color='red'>电话不能为空</font>"},

       "teachingFeature":{required: "<font color='red'>授课特点不能为空</font>"},
       "address":{required: "<font color='red'>详细地址不能为空</font>"},
       "summery":{required: "<font color='red'>资历简介不能为空</font>"}
      }   
    });
	





	//初始化的时候，要把所有的提示信息变为：* 以提示必填项，更灵活，不要写在页面上
	userCode.next().html("*");
	userName.next().html("*");
	userPassword.next().html("*");
	ruserPassword.next().html("*");
	phone.next().html("*");
	//birthday.next().html("*");
	userRole.next().html("*");
	
	gender.next().next().html("*");
	institution.next().html("*");

	

	
/*	 * 验证
	 * 失焦\获焦
	 * jquery的方法传递*/
	 
	userCode.bind("blur",function(){
		//前端验证
		//ajax后台验证--userCode是否已存在
		$.ajax({
			type:"GET",
			url:path+"/sys/user/checkUserExist.html",
			data:{"userCode":userCode.val()},
			dataType:"json",
			success:function(data){
				if(data=="isempty"){
					validateTip(userCode.next(),{"color":"red"},imgNo+ " 用户账号不允许为空",false);
				}else if(data == "exist"){//账号已存在，错误提示
					validateTip(userCode.next(),{"color":"red"},imgNo+ " 该用户账号已存在",false);
				}else{//账号可用，正确提示
					validateTip(userCode.next(),{"color":"green"},imgYes+" 该账号可以使用",true);
				}
			},
			error:function(data){//当访问时候，404，500 等非200的错误状态码
				validateTip(userCode.next(),{"color":"red"},imgNo+" 您访问的页面不存在",false);
			}
		});
		
		
	}).bind("focus",function(){
		//显示友情提示
		validateTip(userCode.next(),{"color":"#666666"},"* 用户编码是您登录系统的账号",false);
	}).focus();
	
	
	userName.bind("focus",function(){
		validateTip(userName.next(),{"color":"#666666"},"* 用户名长度必须是大于1小于10的字符",false);
	}).bind("blur",function(){
		if(userName.val() != null && userName.val().length > 1
				&& userName.val().length < 10){
			validateTip(userName.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(userName.next(),{"color":"red"},imgNo+" 用户名输入的不符合规范，请重新输入",false);
		}
		
	});
	
	userPassword.bind("focus",function(){
		validateTip(userPassword.next(),{"color":"#666666"},"* 密码长度必须是大于6小于20",false);
	}).bind("blur",function(){
		if(userPassword.val() != null && userPassword.val().length > 6
				&& userPassword.val().length < 20 ){
			validateTip(userPassword.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(userPassword.next(),{"color":"red"},imgNo + " 密码输入不符合规范，请重新输入",false);
		}
	});
	
	ruserPassword.bind("focus",function(){
		validateTip(ruserPassword.next(),{"color":"#666666"},"* 请输入与上面一只的密码",false);
	}).bind("blur",function(){
		if(ruserPassword.val() != null && ruserPassword.val().length > 6
				&& ruserPassword.val().length < 20 && userPassword.val() == ruserPassword.val()){
			validateTip(ruserPassword.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(ruserPassword.next(),{"color":"red"},imgNo + " 两次密码输入不一致，请重新输入",false);
		}
	});
	
	
	birthday.bind("focus",function(){
		validateTip(birthday.next(),{"color":"#666666"},"* 点击输入框，选择日期",false);
	}).bind("blur",function(){
		if(birthday.val() != null && birthday.val() != ""){
			validateTip(birthday.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(birthday.next(),{"color":"red"},imgNo + " 选择的日期不正确,请重新输入",false);
		}
	});
	
	phone.bind("focus",function(){
		validateTip(phone.next(),{"color":"#666666"},"* 请输入手机号",false);
	}).bind("blur",function(){
		var patrn=/^(13[0-9]|15[0-9]|18[0-9])\d{8}$/;
		if(phone.val().match(patrn)){
			validateTip(phone.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(phone.next(),{"color":"red"},imgNo + " 您输入的手机号格式不正确",false);
		}
	});
	
/*	userRole.bind("focus",function(){
		validateTip(userRole.next(),{"color":"#666666"},"* 请选择用户角色",false);
	}).bind("blur",function(){
		if(userRole.val() != null && userRole.val() > 0){
			validateTip(userRole.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(userRole.next(),{"color":"red"},imgNo + " 请重新选择用户角色",false);
		}
	});
	
	*/
	
	 addBtn.bind("click",function(){
		if(userCode.attr("validateStatus") != "true"){
			userCode.blur();
		}else if(userName.attr("validateStatus") != "true"){
			userName.blur();
		}else if(userPassword.attr("validateStatus") != "true"){
			userPassword.blur();
		}else if(ruserPassword.attr("validateStatus") != "true"){
			ruserPassword.blur();
		}else if(birthday.attr("validateStatus") != "true"){
			birthday.blur();
		}else if(phone.attr("validateStatus") != "true"){
			phone.blur();
		}/*else if(userRole.attr("validateStatus") != "true"){
			userRole.blur();
		}*/else{
			if(confirm("是否确认提交数据")){
				$("#userForm").submit();
			}
		}
		
		//$("#userForm").submit();
	});
	
/*	
	//alert("${user.gender}");
	$("#add").click(function(){
	  $("#userForm").submit();
	});*/

	backBtn.on("click",function(){
		if(referer != undefined 
			&& null != referer 
			&& "" != referer
			&& "null" != referer
			&& referer.length > 4){
		 window.location.href = referer;
		}else{
			history.back(-1);
		}
	});
});


