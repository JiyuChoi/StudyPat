package studypat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import studypat.dto.Scrap;
import studypat.service.ScrapService;


@Controller
@RequestMapping("/scrap")
public class ScrapController {
	
	@Autowired
	private ScrapService scrapService;
	
	@PostMapping("")
	@ResponseBody
	public int isScrap(@ModelAttribute Scrap scrap) {
		return scrapService.isScrap(scrap);
	}

	@PostMapping("/add")
	@ResponseBody
	public int addScrap(@ModelAttribute Scrap scrap) {
		return scrapService.addScrap(scrap);
	}

	@PostMapping("/delete")
	@ResponseBody
	public int deleteScrap(@ModelAttribute Scrap scrap) {
		return scrapService.deleteScrap(scrap);
	}
}

