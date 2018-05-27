package com.ssm.pojo;

import java.util.Calendar;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;



public class User {
	private Integer id; // id
	
	private String userCode; // 用户编码
	
	private String userName; // 用户名称
	
	private String userPassword; // 用户密码
	private String gender; // 性别
	private String job;//职称
	
	//注解方式 --解决JSON数据传递的日期格式问题
	//@JSONField(format="yyyy-MM-dd")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birthday; // 出生日期
	
	private String phone; // 电话
	private String institution; // 事业单位
	private String email;//邮箱
	private Integer userRole; // 用户角色
    private Integer userState;//用户状态
    
    
    private String teachingFeature;//授课特点
	private String address;//详细地址
	
    private String userRoleName;

    private String summery;//资历简介
  
    
    private String idPicPath;//上传证件照片存放路径
    
    
    private Integer createdBy; // 创建者
	private Date creationDate; // 创建时间
    
    
	public String getUserRoleName() {
		return userRoleName;
	}

	public void setUserRoleName(String userRoleName) {
		this.userRoleName = userRoleName;
	}

	public Integer getAge() {
		if (birthday != null) {
			Calendar calendar = Calendar.getInstance();
			int yearNow = calendar.get(Calendar.YEAR);
			calendar.setTime(birthday);
			int yearBirth = calendar.get(Calendar.YEAR);
			int age = yearNow - yearBirth;
			return age;
		}
		return null;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}



	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getPhone() {
		return phone;//phone.replaceAll("(\\d{3})\\d{5}(\\d{3})", "$1****$2");  //控制手机号码中间用*代替
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getUserRole() {
		return userRole;
	}

	public void setUserRole(Integer userRole) {
		this.userRole = userRole;
	}


	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getUserState() {
		return userState;
	}

	public void setUserState(Integer userState) {
		this.userState = userState;
	}

	public String getInstitution() {
		return institution;
	}

	public void setInstitution(String institution) {
		this.institution = institution;
	}

	public String getTeachingFeature() {
		return teachingFeature;
	}

	public void setTeachingFeature(String teachingFeature) {
		this.teachingFeature = teachingFeature;
	}

	public String getSummery() {
		return summery;
	}

	public void setSummery(String summery) {
		this.summery = summery;
	}

	public String getIdPicPath() {
		return idPicPath;
	}

	public void setIdPicPath(String idPicPath) {
		this.idPicPath = idPicPath;
	}

	public Integer getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}

	public Date getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

    
	
}
