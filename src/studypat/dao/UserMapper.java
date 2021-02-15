package studypat.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import studypat.dto.Post;
import studypat.dto.User;

@Mapper
public interface UserMapper {

	public List<User> getUserList();
	public void deleteUser(int userNo);
	public List<Post> getPostList();
	public void deletePost(int postNo);
}
