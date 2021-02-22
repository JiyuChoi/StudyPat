package studypat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import studypat.dao.CommentMapper;
import studypat.dto.Comment;


@Service
public class CommentService {
	
	@Autowired
	private CommentMapper commentMapper;

	public List<Comment> getCommentList(int postNo) {
		return commentMapper.getCommentList(postNo);
	}

	public List<Comment> getUserCommentList(int userNo) {
		return commentMapper.getCommentList(userNo);
	}
	
	public int addComment(Comment comment) {
		return commentMapper.addComment(comment);
	}

}
