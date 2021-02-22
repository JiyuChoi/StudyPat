package studypat.dto;

public class Comment {

	private int commentNo;
	private int postNo;
	private int userNo;
	private String commentText;	// CLOB -> String mapping
	private String createDate;	// Date -> String
	private char secret;
	private User user;			// join시 같이 담아오기

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getCommentText() {
		return commentText;
	}

	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public char getSecret() {
		return secret;
	}

	public void setSecret(char secret) {
		this.secret = secret;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
