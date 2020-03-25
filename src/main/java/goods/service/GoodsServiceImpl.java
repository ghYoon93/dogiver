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
	

	@Override
	public List<GoodsDTO> getGoodsList(String pg) {
		return goodsDAO.getGoodsList(Integer.parseInt(pg));
	}


	@Override
	public GoodsDTO getGoodsDetail(String goods_id) {
		return goodsDAO.getGoodsDetail(Integer.parseInt(goods_id));
	}
	
	

}
