package studypat.dto;

import lombok.Data;

@Data
public class Comment {
	
	private int commentNo;
	private int postNo;
	private int userNo;
	private String commentText;	// CLOB -> String mapping
	private String createDate;	// Date -> String
	private char secret;
}
