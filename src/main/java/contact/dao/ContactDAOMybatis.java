package contact.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import contact.bean.ContactDTO;

@Repository
@Transactional
public class ContactDAOMybatis implements ContactDAO {
	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public int contactWrite(ContactDTO contactDTO) {
		return sqlSession.insert("contactSQL.contactWrite", contactDTO);
		
	}
}













