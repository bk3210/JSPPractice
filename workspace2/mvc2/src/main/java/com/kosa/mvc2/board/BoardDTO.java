package com.kosa.mvc2.board;

import com.kosa.mvc2.common.BaseDTO;

public class BoardDTO extends BaseDTO {
	private String b_m_name;
	private String  seq = "";
	private String b_b_title = "";
	private String b_b_writer = "";
	private String b_b_contents = "";
	private String b_b_image="";
	private String b_b_hit="";
	private String b_b_wdate="";
	
	public String getB_m_name() {
		return b_m_name;
	}
	
	public void setB_m_name(String b_m_name) {
		this.b_m_name = b_m_name;
	}

	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getB_b_title() {
		return b_b_title;
	}
	public void setB_b_title(String b_b_title) {
		this.b_b_title = b_b_title;
	}
	public String getB_b_writer() {
		return b_b_writer;
	}
	public void setB_b_writer(String b_b_writer) {
		this.b_b_writer = b_b_writer;
	}
	public String getB_b_contents() {
		return b_b_contents;
	}
	public void setB_b_contents(String b_b_contents) {
		this.b_b_contents = b_b_contents;
	}
	public String getB_b_image() {
		return b_b_image;
	}
	public void setB_b_image(String b_b_image) {
		this.b_b_image = b_b_image;
	}
	public String getB_b_hit() {
		return b_b_hit;
	}
	public void setB_b_hit(String b_b_hit) {
		this.b_b_hit = b_b_hit;
	}
	public String getB_b_wdate() {
		return b_b_wdate;
	}
	public void setB_b_wdate(String b_b_wdate) {
		this.b_b_wdate = b_b_wdate;
	}

	
	
	
}