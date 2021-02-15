package studypat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import studypat.dto.Post;
import studypat.service.PostService;
import studypat.utils.Paging;

@Controller
@RequestMapping(path = "/postList")
public class PostController {
	
	@Autowired
	private PostService postService;

	@GetMapping
	public String getPosts() { // post 전부 가져오기
		return "postList";
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
	
}
