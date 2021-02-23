package studypat.service;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import studypat.dao.PostMapper;
import studypat.dao.TagMapper;
import studypat.dao.UserMapper;
import studypat.dto.Post;
import studypat.dto.Tag;
import studypat.dto.User;
import studypat.utils.Paging;


@Service
public class PostService {
	
	@Autowired
	private PostMapper postMapper;
	
	@Autowired
	private TagMapper tagMapper;

	@Autowired
	private UserMapper userMapper;
	
	public List<Post> getCategoryPost(Paging paging, String category, String sort, String area, String tag, String search){
		
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
	 
		List<Post> postList = postMapper.getCategoryPost(Integer.toString(paging.getStart()), Integer.toString(paging.getEnd()), category, sort, area, tag, search); // 게시글 가져오고
		for(Post post : postList) {
			List<Tag> tagList = tagMapper.getTags(post.getPostNo());
			post.setTagList(tagList);
		}
		return postList;
	}
 
	public int countPost(String category, String area, String search) {
		
		return postMapper.countPost(category, area, search);
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
		List<Post> postList = postMapper.getUserScrapPost(userNo);
		for(Post post : postList) {
			List<Tag> tagList = tagMapper.getTags(post.getPostNo());
			post.setTagList(tagList);
		}
		return postList;
	}
	
	public List<Post> getPostList() {
		return postMapper.getPostList();
	}

	public List<Post> getUserPostList(int userNo) {
		List<Post> postList = postMapper.getUserPostList(userNo);
		for(Post post : postList) {
			List<Tag> tagList = tagMapper.getTags(post.getPostNo());
			post.setTagList(tagList);
		}
		return postList;
	}

	public void deletePost(int postNo) {
		postMapper.deletePost(postNo);
	}
	
	@Transactional
	public void uploadPost(Post post, String tags, String id) { //게시물, 태그 업로드 
		int userNo = userMapper.getUser(id).getUserNo();
		post.setUserNo(userNo);
		post.setViewCount(0);
		post.setReport(0);
		postMapper.uploadPost(post);
		
		if(tags != null) {
			List<Tag> tagList = new ArrayList<Tag>(); // 쿼리에서 사용할 tag list 생성 
			int postNo = getPostListLatest().get(0).getPostNo(); // 현재 postNo 찾기 위해서 최근에 업로드된 포스트 가져오기
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

	public Post getPost(int postNo) {
		Post post = postMapper.getPost(postNo);
		List<Tag> tagList = tagMapper.getTags(post.getPostNo());
		post.setTagList(tagList);
		return post;
	}

	public String tagListToString(List<Tag> tags) {  // 태그 리스트를 스트링으로 변환
		
		if(tags.size() == 0) {
			return "";
		}
		String str = "";
		for(int i=0; i<tags.size(); i++) {
			if(i==tags.size()-1) { // 마지막이라면 
				str += tags.get(i).getTagName();
				return str;
			}
			str += tags.get(i).getTagName()+",";
		}
		return str;
	}
 
	public void updatePost(Post post, String tags) { //게시물, 태그 업데이트
		
		postMapper.updatePost(post); // 게시물 업데이트 
	
		List<Tag> tagListStr = tagMapper.getTags(post.getPostNo()); // 현재 태그 리스트 가져오기 
		String str = tagListToString(tagListStr); // 태그 리스트를 스트링으로 변환
		
		if(str.equals(tags)) { //만약 게시물 수정하면서 태그를 수정하지 않았다면 
			return; // 리턴
		}
		
		tagMapper.deleteTag(post.getPostNo()); // 수정했다면 현재 게시물의 태그 다 지우고 
		
		if(tags.equals("")) { // 게시물을 수정하면서 태그를 다 지웠다면?
			return; // 태그 저장 할 필요 없으므로 리턴
		}
		String[] tagArray = tags.split(","); //태그를 배열로 
		List<Tag> tagList = new ArrayList<Tag>(); 
		for(int i=0; i<tagArray.length; i++) { // 배열을 List로 변환 
			Tag t = new Tag();
			t.setPostNo(post.getPostNo());
			t.setTagName(tagArray[i]);
			tagList.add(t);
		}
		tagMapper.uploadTags(tagList); // 다시 태그 저장
	}
	
	public int countPostTag(String category, String area, String tag, String search) {
		return postMapper.countPostTag(category, area, tag, search);
	}

	public void addView(int postNo) {
		postMapper.addView(postNo);
	}

	public void reportPost(int postNo) {
		postMapper.reportPost(postNo);
	}
}
