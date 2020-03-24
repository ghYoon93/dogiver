package blood.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import blood.bean.DogJoinDTO;
import blood.dao.DogJoinDAO;

@Service("DogJoinService")
public class DogJoinServiceImpl implements DogJoinService {
	@Autowired
	private DogJoinDAO dogJoinDAO;

	@Override
	public int dogInsert(DogJoinDTO dogJoinDTO) {
		return dogJoinDAO.dogInsert(dogJoinDTO);
	}

}
