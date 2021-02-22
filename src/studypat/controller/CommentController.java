package studypat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import studypat.dto.Comment;
import studypat.service.CommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	@GetMapping("/{postNo}")
	@ResponseBody
	public List<Comment> getCommentList(@PathVariable("postNo") int postNo) {
		return commentService.getCommentList(postNo);
	}

	@PostMapping("/add")
	@ResponseBody
	public int addComment(@ModelAttribute Comment comment) {
		return commentService.addComment(comment);
	}
	
	// user Comment 가져오기
	@GetMapping("/myComment/{userNo}")
	public String getUserCommentList(@PathVariable(name="userNo") int userNo, Model model) {
		List<Comment> commentListUser = commentService.getUserCommentList(userNo);
		model.addAttribute("commentListUser", commentListUser);
		return "user/userComment";
	}
}

