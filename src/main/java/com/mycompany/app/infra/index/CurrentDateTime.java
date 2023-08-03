package com.mycompany.app.infra.index;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CurrentDateTime {
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyyMMdd HHmm", timezone = "Asia/Seoul")
	private LocalDateTime nowDateTime;

	public LocalDateTime getNowDateTime() {
		return nowDateTime;
	}

	public void setNowDateTime(LocalDateTime nowDateTime) {
		this.nowDateTime = nowDateTime;
	}
	
	
}
