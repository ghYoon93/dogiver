package com.spare.dogiver.persistence.contact;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spare.dogiver.web.dto.ContactDTO;

@Repository
@Transactional
public class ContactDAOMybatis implements ContactDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int contactWrite(ContactDTO contactDTO) {
		return sqlSession.insert("contactSQL.contactWrite", contactDTO);
		
	}

	@Override
	public List<ContactDTO> contactList() {
		return sqlSession.selectList("contactSQL.contactList");
	}

	@Override
	public List<ContactDTO> myContactList() {
		return sqlSession.selectList("contactSQL.myContactList");
	}

	@Override
	public void admin_contect_delete(String seq) {
		sqlSession.delete("contactSQL.admin_contect_delete", Integer.parseInt(seq));
	}

	@Override
	public List<ContactDTO> getInfo(String email) {
		return sqlSession.selectList("contactSQL.getInfo", email);
	}

	@Override
	public void my_contect_delete(String seq) {
		sqlSession.delete("contactSQL.my_contect_delete", Integer.parseInt(seq));
	}
}













