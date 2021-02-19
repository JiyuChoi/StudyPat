package studypat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import studypat.service.PostService;
import studypat.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private PostService postService;

	@GetMapping("/user")
	public String adminUserList(Model model) {
		model.addAttribute("userList", userService.getUserList());
		return "admin/user";
	}

	@GetMapping("/user/delete/{userNo}")
	public String deleteUser(@PathVariable("userNo") int userNo) {
		userService.deleteUser(userNo);
		return "redirect:/admin/user";
	}

	@GetMapping("/post")
	public String adminPostList(Model model) {
		model.addAttribute("postList", postService.getPostList());
		return "admin/post";
	}

	@GetMapping("/post/{userNo}")
	public String adminUserPostList(@PathVariable("userNo") int userNo, Model model) {
		model.addAttribute("postList", postService.getPostList(userNo));
		return "admin/post";
	}

	@GetMapping("/post/delete/{postNo}")
	public String deletePost(@PathVariable("postNo") int postNo) {
		postService.deletePost(postNo);
		return "redirect:/admin/post";
	}
	
}
