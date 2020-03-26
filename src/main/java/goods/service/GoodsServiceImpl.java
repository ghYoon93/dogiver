package goods.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import goods.bean.GoodsDTO;
import goods.dao.GoodsDAO;

@Service
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	private GoodsDAO goodsDAO;
	private String lineUp;
	

	@Override
	public List<GoodsDTO> getGoodsList(String pg) {
		return goodsDAO.getGoodsList(Integer.parseInt(pg));
	}

	@Override
	public GoodsDTO getGoodsDetail(String goods_id) {
		return goodsDAO.getGoodsDetail(Integer.parseInt(goods_id));
	}

	@Override
	public List<GoodsDTO> getCategory(int category) {
		return goodsDAO.getCategory(category);
	}

	@Override
	public List<GoodsDTO> goods_lineUp(String lineUp) {
		return goodsDAO.goods_lineUp(lineUp);
	}
	
	

}