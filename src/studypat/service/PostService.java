package studypat.service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import studypat.dao.PostMapper;
import studypat.dao.TagMapper;
import studypat.dto.Post;
import studypat.dto.Tag;
import studypat.utils.Paging;


@Service
public class PostService {
	
	@Autowired
	private PostMapper postMapper;
	
	@Autowired
	private TagMapper tagMapper;

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
	 
		List<Post> postList = postMapper.getCategoryPost(Integer.toString(paging.getStart()), Integer.toString(paging.getEnd()), category, sort, area); // 게시글 가져오고
		for(Post post : postList) {
			List<Tag> tagList = tagMapper.getTags(post.getPostNo());
			post.setTagList(tagList);
		}
		
		return postList;
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
		List<Post> postList = postMapper.getPostListLatest();
		for(Post post : postList) {
			List<Tag> tagList = tagMapper.getTags(post.getPostNo());
			post.setTagList(tagList);
		}
		return postList;
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

	public Post getPost(int postNo) {
		return postMapper.getPost(postNo);
	}
	
	
	@Transactional
	public void uploadTags(String tags) {
	
		List<Tag> tagList = new ArrayList<Tag>();
		
		int postNo = getPostListLatest().get(0).getPostNo();

		String[] tagArray = tags.split(",");
		
		for(int i=0; i<tagArray.length; i++) {
			Tag t = new Tag();
			t.setPostNo(postNo);
			t.setTagName(tagArray[i]);
			tagList.add(t);
		}
		
		tagMapper.uploadTags(tagList);
		
	}

}
