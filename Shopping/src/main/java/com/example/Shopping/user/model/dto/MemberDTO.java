package com.example.Shopping.user.model.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberDTO {
	private int m_idx;
	private String m_id;
	private String m_passwd;
	private String m_name;
	private String m_tel;
	private String m_email;
	private int m_level;
	private String m_photo;
	private int m_point;
	private String m_join_date;
	private String m_birth;
}