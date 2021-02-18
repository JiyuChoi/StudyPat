package studypat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import studypat.dao.ScrapMapper;
import studypat.dto.Scrap;


@Service
public class ScrapService {
	
	@Autowired
	private ScrapMapper scrapMapper;

	public int isScrap(Scrap scrap) {
		return scrapMapper.isScrap(scrap);
	}

	public int addScrap(Scrap scrap) {
		return scrapMapper.addScrap(scrap);
	}

	public int deleteScrap(Scrap scrap) {
		return scrapMapper.deleteScrap(scrap);
	}

}
