package com.mycompany.app.codegroup;

public class CodeGroup {
	
	// db 컬럼명 첫 글자는 소문자
	// seq는 편의 상 db에는 int지만 자바에서는 String으로 사용한다.
	// 주로 테이블의 컬럼명과 일치
	
	private String cgSeq;
	private String cgName;
//	-----
	public String getCgSeq() {
		return cgSeq;
	}
	public void setCgSeq(String cgSeq) {
		this.cgSeq = cgSeq;
	}
	public String getCgName() {
		return cgName;
	}
	public void setCgName(String cgName) {
		this.cgName = cgName;
	}
	
	
}
