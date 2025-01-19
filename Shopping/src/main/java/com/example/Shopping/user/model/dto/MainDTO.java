package com.example.Shopping.user.model.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MainDTO {
	private String userid;
	private String passwd;
	private String name;
	private String email;
	private Date join_date;
}
