package com.kosa.mvc2.common;

// 검색 기능에 필요한 공통 속성들을 모아놓은 DTO
// protected 쓴 이유 : 타 클래스에서 상속받아 접근 가능하게 하려고

// GuestbookDAO의 getList에서 페이징과 검색에 필요한 정보를 받아야 하므로 매개변수에 Guestbook paramDTO를 추가
// 컨트롤러에서 request 객체로부터 필요한 정보를 입력받아 paramDTO 객체에 담은 후 getList에 전달한다
public class BaseDTO {
	protected int pg=0;
	protected int rnum=0;
	protected String searchOpt="";		// 검색어 선택 옵션(제목, 내용, 카테고리, ....별 검색)
	protected String searchKeyword="";		// 검색어
	
	public int getPg() {
		return pg;
	}
	public void setPg(int pg) {
		this.pg = pg;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getSearchOpt() {
		return searchOpt;
	}
	public void setSearchOpt(String searchOpt) {
		this.searchOpt = searchOpt;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	

}
