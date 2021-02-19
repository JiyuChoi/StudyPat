package studypat.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import studypat.dto.User;
import studypat.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;

	
	@GetMapping("/joinForm")
	public String joinForm() {
		return "join";
	}
	
	@PostMapping("/join")
	public String join(@ModelAttribute User user, HttpSession session) {
		try {
			userService.join(user);
			return "redirect:/";
		}catch(DuplicateKeyException e) {
			session.setAttribute("errMsg", "이미 존재하는 아이디 입니다.");
			return "redirect:/joinForm";
		}
	}
	
	@GetMapping("/main")
	public String main() {
		return "main";
	}
	
	
	@PostMapping("/login")
	public String login(User user, HttpSession session, RedirectAttributes rttr) {
		User loginUser = userService.login(user);
		if (loginUser == null) {
			rttr.addAttribute("msg", false);
		} else {
			session.setAttribute("session_id", loginUser);
		}
		return "redirect:/";
	}
	
//	@PostMapping("/login")
//	public String login(@RequestParam(name="id", required=true) String id,
//						@RequestParam(name="password", required=true) String password,
//						HttpSession session, RedirectAttributes redirectAttributes) {
//		try {
//			if(userService.getUser(id).getPassword().equals(password)) {
//				session.setAttribute("session_id", id);
//				session.setAttribute("session_pw", password);
//				return "redirect:/";
//			}else {
//				session.setAttribute("errMsg", "비밀번호가 틀렸습니다.");
//				return "redirect:/";
//			}
//		} catch(NullPointerException e) {
//			session.setAttribute("errMsg", "존재하지 않는 아이디 입니다.");
//			return "redirect:/";
//		}
//	}
	
	@GetMapping("/logout")
	public String logout(User user, Model model, HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/{id}")
	public String getUser(@PathVariable(name="id") String id, ModelMap model) {
		User user = userService.getUser(id);
		model.addAttribute("user", user);
		return "userPage";
	}
	
	@PostMapping("/updateProfile")
	public String updateProfile(@SessionAttribute("id") String id,
			@RequestParam("user_password") String user_password, @RequestParam("user_nickname") String update_user_nickname,
			@RequestParam("update_user_password") String update_user_password,
			HttpSession session,HttpServletResponse response) throws IOException {

		User currentUser = userService.getUser(id);
		User updateUser = currentUser;
		
		if(("").equals(update_user_password) && ("").equals(user_password)) { // 자기소개만 변경된 경우
			if(update_user_nickname == null) { // Null인경우 공백 넣기..
				update_user_nickname = "";
			}
			updateUser.setNickName(update_user_nickname); 
			userService.updateUser(updateUser);
			return "redirect:/"+id;
		}
		else if(!currentUser.getPassword().equals(user_password)) { //현재 비밀번호가 일치하지 않는 경우
			session.setAttribute("passwordErrMsg", "비밀번호가 일치하지 않습니다.");
			return "redirect:/"+id;
		}
		else if(("").equals(update_user_password)) { //현재 비밀번호는 일치하지만 변경할 비밀번호가 없는 경우.
			session.setAttribute("updateErrMsg", "변경할 비밀번호를 입력해주세요.");
			return "redirect:/"+id;
		}
		
		updateUser.setPassword(update_user_password);
		updateUser.setNickName(update_user_nickname);
		userService.updateUser(updateUser);
		
		return "redirect:/"+id;
	}
	
		
	@GetMapping("/delete")
	public String deleteUser(@SessionAttribute("user_no") int userNo, HttpSession session) {
		userService.deleteUser(userNo);
		session.invalidate();
		return "redirect:/";
	}
	
	//아이디 찾기
	@GetMapping("/findId")
	public ModelAndView findId() {
		return new ModelAndView("forgotid");
	}
	
	@PostMapping("/findId")
	public String findId(@RequestParam(name="email") String email, HttpSession session) {
		try {
			session.setAttribute("email", email);
			return userService.findId(email);
		} catch(NullPointerException e) {
		session.setAttribute("errMsg", "존재하지 않는 이메일 입니다.");
		return "redirect:/forgotId";
		}
	}
	
		
	// 비밀번호 찾기
	@GetMapping("/findPW")
	public ModelAndView findPW() {
		return new ModelAndView("forgotpass");
	}
	
	@PostMapping("/findPW")
	public String findPW(@ModelAttribute User user,
			@RequestParam(name="id")String id,
			@RequestParam(name="email") String email, 
			HttpSession session, HttpServletResponse response) {
		try {
			if(userService.getUser(id).getEmail().equals(email)) {
				session.setAttribute("session_id", id);
				session.setAttribute("email", email);
				return userService.findPW(response, user);
			}else {
				session.setAttribute("errMsg", "이메일이 틀렸습니다.");
				return "redirect:/forgotpass";
			}
		} catch(NullPointerException e) {
			System.out.println(e);
			session.setAttribute("errMsg", "존재하지 않는 아이디 입니다.");
			return "redirect:/forgotpass";
		}
	}
	
	

}
