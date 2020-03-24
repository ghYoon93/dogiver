package blood.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import blood.bean.DogJoinDTO;
import blood.dao.BloodDAO;

@Service("BloodService")
public class BloodServiceImpl implements BloodService {
	@Autowired
	private BloodDAO bloodDAO;

	@Override
	public int dogInsert(DogJoinDTO dogJoinDTO) {
		return bloodDAO.dogInsert(dogJoinDTO);
	}

}
