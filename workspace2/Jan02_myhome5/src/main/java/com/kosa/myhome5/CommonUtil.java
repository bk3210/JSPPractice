package com.kosa.myhome5;

public class CommonUtil {

	// 생성자에 private 붙이면 클래스 밖에서 객체 생성이 안됨(접근을 할 수가 없어서)
	// 그래서 singleton 기법으로 클래스 생성할 때도 private 붙임
	private CommonUtil() {

	}
	
	public static String nullToValue(Object ob1, String value) {
		if(ob1 == null || ob1.toString().equals("")) {
			return value;
		}else {
			return ob1.toString();
		}
	}

}
