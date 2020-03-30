package contact.dao;

import java.util.List;

import contact.bean.ContactDTO;

public interface ContactDAO {

	int contactWrite(ContactDTO contactDTO);

	public List<ContactDTO> contactList();

}
