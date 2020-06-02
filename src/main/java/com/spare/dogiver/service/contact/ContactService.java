package com.spare.dogiver.service.contact;

import java.util.List;

import com.spare.dogiver.web.dto.ContactDTO;

public interface ContactService {

	int contactWrite(ContactDTO contctDTO);

	public List<ContactDTO> contactList();

	public List<ContactDTO> myContactList();

	public void admin_contect_delete(String seq);

	public List<ContactDTO> getInfo(String email);

	public void my_contect_delete(String seq);


}
