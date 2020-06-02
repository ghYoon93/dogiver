package blood.dao;

import java.util.List;
import java.util.Map;

import blood.bean.DogJoinDTO;
import blood.bean.DogiverDTO;

public interface BloodDAO {

	public int dogInsert(DogJoinDTO dogJoinDTO);

	public List<DogiverDTO> getDogiver();

	public DogJoinDTO getMyblood(String email);

	public void mybloodModify(DogJoinDTO dogJoinDTO);

}
