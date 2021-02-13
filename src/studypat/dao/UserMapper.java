package studypat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import studypat.dto.User;

@Mapper
public interface UserMapper {
	public int join(User user);
	public User login(User user);
	public String logout();
	public User getUser(String user_no);
	public List<User> getUserList();
	public int updateUser(User user);
	public int deleteUser(String user_no);
	public String findId(String email);
	public void findPW(User user);
	public void sendEmail(User user);
	public int getTempPW(User user);
	
}
