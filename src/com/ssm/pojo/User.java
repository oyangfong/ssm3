package com.ssm.pojo;

import java.util.Calendar;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;



public class User {
	private Integer id; // id
	
	private String userCode; // �û�����
	
	private String userName; // �û�����
	
	private String userPassword; // �û�����
	private String gender; // �Ա�
	private String job;//ְ��
	
	//ע�ⷽʽ --���JSON���ݴ��ݵ����ڸ�ʽ����
	//@JSONField(format="yyyy-MM-dd")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birthday; // ��������
	
	private String phone; // �绰
	private String institution; // ��ҵ��λ
	private String email;//����
	private Integer userRole; // �û���ɫ
    private Integer userState;//�û�״̬
    
    
    private String teachingFeature;//�ڿ��ص�
	private String address;//��ϸ��ַ
	
    private String userRoleName;

    private String summery;//�������
  
    
    private String idPicPath;//�ϴ�֤����Ƭ���·��
    
    
    private Integer createdBy; // ������
	private Date creationDate; // ����ʱ��
    
    
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
		return phone;//phone.replaceAll("(\\d{3})\\d{5}(\\d{3})", "$1****$2");  //�����ֻ������м���*����
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
