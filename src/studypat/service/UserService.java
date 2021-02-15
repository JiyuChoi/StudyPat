package studypat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import studypat.dao.UserMapper;
import studypat.dto.Post;
import studypat.dto.User;


@Service
public class UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	public List<User> getUserList() {
		return userMapper.getUserList();
	}

	public void deleteUser(int userNo) {
		userMapper.deleteUser(userNo);
	}

	public List<Post> getPostList() {
		return userMapper.getPostList();
	}

	public void deletePost(int postNo) {
		userMapper.deletePost(postNo);
	}
}