package contact.service;

import java.util.List;

import contact.bean.ContactDTO;

public interface ContactService {

	int contactWrite(ContactDTO contctDTO);

	public List<ContactDTO> contactList();

	public List<ContactDTO> myContactList();

	public void admin_contect_delete(String seq);


}
