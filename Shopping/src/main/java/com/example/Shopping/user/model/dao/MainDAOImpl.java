package com.example.Shopping.user.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.Shopping.user.model.dto.MainDTO;

@Repository
public class MainDAOImpl implements MainDAO {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public String main(MainDTO dto) {
		return sqlSession.selectOne("main.main",dto);
	}
}
