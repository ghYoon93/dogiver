package goods.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import goods.bean.GoodsDTO;
import goods.service.GoodsService;

@Controller
@RequestMapping("goods")
public class GoodsAdminController {
	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping(value = "goodsInsert", method = RequestMethod.POST)
	public String goodsInsert(@ModelAttribute GoodsDTO goodsDTO, 
							  @RequestParam MultipartFile goods_thumbnail,
							  @RequestParam MultipartFile goods_detail) {
		String filePath = "C:\\Users\\bitcamp\\Desktop\\dogiver\\src\\main\\webapp\\image\\goods";
		String fileName = goods_thumbnail.getOriginalFilename();
		String fileName2 = goods_detail.getOriginalFilename();
		File file = new File(filePath, fileName);
		File file2 = new File(filePath, fileName2);
		try {
			FileCopyUtils.copy(goods_thumbnail.getInputStream(), new FileOutputStream(file));
			FileCopyUtils.copy(goods_detail.getInputStream(), new FileOutputStream(file2));
		} catch (IOException e) {
			e.printStackTrace();
		}
		goodsDTO.setGoods_thumbnail(fileName);
		goodsDTO.setGoods_detail(fileName2);
		System.out.println(goodsDTO);
		
		int su = goodsService.goodsInsert(goodsDTO);
		if(su==1) {
			return "success";
		}else {
			return "fail";
		}
			
	}
	
	@RequestMapping(value = "goodsModify", method = RequestMethod.POST)
	public ModelAndView goodsModify(@ModelAttribute GoodsDTO goodsDTO) {
		goodsDTO = goodsService.goodsModify(goodsDTO);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("goodsDTO", goodsDTO);
		mav.setViewName("jsonView");
		return mav;
	}
		
}
