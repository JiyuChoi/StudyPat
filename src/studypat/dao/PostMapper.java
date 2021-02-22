package studypat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import studypat.dto.Post;

@Mapper
public interface PostMapper {
//	public List<Post> getCategoryPost(String category);
	public List<Post> getCategoryPost(@Param("start") String start, @Param("end") String end, @Param("category") String category, @Param("sort") String sort, @Param("area") String area ,@Param("tag") String tag);
	
	public int countPost(@Param("category") String category, @Param("area") String area);
	
	public List<Post> getPostList();
	public List<Post> getUserPostList(int userNo);
	public void deletePost(int postNo);
	public Post getPost(int postNo);
	
	
	public List<Post> getPostListLatest();
	public List<Post> getUserScrapPost(int userNo);
	public void uploadPost(Post post);
	public void updatePost(Post post);
	public int countPostTag(@Param("category") String category, @Param("area") String area, @Param("tag") String tag);
	
 
}
