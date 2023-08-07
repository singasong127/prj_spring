package com.mycompany.app.infra.index;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CurrentDateTime {
	
	Date now = new Date();
	SimpleDateFormat formatDate = new SimpleDateFormat("yyyyMMdd");
	SimpleDateFormat formatTime = new SimpleDateFormat("HHmm");
	String nowDate = formatDate.format(now);
	String nowTime = formatTime.format(now);
	
	public Date getNow() {
		return now;
	}
	public void setNow(Date now) {
		this.now = now;
	}
	public SimpleDateFormat getFormatDate() {
		return formatDate;
	}
	public void setFormatDate(SimpleDateFormat formatDate) {
		this.formatDate = formatDate;
	}
	public SimpleDateFormat getFormatTime() {
		return formatTime;
	}
	public void setFormatTime(SimpleDateFormat formatTime) {
		this.formatTime = formatTime;
	}
	public String getNowDate() {
		return nowDate;
	}
	public void setNowDate(String nowDate) {
		this.nowDate = nowDate;
	}
	public String getNowTime() {
		return nowTime;
	}
	public void setNowTime(String nowTime) {
		this.nowTime = nowTime;
	}
	
	
}
