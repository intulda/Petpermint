package io.pet.mint.member.vo;

public class MemberVO {

	private String id;
	private String pwd;
	private String nickname;
	private int auth;
	private String reg_date;
	private int del;
	private String signup_type;
	private int info_agree;
	private String phone;
	private String subNickname;
	
	public MemberVO() {
	}

	public String getSubNickname() {
		return subNickname;
	}

	public void setSubNickname(String subNickname) {
		this.subNickname = subNickname;
	}

	public MemberVO(String id, String pwd, int auth) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.auth = auth;
	}
	

	public MemberVO(String id, String pwd, String nickname, int auth, String reg_date, int del, String signup_type,
			int info_agree, String phone) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.nickname = nickname;
		this.auth = auth;
		this.reg_date = reg_date;
		this.del = del;
		this.signup_type = signup_type;
		this.info_agree = info_agree;
		this.phone = phone;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public String getSignup_type() {
		return signup_type;
	}

	public void setSignup_type(String signup_type) {
		this.signup_type = signup_type;
	}

	public int getInfo_agree() {
		return info_agree;
	}

	public void setInfo_agree(int info_agree) {
		this.info_agree = info_agree;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pwd=" + pwd + ", nickname=" + nickname + ", auth=" + auth + ", reg_date="
				+ reg_date + ", del=" + del + ", signup_type=" + signup_type + ", info_agree=" + info_agree + ", phone="
				+ phone + "]";
	}
	
	
	
}
