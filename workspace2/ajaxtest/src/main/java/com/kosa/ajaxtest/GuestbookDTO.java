package com.kosa.ajaxtest;

public class GuestbookDTO {
	private String seq = "";
	private String title = "";
	private String writer = "";
	private String wdate = "";
	private String contents = "";
	private String hit = "";
	// DB에서 불러올 속성들

	public GuestbookDTO(String seq, String title, String writer, String wdate, String contents, String hit) {
		super();
		this.seq = seq;
		this.title = title;
		this.writer = writer;
		this.wdate = wdate;
		this.contents = contents;
		this.hit = hit;
	}

	public GuestbookDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getHit() {
		return hit;
	}

	public void setHit(String hit) {
		this.hit = hit;
	}

}