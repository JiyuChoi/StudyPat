package studypat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import studypat.dao.PostMapper;
import studypat.dto.Post;
import studypat.utils.Paging;


@Service
public class PostService {
	
	@Autowired
	private PostMapper postMapper;

	public List<Post> getCategoryPost(Paging paging, String category, String sort, String area){
		
		if(("createDate").equals(sort)) { //최신순으로 정렬
			sort = "create_date";
		}
		else if(("comment").equals(sort)) { //댓글순으로정렬
			sort = "comment_count";
		}
		else if(("view").equals(sort)) { //조회순으로 정렬
			sort = "view_count";
		}
		else if(("scrap").equals(sort)) { //조회순으로 정렬
			sort = "scrap_count";
		}
	 
		return postMapper.getCategoryPost(Integer.toString(paging.getStart()), Integer.toString(paging.getEnd()), category, sort, area);
	}
	
	public int countPost(String category, String area) {
		if(("seoul").equals(area)) {
			area = "서울";
		}
		else if(("gyeonggi").equals(area)) {
			area = "경기";
		}
		
		return postMapper.countPost(category, area);
	}
	public List<Post> getPostListLatest(){
		
		return postMapper.getPostListLatest();
	}
	public List<Post> getUserScrapPost(int userNo){
		
		return postMapper.getUserScrapPost(userNo);
	}
	
	public List<Post> getPostList() {
		return postMapper.getPostList();
	}

	public List<Post> getPostList(int userNo) {
		return postMapper.getUserPostList(userNo);
	}

	public void deletePost(int postNo) {
		postMapper.deletePost(postNo);
	}
	
	public void uploadPost(Post post) {
		post.setUserNo(4); //  임시로
		post.setViewCount(0);
		post.setReport(0);
		postMapper.uploadPost(post);
	}

}
