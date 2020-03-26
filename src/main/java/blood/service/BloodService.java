package blood.service;

import java.util.List;
import java.util.Map;

import blood.bean.DogJoinDTO;
import blood.bean.DogiverDTO;

public interface BloodService {

	public int dogInsert(DogJoinDTO dogJoinDTO);

	public List<DogiverDTO> getDogiver();

}
