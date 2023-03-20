package com.kosa.mvc2;

// 블록처리 + ctrl + shift + x -> 대문자화
// 블록처리 + ctrl + shift + y -> 소문자화
public final class DBUtil {
	public final static String DRIVER = "oracle.jdbc.driver.OracleDriver"; // ojdbc .jar파일 중에 드라이버를 얘가 사용하려고 불러오고 있음
	public final static String URL = "jdbc:oracle:thin:@127.0.0.1:1521:xe"; // jdbc에 연결할 것이다, thin 방식으로, @이하는 접속할 DB서버의 ip주소,
	public final static String USERID = "user01";
	public final static String PWD = "1234";
	// public - 외부에서 접근 가능, final - 상수화, static - DBUtil 속성의 객체를 만들지 않고 쓸 수 있도록

	private DBUtil() {

	}; // 클래스 외부에서 객체생성을 할 수 없도록 막기 위해 생성자 선언

}