package studypat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import studypat.dto.Tag;

@Mapper
public interface TagMapper {

	public void uploadTags(List<Tag> tagList);
	public List<Tag> getTags(int postNo);
}
