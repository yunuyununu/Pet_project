package com.example.Shopping.admin.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.Shopping.admin.model.dto.AdminDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public String login(AdminDTO dto) {
		return sqlSession.selectOne("admin_login.login", dto);
	}
}
