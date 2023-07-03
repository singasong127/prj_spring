package com.mycompany.app.infra.codegroup;

public class PageMaker {
	
	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int total;
	private CodeGroup cri;
	
	public PageMaker(CodeGroup cri, int total) {
		
		this.cri = cri;
		this.total = total;
		
		
	}
	
	
	
}
