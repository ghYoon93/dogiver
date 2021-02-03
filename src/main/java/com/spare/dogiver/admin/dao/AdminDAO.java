package com.spare.dogiver.admin.dao;

import java.util.List;
import java.util.Map;

import com.spare.dogiver.blood.dto.DogiverDTO;

public interface AdminDAO {

	public List<DogiverDTO> getDogiver(Map<String, Integer> map);

	public int getDogiverTotalA();

	public int adminDogiverModify(Map<String, String> map);

	public int dogiverInsert(Map<String, String> map);

}
