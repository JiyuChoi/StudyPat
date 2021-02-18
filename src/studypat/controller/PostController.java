package studypat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import studypat.dto.Post;
import studypat.service.CommentService;
import studypat.service.PostService;
import studypat.utils.Paging;

@Controller
public class PostController {
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private CommentService commentService;

	@GetMapping
	public String getPosts(Model model) { // post 전부 가져오기
		int userNo = 4; // 임시로
		List<Post> postListLatest = postService.getPostListLatest();//최신 게시물 가져오기
		List<Post> postListUserScrap = postService.getUserScrapPost(userNo);
		model.addAttribute("postListLatest", postListLatest);
		model.addAttribute("postListUserScrap", postListUserScrap);
		return "main";
	}
	
	@GetMapping("/category")
	public String getCategoryPosts(@RequestParam(name="category") String category, Model model, Paging paging,
			@RequestParam(value="nowPage", required=false)String nowPage, 
			@RequestParam(value="sort", required=false) String sort,
			@RequestParam(value="area", required=false) String area) { // category별 post
		
		if (nowPage == null) { // 페이지 정보가 없으면 첫페이지로 설정
			nowPage = "1";
		} 
		
		if(sort == null) { //처음에는 최신순으로 정렬 
			sort = "createDate";
		}
		if(area == null) { //처음에는 전체
			area = "all";
		}

		int total = postService.countPost(category, area);
		
		paging = new Paging(total, Integer.parseInt(nowPage));
		List<Post> postList = postService.getCategoryPost(paging, category, sort, area);
		
		model.addAttribute("postList", postList);
		model.addAttribute("paging", paging);
		model.addAttribute("category", category);
		model.addAttribute("sort", sort);
		model.addAttribute("area", area);
		
		return "postList";
	}
	

	@GetMapping("/uploadPostForm")
	public String uploadPostForm(@RequestParam(name="category") String category, Model model) {
		model.addAttribute("category", category);
		return "uploadPost";
	}
	
	@PostMapping("uploadPost") // post 업로드
	public String uploadPost(Post post, RedirectAttributes redirect, @RequestParam(name="tags") String tags) {
		postService.uploadPost(post, tags); // 포스트 업로드
		redirect.addAttribute("category", post.getCategory()); // 작성한 카테고리로 넘어가기 위해서
		return "redirect:/category";
	}
	

	@GetMapping("/post/{postNo}")
	public String getPost(@PathVariable("postNo") int postNo, Model model) {
		model.addAttribute("post", postService.getPost(postNo));
		model.addAttribute("commentList", commentService.getCommentList(postNo));
		return "post/detailPost";
	}
	
	@GetMapping("/updatePost/{postNo}")
	public String updatePostForm(@PathVariable("postNo") int postNo, Model model) {
		
		Post post = postService.getPost(postNo);
		String tagStr = postService.tagListToString(post.getTagList());
		 
		model.addAttribute("post", post);
		model.addAttribute("tag", tagStr);
		
		return "updatePost";
	}
	
	@PostMapping("/updatePost")
	public String updatePost(Post post, RedirectAttributes redirect, @RequestParam(name="tags") String tags) {
		redirect.addAttribute("category", post.getCategory());
		postService.updatePost(post, tags);
		return "redirect:/category";
	}
}

