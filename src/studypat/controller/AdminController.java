package studypat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import studypat.service.UserService;

@Controller
public class AdminController {
	
	@Autowired
	private UserService userService;

	@GetMapping("/adminuser")
	public String adminUserList(Model model) {
		model.addAttribute("userList", userService.getUserList());
		return "admin/user";
	}

	@GetMapping("/adminuser/delete/{userNo}")
	public String deleteUser(@PathVariable("userNo") int userNo) {
		userService.deleteUser(userNo);
		return "redirect:/adminuser";
	}

	@GetMapping("/adminpost")
	public String adminPostList(Model model) {
		model.addAttribute("postList", userService.getPostList());
		return "admin/post";
	}

	@GetMapping("/adminpost/delete/{postNo}")
	public String deletePost(@PathVariable("postNo") int postNo) {
		userService.deletePost(postNo);
		return "redirect:/adminpost";
	}
	
}
