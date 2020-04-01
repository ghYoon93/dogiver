package contact.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.bean.BoardDTO;
import contact.bean.ContactDTO;
import contact.dao.ContactDAO;


@Service
public class ContactServiceImpl implements ContactService {
	@Autowired
	private ContactDAO contactDAO;

	@Override
	public int contactWrite(ContactDTO contctDTO) {
		return contactDAO.contactWrite(contctDTO);
		
	}

	@Override
	public List<ContactDTO> contactList() {
		List<ContactDTO> list = contactDAO.contactList();
		return list;
	}
	
	

	 
	
}










