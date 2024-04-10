//컴퓨터학과 20190936 고지수
package jspbook.pr33;

public class LoginBean {

	private String id;
	private String pw;
	private Integer gender;
	private String email;
	private String birth;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public Integer getGender() {
		return gender;
	}
	public void setGender(Integer gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	
	public boolean isGrouwnUp() {
		String[] dArray = birth.split("-");
		int age = 2020 - Integer.parseInt(dArray[0]);
		
		if (age >= 20)
			return true;
		else
			return false;
	}
}
