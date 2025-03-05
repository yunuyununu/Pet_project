package com.example.Shopping.user.model.dao;

public interface MemberDAO {
	
	// 회원 아이디 중복 체크
	int id_check(String m_id);
	
}
