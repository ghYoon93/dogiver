package admin.dao;

import java.util.List;
import java.util.Map;

import blood.bean.DogiverDTO;

public interface AdminDAO {

	public List<DogiverDTO> getDogiver(Map<String, Integer> map);

	public int getDogiverTotalA();

}
