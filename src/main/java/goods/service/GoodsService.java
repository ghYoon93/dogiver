package goods.service;

import java.util.List;

import goods.bean.GoodsDTO;

public interface GoodsService {

	public List<GoodsDTO> getGoodsList(String pg);

	public GoodsDTO getGoodsDetail(String goods_id);

	

}
