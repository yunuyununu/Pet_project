package com.example.Shopping.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.security.web.firewall.HttpFirewall;

@Configuration // 설정 클래스
@EnableWebSecurity // Spring Security 활성화
public class SecurityConfig {
	// HttpSecurity를 설정하는 메서드
	@Bean
	protected SecurityFilterChain configure(HttpSecurity http) throws Exception {
		http.csrf(AbstractHttpConfigurer::disable); // CSRF 보호 비활성화. (CSRF 공격 방어 기능을 끔.)
		// 일반적인 REST API에서는 CSRF가 필요 없어서 비활성화하는 경우가 많음.
		return http.build();
		// 보안 설정을 적용하고 SecurityFilterChain을 반환함.
	}

	@Bean
	PasswordEncoder pwdEncoder() {
		return new BCryptPasswordEncoder();
		// 비밀번호 암호화용 BCryptPasswordEncoder 빈을 생성.
		// 회원가입 시 입력한 비밀번호를 안전하게 저장하기 위해 사용함.
	}
	
	public void configure(WebSecurity web) throws Exception { // 방화벽 설정
		web.httpFirewall(defaultHttpFirewall());
		// 특수 문자(//,.. 등)가 포함된 요청을 허용하도록 설정
	}

	@Bean
	HttpFirewall defaultHttpFirewall() { // 기본 방화벽 설정
		return new DefaultHttpFirewall();
		// Spring Security의 기본 방화벽을 그대로 사용.
	}

}