package com.spare.dogiver.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spare.dogiver.admin.domain.Admin_dogiverPaging;
import com.spare.dogiver.admin.dao.AdminDAO;
import com.spare.dogiver.blood.dto.DogiverDTO;

@Service("AdminService")
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAO adminDAO;
	@Autowired
	private Admin_dogiverPaging admin_dogiverPaging;

	@Override
	public List<DogiverDTO> getDogiver(String pg) {
		// 1페이지당 10개씩
		int pg2 = Integer.parseInt(pg);
		int listNum = 10;

		int endNum = pg2 * listNum;
		int startNum = endNum - (listNum - 1);

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);

		List<DogiverDTO> list = adminDAO.getDogiver(map);
		return list;
	}

	@Override
	public Admin_dogiverPaging admin_dogiverPaging(String pg) {
		int listNum = 10;
		int totalA = adminDAO.getDogiverTotalA();
		admin_dogiverPaging.setCurrentPage(Integer.parseInt(pg));
		admin_dogiverPaging.setPageBlock(5);
		admin_dogiverPaging.setPageSize(listNum);
		admin_dogiverPaging.setTotalA(totalA);
		admin_dogiverPaging.makePagingHTML();
		return admin_dogiverPaging;
	}

	@Override
	public int adminDogiverModify(Map<String, String> map) {
		
		return adminDAO.adminDogiverModify(map);
	}

	@Override
	public int dogiverInsert(Map<String, String> map) {
		
		return adminDAO.dogiverInsert(map);
	}

}
