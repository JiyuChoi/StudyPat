package studypat.dto;

import lombok.Data;

@Data
public class Post {
	
	private int postNo;
	private int userNo;
	private String title;
	private String postText;	// CLOB -> String mapping
	private String category;
	private int recruitNo;
	private String area;
	private String createDate;	// Date -> String
	private int viewCount;
	private int report;
}
