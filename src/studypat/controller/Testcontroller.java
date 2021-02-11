package studypat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
public class Testcontroller {

	@RequestMapping("/main")
	public String test() {
		return "main";
	}
	
	@RequestMapping("/forgotPass")
	public String forgotPass() {
		return "forgotpass";
  }
    
	@GetMapping("/join")
	public String join() {
		return "join";
  }
    
	@RequestMapping("/forgotId")
	public String forgotId() {
		return "forgotid";
	}
	
	@RequestMapping("/uploadPost")
	public String uploadPost() {
		return "uploadPost";
	}
	@RequestMapping("/postList")
	public String postList() {
		return "postList";
	}
	@RequestMapping("/detailPost")
	public String detailPost() {
		return "detailPost";
	}
	@RequestMapping("/userPost")
	public String userPost() {
		return "userPost";
	}
	@RequestMapping("/userPage")
	public String userPage() {
		return "userPage";
	}
	@RequestMapping("/adminPage")
	public String adminPage() {
		return "adminPage";
	}
}
