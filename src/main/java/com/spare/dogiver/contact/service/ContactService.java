package com.spare.dogiver.contact.service;

import java.util.List;

import com.spare.dogiver.contact.dto.ContactDTO;

public interface ContactService {

	int contactWrite(ContactDTO contctDTO);

	public List<ContactDTO> contactList();

	public List<ContactDTO> myContactList();

	public void admin_contect_delete(String seq);

	public List<ContactDTO> getInfo(String email);

	public void my_contect_delete(String seq);


}
