package contact.service;

import java.util.List;

import contact.bean.ContactDTO;

public interface ContactService {

	int contactWrite(ContactDTO contctDTO);

	public List<ContactDTO> contactList();


}
