package com.kosa.mvc2.member;

public class MemberDTO {
	// 콘솔창 드래그 ctrl + alt + 드래그
	// 복사 ctrl + enter
	// 대문자->소문자 ctrl + shift + y
	private String b_m_id="";
	private String b_m_userid="";
	private String b_m_password="";
	private String b_m_name="";
	private String b_m_email="";
	private String b_m_phone="";

	public String getB_m_id() {
		return b_m_id;
	}

	public void setB_m_id(String b_m_id) {
		this.b_m_id = b_m_id;
	}

	public String getB_m_userid() {
		return b_m_userid;
	}

	public void setB_m_userid(String b_m_userid) {
		this.b_m_userid = b_m_userid;
	}

	public String getB_m_password() {
		return b_m_password;
	}

	public void setB_m_password(String b_m_password) {
		this.b_m_password = b_m_password;
	}

	public String getB_m_name() {
		return b_m_name;
	}

	public void setB_m_name(String b_m_name) {
		this.b_m_name = b_m_name;
	}

	public String getB_m_email() {
		return b_m_email;
	}

	public void setB_m_email(String b_m_email) {
		this.b_m_email = b_m_email;
	}

	public String getB_m_phone() {
		return b_m_phone;
	}

	public void setB_m_phone(String b_m_phone) {
		this.b_m_phone = b_m_phone;
	}	

}
