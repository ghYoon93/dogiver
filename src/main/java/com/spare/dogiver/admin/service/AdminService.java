package com.spare.dogiver.admin.service;

import java.util.List;
import java.util.Map;

import com.spare.dogiver.admin.domain.Admin_dogiverPaging;
import com.spare.dogiver.blood.dto.DogiverDTO;

public interface AdminService {

	public List<DogiverDTO> getDogiver(String pg);

	public Admin_dogiverPaging admin_dogiverPaging(String pg);

	public int adminDogiverModify(Map<String, String> map);

	public int dogiverInsert(Map<String, String> map);

}
