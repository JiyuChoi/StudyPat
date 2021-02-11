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
	
	@GetMapping("/join")
	public String join() {
		return "join";
	}
}
