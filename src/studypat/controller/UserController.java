package studypat.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import studypat.dto.User;
import studypat.service.PostService;
import studypat.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PostService postService;

	
	@GetMapping("/join")
	public String joinForm() {
		return "join";
	}
	
	@PostMapping("/join")
	public String join(@ModelAttribute User user) {
		try {
			userService.join(user);
			return "redirect:/";
		}catch(DuplicateKeyException e) {
			return "redirect:/join";
		}
	}
	
	@GetMapping("/main")
	public String main() {
		return "main";
	}
	
	@PostMapping("/login")
	public String login(@RequestParam(name="id", required=true) String id, @RequestParam(name="password", required=true) String password, HttpSession session) {
		try {
			userService.login(id, password, session);
		} catch(NullPointerException e) {
			session.setAttribute("errMsg", "존재하지않는 아이디입니다.");
		}
		return "redirect:/";
	}
	
	@GetMapping("/logout")
	public String logout(User user, HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// 유저정보 (마이페이지)
	@GetMapping("/myPage/{userNo}")
	public String updateUserForm(@PathVariable(name="userNo") String userNo, Model model, HttpSession session) {
		String id = (String) session.getAttribute("session_id");
		model.addAttribute("user", userService.getUser(id));
		return "user/userPage";
	}
	
	// 유저정보 수정
	@PostMapping("/myPage/updateUser")
	public String updateUser(@ModelAttribute User user, @RequestParam("password") String password, @RequestParam("updatePassword") String updatePassword,
			HttpSession session, HttpServletResponse response, RedirectAttributes rttr) throws IOException {
		userService.updateUser(user, password, updatePassword, response, rttr);
	return "redirect:/myPage/" + user.getId();
	}
	
		
	@GetMapping("/mypage/delete/{userNo}")
	public String deleteUser(@PathVariable("userNo") int userNo, User user, HttpSession session) {
		userService.deleteUser(userNo);
		session.invalidate();
		return "redirect:/";
	}
	
	//아이디 찾기
	@GetMapping("/forgotid")
	public String forgotid() {
		return "forgotid";
	}
	
	@PostMapping("/forgotid")
	public String forgotid(@RequestParam(name="email") String email, HttpSession session) {
		String findId = userService.forgotid(email);
		if (findId != null) {
			session.setAttribute("findID", findId);
		}else {
		session.setAttribute("errMsg", "존재하지않는 이메일 입니다.");
		}
		return "forgotid";
		
	}
	
		
	// 비밀번호 찾기
	@GetMapping("/forgotpass")
	public ModelAndView forgotpass() {
		return new ModelAndView("forgotpass");
	}
	
	@PostMapping("/forgotpass")
	public String forgotpass(@ModelAttribute User user,
			@RequestParam(name="id")String id,
			@RequestParam(name="email") String email, 
			HttpSession session, HttpServletResponse response,
			RedirectAttributes rttr) {
		try {
			if(userService.getUser(id).getEmail().equals(email)) {
				session.setAttribute("session_id", id);
				session.setAttribute("email", email);
				rttr.addFlashAttribute("success", true);
				return userService.forgotpass(response, session, user);
			}else {
				session.setAttribute("errMsg", "이메일이 틀렸습니다.");
				return "redirect:/forgotpassForm";
			}
		} catch(NullPointerException e) {
			System.out.println(e);
			session.setAttribute("errMsg", "존재하지 않는 아이디 입니다.");
			return "redirect:/forgotpassForm";
		}
	}
	
	// id 중복 체크 컨트롤러
	@GetMapping("/join/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {
		return userService.userIdCheck(id);
	}
	
	// email 중복 체크 컨트롤러
	@GetMapping("/join/emailCheck")
	@ResponseBody
	public int emailCheck(@RequestParam("email") String email) {
		return userService.userEmailCheck(email);
	}
	
	// nickName 중복 체크 컨트롤러
	@GetMapping("/join/nickNameCheck")
	@ResponseBody
	public int nickNameCheck(@RequestParam("nickName") String nickName) {
		return userService.userNickNameCheck(nickName);
	}
	

}
