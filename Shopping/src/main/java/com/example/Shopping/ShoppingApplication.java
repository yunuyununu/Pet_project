package com.example.Shopping;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

@SpringBootApplication //기본 애플리케이션 진입점 정의
public class ShoppingApplication {
	
	//애플리케이션 진입점
	public static void main(String[] args) {
		//Spring Boot 애플리케이션 시작
		/* * 내부적으로 아래 작업 수행
		 Spring 컨텍스트 생성 및 초기화.
		 애플리케이션 설정 로드(application.properties)
		 내장된 Tomcat 서버 시작.
		 */
		SpringApplication.run(ShoppingApplication.class, args);
	}
	
	//SqlSessionFactory는 MyBatis의 핵심 객체. SQL 실행과 DB 연결 관리
	//SqlSessionFactoryBean은 Spring 환경에서 SqlSessionFactory를 생성하는 도우미 클래스
	@Bean
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
		/* DataSource 설정
		 - Spring Boot의 자동 설정으로 제공되는 데이터소스를 SqlSessionFactory에 주입
		 - DataSource는 데이터베이스 연결 풀을 관리
		*/
		SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
		bean.setDataSource(dataSource);
		/* Mapper XML 파일 위치 지정
		 - PathMatchingResourcePatternResolver를 사용해 classpath:mapper/*.xml 경로의 매퍼 파일들을 검색
		 - MyBatis는 XML 파일에 작성된 SQL 문과 Java 인터페이스를 연결
		*/
		Resource[] res = new PathMatchingResourcePatternResolver().getResources("classpath:mappers/**/*.xml");
		bean.setMapperLocations(res);
		return bean.getObject();
	}
	
	/* SqlSessionTemplate은 MyBatis의 SQL 세션을 구현한 클래스.
	 - 트랜잭션을 처리하며, 스레드 안전성을 제공
	 - MyBatis와 데이터베이스 간의 연결을 관리.
	 - Mapper 인터페이스를 통해 SQL을 실행하는 데 사용.
	*/
	@Bean
	public SqlSessionTemplate sqlSession(SqlSessionFactory factory) {
		return new SqlSessionTemplate(factory);
	}

}
