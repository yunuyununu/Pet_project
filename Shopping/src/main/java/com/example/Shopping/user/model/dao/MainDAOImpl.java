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
	public MainDTO main(String userid) {
		return sqlSession.selectOne("main.main",userid);
	}
}
