package com.mycompany.app.infra.code;

import java.util.ArrayList;
import java.util.List;

public class Code {
	
	private String cdSeq;
	private String cdName;
	private String codeGroup_cgSeq;
	private int delNy;
	
	public static List<Code> cachedCodeArrayList = new ArrayList<Code>();
	
	public String getCdSeq() {
		return cdSeq;
	}
	public void setCdSeq(String cdSeq) {
		this.cdSeq = cdSeq;
	}
	public String getCdName() {
		return cdName;
	}
	public void setCdName(String cdName) {
		this.cdName = cdName;
	}
	public String getCodeGroup_cgSeq() {
		return codeGroup_cgSeq;
	}
	public void setCodeGroup_cgSeq(String codeGroup_cgSeq) {
		this.codeGroup_cgSeq = codeGroup_cgSeq;
	}
	public int getDelNy() {
		return delNy;
	}
	public void setDelNy(int delNy) {
		this.delNy = delNy;
	}
	public static List<Code> getCachedCodeArrayList() {
		return cachedCodeArrayList;
	}
	public static void setCachedCodeArrayList(List<Code> cachedCodeArrayList) {
		Code.cachedCodeArrayList = cachedCodeArrayList;
	}
	
	
	
}
