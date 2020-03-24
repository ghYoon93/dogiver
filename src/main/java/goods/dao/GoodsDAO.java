package goods.dao;

import java.util.List;

import goods.bean.GoodsDTO;

public interface GoodsDAO {

	List<GoodsDTO> getGoodsList(int pg);

	

}
