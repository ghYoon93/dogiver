package com.spare.dogiver.service.blood;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spare.dogiver.persistence.blood.BloodDAO;
import com.spare.dogiver.web.dto.DogJoinDTO;
import com.spare.dogiver.web.dto.DogiverDTO;

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
