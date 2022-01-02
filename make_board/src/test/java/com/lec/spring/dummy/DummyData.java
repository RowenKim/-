package com.lec.spring.dummy;

import static org.junit.jupiter.api.Assertions.fail;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Random;

import org.junit.jupiter.api.Test;

class DummyData {
	// JDBC 관련 기본 객체 변수들 선언
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;   // executeQuery(), SELECT 결과 
	int cnt = 0;           // executeUpdate(), DML 결과

	// MySQL
	public static final String DRIVER = "com.mysql.cj.jdbc.Driver";  // JDBC 드라이버 클래스
	public static final String URL = "jdbc:mysql://localhost:3306/rowendb716";  // DB 서버 정보
	public static final String USERID = "rowen";   // DB 사용자 계정 정보
	public static final String USERPW = "1234";
	
	public static final String SQL_WRITE_INSERT = 
			"INSERT INTO board" + 
					"(userId, title, summary) " +
					"VALUES(?, ?, ?)";

	@Test
	void test() {
		fail("Not yet implemented");
	}
	
	
	String[] userId = {"짱구", "아이언맨", "철수", "토르", "로키", "유리", "훈이", "신형만", "봉미선"};
	Random rd = new Random();
	
	@Test
	void genData() {
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, USERID, USERPW);
			
			// 테스트용 dummy 데이터 만들기
			pstmt = conn.prepareStatement(SQL_WRITE_INSERT);
			
			int num = 100;
			for(int i = 0; i < num; i++) {
				pstmt.setString(1, String.format("%s", userId[rd.nextInt(9)])); 
				pstmt.setString(2, String.format("content%04d", i));	// content0000, content0001 .....
				pstmt.setString(3, String.format("name%04d", i)); 		//name0000, name0001.....
				cnt += pstmt.executeUpdate();
			}
			System.out.println(cnt + "개 의 데이터가 INSERT 되었습니다");
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
			
		}
	}

}
