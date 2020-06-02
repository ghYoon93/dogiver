package com.spare.dogiver.service.blood;

import java.util.List;
import java.util.Map;

import com.spare.dogiver.web.dto.DogJoinDTO;
import com.spare.dogiver.web.dto.DogiverDTO;

public interface BloodService {

	public int dogInsert(DogJoinDTO dogJoinDTO);

	public List<DogiverDTO> getDogiver();

	public DogJoinDTO getMyblood(String email);

	public void mybloodModify(DogJoinDTO dogJoinDTO);

}
