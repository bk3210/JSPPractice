package com.kosa.mvc1.score;

public class ScoreDTO {
	private String seq = "";
	private String name = "";
	private String kor = "";
	private String mat = "";
	private String eng = "";
	private String wdate = "";
	
	
	public ScoreDTO(String seq, String name, String kor, String mat, String eng, String wdate) {
		super();
		this.seq = seq;
		this.name = name;
		this.kor = kor;
		this.mat = mat;
		this.eng = eng;
		this.wdate = wdate;
	}

	public ScoreDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getSeq() {
		return seq;
	}


	public void setSeq(String seq) {
		this.seq = seq;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getKor() {
		return kor;
	}


	public void setKor(String kor) {
		this.kor = kor;
	}


	public String getMat() {
		return mat;
	}


	public void setMat(String mat) {
		this.mat = mat;
	}


	public String getEng() {
		return eng;
	}


	public void setEng(String eng) {
		this.eng = eng;
	}


	public String getWdate() {
		return wdate;
	}


	public void setWdate(String wdate) {
		this.wdate = wdate;
	}



}
