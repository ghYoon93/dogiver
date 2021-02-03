package com.spare.dogiver.blood.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spare.dogiver.blood.dao.BloodDAO;
import com.spare.dogiver.blood.dto.DogJoinDTO;
import com.spare.dogiver.blood.dto.DogiverDTO;

@Service("BloodService")
public class BloodServiceImpl implements BloodService {
	@Autowired
	private BloodDAO bloodDAO;

	@Override
	public int dogInsert(DogJoinDTO dogJoinDTO) {
		return bloodDAO.dogInsert(dogJoinDTO);
	}

	@Override
	public List<DogiverDTO> getDogiver() {
		
		return bloodDAO.getDogiver();
	}

	@Override
	public DogJoinDTO getMyblood(String email) {
		return bloodDAO.getMyblood(email);
	}

	@Override
	public void mybloodModify(DogJoinDTO dogJoinDTO) {
		bloodDAO.mybloodModify(dogJoinDTO);
		
	}

}
