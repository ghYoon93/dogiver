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
import org.springframework.web.bind.annotation.ResponseBody;
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
	@ResponseBody
	public String goodsInsert(@ModelAttribute GoodsDTO goodsDTO, 
							  @RequestParam MultipartFile goods_img,
							  @RequestParam MultipartFile goods_img2) {
		String filePath = "C:\\Users\\bitcamp\\Desktop\\dogiver\\src\\main\\webapp\\image\\goods\\"+goodsDTO.getGoods_id();
		
		
		
		if (goods_img != null) {
			String fileName = goods_img.getOriginalFilename();
			File file = new File(filePath);
			if(!file.exists()) {
				file.mkdir();
			}
			try {
				File f = new File(filePath, fileName);
				FileCopyUtils.copy(goods_img.getInputStream(), new FileOutputStream(f));
			} catch (IOException e) {
				e.printStackTrace();
			}
			goodsDTO.setGoods_thumbnail(fileName);
		}else {
			goodsDTO.setGoods_thumbnail("");
		}
		
		if (goods_img2 != null) {
			String fileName2 = goods_img2.getOriginalFilename();
			File file2 = new File(filePath, fileName2);
			try {
				FileCopyUtils.copy(goods_img2.getInputStream(), new FileOutputStream(file2));
			} catch (IOException e) {
				e.printStackTrace();
			}
			goodsDTO.setGoods_detail(fileName2);
		}else {
			goodsDTO.setGoods_detail("0");
		}
		
		int su = goodsService.goodsInsert(goodsDTO);
		if(su==1) {
			return "success";
		}else {
			return "fail";
		}
			
	}
	
	@RequestMapping(value = "goodsModify", method = RequestMethod.POST)
	public ModelAndView goodsModify(@ModelAttribute GoodsDTO goodsDTO,
									@RequestParam MultipartFile goods_img,
									@RequestParam MultipartFile goods_img2) {
		String filePath = "C:\\Users\\bitcamp\\Desktop\\dogiver\\src\\main\\webapp\\image\\goods\\"+goodsDTO.getGoods_id();
		
		if (goods_img != null) {
			String fileName = goods_img.getOriginalFilename();
			File file = new File(filePath);
			if(!file.exists()) {
				file.mkdir();
			}
			try {
				File f = new File(filePath, fileName);
				FileCopyUtils.copy(goods_img.getInputStream(), new FileOutputStream(f));
			} catch (IOException e) {
				e.printStackTrace();
			}
			goodsDTO.setGoods_thumbnail(fileName);
		}else {
			goodsDTO.setGoods_thumbnail("");
		}
		
		if (goods_img2 != null) {
			String fileName2 = goods_img2.getOriginalFilename();
			File file2 = new File(filePath, fileName2);
			try {
				FileCopyUtils.copy(goods_img2.getInputStream(), new FileOutputStream(file2));
			} catch (IOException e) {
				e.printStackTrace();
			}
			goodsDTO.setGoods_detail(fileName2);
		}else {
			goodsDTO.setGoods_detail("0");
		}
		
		goodsDTO = goodsService.goodsModify(goodsDTO);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("goodsDTO", goodsDTO);
		mav.setViewName("jsonView");
		return mav;
	}
		
}