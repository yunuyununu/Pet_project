package com.example.Shopping.user.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override  // 아이디 중복체크
	public int id_check(String m_id) {
		 return sqlSession.selectOne("member.id_check", m_id);
	}
}
