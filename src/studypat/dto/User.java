package studypat.dto;

public class User {

	private int userNo;
	private String id;
	private String password;
	private String email;
	private String nickName;
	private char admin;

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public char getAdmin() {
		return admin;
	}

	public void setAdmin(char admin) {
		this.admin = admin;
	}

	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", id=" + id + ", password=" + password + ", email=" + email + ", nickname="
				+ nickName + ", admin=" + admin + "]";
	}
	
}
