package com.example.Shopping.user.model.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.Shopping.user.model.dto.LoginDTO;

@Repository
public class LoginDAOImpl implements LoginDAO {
	
	@Autowired
	SqlSession sqlSession;
	
//	@Override
//	public LoginDTO login(String dto) {
//		return sqlSession.selectOne("user_login.login",dto);
//	}
	
	@Override
	public String login(LoginDTO dto) {
		return sqlSession.selectOne("user_login.login", dto);
	}
}
