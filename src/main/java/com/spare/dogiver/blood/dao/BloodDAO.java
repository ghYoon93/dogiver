package com.spare.dogiver.blood.dao;

import java.util.List;
import java.util.Map;

import com.spare.dogiver.blood.dto.DogJoinDTO;
import com.spare.dogiver.blood.dto.DogiverDTO;

public interface BloodDAO {

	public int dogInsert(DogJoinDTO dogJoinDTO);

	public List<DogiverDTO> getDogiver();

	public DogJoinDTO getMyblood(String email);

	public void mybloodModify(DogJoinDTO dogJoinDTO);

}
