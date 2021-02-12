package studypat.dto;

import lombok.Data;

@Data
public class User {

	private int userNo;
	private String id;
	private String password;
	private String email;
	private String nickName;
	private char admin;
}
