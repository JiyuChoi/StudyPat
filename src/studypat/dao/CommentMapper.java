package studypat.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import studypat.dto.Comment;

@Mapper
public interface CommentMapper {
	
	public int addComment(Comment comment);
	public List<Comment> getCommentList(int postNo);
}
