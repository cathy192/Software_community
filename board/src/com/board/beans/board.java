package com.board.beans;

public class board {//계층간 데이터 교환을 위한 자바빈즈
	//번호
	private int num;
	
	//제목
	private String subject;
	
	//내용
	private String content;
	
	//아이디
	private String id;
	
	//이메일
	//private String Snum;
	
	//작성일자
	private String boarddate;
	
	//조회수
	private String score;
	
	//검색옵션
	public String opt;
	
	//카테고리
	public int category;
	
	//검색내용
	public String condition;
	
	public String getOpt() {
		return opt;
	}
	public void setOpt(String opt) {
		this.opt = opt;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public String getBoarddate() {
		return boarddate;
	}
	public void setBoarddate(String boarddate) {
		this.boarddate = boarddate;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	
}
