package studypat.service;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import studypat.dao.UserMapper;
import studypat.dto.User;

@Service
public class UserService {

	@Autowired
	private UserMapper userMapper;
	
	@Transactional(readOnly = false)
	public int join(User user) {
		int result = userMapper.join(user);
		return result;
	}
	
	public User login(User user) {
		return userMapper.login(user);
	}
	
	public void logout(HttpSession session) {
		userMapper.logout();
		session.invalidate();
	}
	
	public User getUser(String id) {
		return userMapper.getUser(id);
	}
	
	public int getUserNo(String id) {
		return userMapper.getUserNo(id);
	}
	
	public int updateUser(User user) {
		return userMapper.updateUser(user);
	}
		
	public String forgotid(String email) {
		return userMapper.forgotid(email);

	}
	
	// 임시 비밀번호로 업데이트
	public int getTempPW(User user) {
		return userMapper.getTempPW(user);
	}
	
	// 메일 보내기 
	public void sendEmail(User user) {
		// Mail Server 설정 
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "wldbspdlqj";
		String hostSMTPpw = "choi162320*";
		
		// 보내는 사람 Email 제목, 내용 
		String fromEmail = "wldbspdlqj@naver.com";
		String fromName = "StudyPat Admin";
		
		String subject = ""; //메일 제목 
		String msg = ""; //메일 내용 
		String toName = user.getId();


		subject = "StudyPat 임시비밀번호 안내";
		
		msg += "<div align='center' style='border:1px solid black; font-family:verdana';>";
		msg += "<h3 style='color: blue;'>";
		msg += user.getId() + "님의 임시 비밀번호 입니다.</h3>";
		msg += "임시비밀번호: <strong>" + user.getPassword() + "</strong><br/>";
		msg += "해당 임시비밀 번호를 입력해 로그인하시고<br/> 마이페이지에서 비밀번호를 변경하여 사용하세요.</div><br/>";

		// 받는 사람 E-Mail 주소
		String mail = user.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587); //gmail 이용시 465

			email.setAuthentication(hostSMTPid, hostSMTPpw);
			email.setTLS(true);
			email.addTo(mail, toName, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
	
	public String forgotpass(HttpServletResponse response, HttpSession session, User user) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String result = null;
		
		//회원정보 불러오기 
		if (user != null) {
			String tempPw = UUID.randomUUID().toString().replace("-", "");
			tempPw = tempPw.substring(0,10);
			
			//System.out.println("임시 비밀번호 확인" + tempPw);
			//비밀번호 재설정 
			user.setPassword(tempPw);
			
			sendEmail(user); //이메일로 보내기 
			
			getTempPW(user); //임시 비밀번호로 업데이트 
		}  
		return "redirect:/forgotpass";
	}
   	
	public List<User> getUserList() {
		return userMapper.getUserList();
	}

	public void deleteUser(int userNo) {
		userMapper.deleteUser(userNo);
	}



}


