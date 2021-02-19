package studypat.dao;

import org.apache.ibatis.annotations.Mapper;

import studypat.dto.Scrap;

@Mapper
public interface ScrapMapper {
	
	public int isScrap(Scrap scrap);
	public int addScrap(Scrap scrap);
	public int deleteScrap(Scrap scrap);

}
