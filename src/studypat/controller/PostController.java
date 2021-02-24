package studypat.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import studypat.dto.Post;
import studypat.dto.User;
import studypat.service.CommentService;
import studypat.service.PostService;
import studypat.service.UserService;
import studypat.utils.Paging;

@Controller
public class PostController {
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private UserService userService;

	@GetMapping
	public String getPosts(Model model, HttpSession session) { // post 전부 가져오기
		
		List<Post> postListLatest = postService.getPostListLatest();//최신 게시물 가져오기
		List<Post> postListUserScrap = new ArrayList<Post>();
		
		String userId = null;
		
		if(session.getAttribute("user") != null){
			User user = (User) session.getAttribute("user");
			userId = user.getId();
		}
		
		int postSize=0;
		if(userId == null) { // 로그인이 되어있지 않은 경우 
			model.addAttribute("scrapLoginErrMsg", "로그인을 해주세요");
			
		} 
		else { // 로그인이 되어있는 경우
			int userNo = userService.getUser(userId).getUserNo();
			postListUserScrap = postService.getUserScrapPost(userNo);
			postSize = postListUserScrap.size();
			
			if(postSize >= 5) {
				postSize = 5;
			}
			
			if(postListUserScrap.size() == 0) {
				model.addAttribute("scrapNullMsg", "스크랩한 게시물이 없습니다");
			}
		}
		
		model.addAttribute("postListLatest", postListLatest);
		model.addAttribute("postListUserScrap", postListUserScrap.subList(0, postSize));
		return "main";
	}
	
	@GetMapping("/category")
	public String getCategoryPosts(@RequestParam(name="category", required=false) String category, Model model, Paging paging,
			@RequestParam(value="nowPage", required=false)String nowPage, 
			@RequestParam(value="sort", required=false) String sort,
			@RequestParam(value="area", required=false) String area,
			@RequestParam(value="tag", required=false) String tag,
			@RequestParam(value="search", required=false) String search) { // category별 post
		
		if (nowPage == null) { // 페이지 정보가 없으면 첫페이지로 설정
			nowPage = "1";
		} 
		if(sort == null) { //처음에는 최신순으로 정렬 
			sort = "createDate";
		}
		if(area == null) { //처음에는 전체
			area = "all";
		}
		if(tag == null) { // 처음에는 태그 검색 X
			tag = "";
		}
		int total = 0;
		
		if(("").equals(tag)){ //태그 검색을 안했을 경우 
			 total = postService.countPost(category, area, search); // 카테고리, 지역으로 검색한 게시물 갯수 
		}
		else {
			total = postService.countPostTag(category, area, tag, search); //카테고리, 지역, 태그로 검색한 게시물 갯수
		}
		paging = new Paging(total, Integer.parseInt(nowPage));
		List<Post> postList = postService.getCategoryPost(paging, category, sort, area, tag, search);
		
		model.addAttribute("postList", postList);
		model.addAttribute("paging", paging);
		model.addAttribute("category", category);
		model.addAttribute("sort", sort);
		model.addAttribute("area", area);
		model.addAttribute("tag",tag);
		model.addAttribute("search", search);
		
		return "postList";
	}
	

	@GetMapping("/uploadPostForm")
	public String uploadPostForm(@RequestParam(name="category") String category, Model model) {
		model.addAttribute("category", category);
		return "uploadPost";
	}
	
	@PostMapping("uploadPost") // post 업로드
	public String uploadPost(Post post, RedirectAttributes redirect, @RequestParam(name="tags") String tags, HttpSession session) {
		String id = (String) session.getAttribute("session_id");
		postService.uploadPost(post, tags, id); // 포스트 업로드
		redirect.addAttribute("category", post.getCategory()); // 작성한 카테고리로 넘어가기 위해서
		return "redirect:/category";
	}
	

	@GetMapping("/post/{postNo}")
	public String getPost(@PathVariable("postNo") int postNo, Model model) {
		postService.addView(postNo);
		model.addAttribute("post", postService.getPost(postNo));
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
	
	@GetMapping("/deletePost/{postNo}")
	public String deletePost(@PathVariable("postNo") int postNo, RedirectAttributes redirect) {
		Post post = postService.getPost(postNo);
		redirect.addAttribute("category", post.getCategory());
		postService.deletePost(postNo);
		return "redirect:/category";
	}
	
	// user Post 가져오기
	@GetMapping("/post/myPost/{userNo}")
	public String getUserPostList(@PathVariable(name="userNo") int userNo, Model model) {
		List<Post> postListUser = postService.getUserPostList(userNo);
		model.addAttribute("postListUser", postListUser);
		return "user/userPost";
	}

	@GetMapping("/post/report/{postNo}")
	@ResponseBody
	public void reportPost(@PathVariable("postNo") int postNo) {
		postService.reportPost(postNo);
	}
	
	// user ScrapPost 가져오기
	@GetMapping("/post/myScrap/{userNo}")
	public String getUserScrapPost(@PathVariable(name="userNo") int userNo, Model model) {
		List<Post> scrapListUser = postService.getUserScrapPost(userNo);
		model.addAttribute("scrapListUser", scrapListUser);
		return "user/userScrap";
	}
}

