package com.mycompany.app.infra.member;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Constants {
	public static final String UPLOAD_PATH_PREFIX_EXTERNAL = "D://factory/ws_sts4_4181/prj_spring/src/main/webapp";
	public static final String UPLOAD_PATH_PREFIX = "D://factory/ws_sts4_4181/prj_spring/src/main/webapp/resources/uploaded";
	public static final String UPLOAD_PATH_PREFIX_FOR_VIEW = "/resources/uploaded";
	private static final String DATETIME_FORMAT_BASIC = null;
	
	public static String nowString() throws Exception {
		LocalDateTime localDateTime = LocalDateTime.now();
		String localDateTimeString = localDateTime.format(DateTimeFormatter.ofPattern(Constants.DATETIME_FORMAT_BASIC));
		return localDateTimeString;
	}
}
