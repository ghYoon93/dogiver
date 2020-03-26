package blood.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import blood.bean.DogJoinDTO;
import blood.bean.DogiverDTO;
import blood.dao.BloodDAO;

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

}
