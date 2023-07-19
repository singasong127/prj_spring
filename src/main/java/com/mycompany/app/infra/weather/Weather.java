package com.mycompany.app.infra.weather;

public class Weather {
	
	private Double temp; // 온도

    private Double rainAmount; // 강수량

    private Double humid; // 습도

    private String lastUpdateTime; // 마지막 갱신 시각 (시간 단위)

	public Double getTemp() {
		return temp;
	}

	public void setTemp(Double temp) {
		this.temp = temp;
	}

	public Double getRainAmount() {
		return rainAmount;
	}

	public void setRainAmount(Double rainAmount) {
		this.rainAmount = rainAmount;
	}

	public Double getHumid() {
		return humid;
	}

	public void setHumid(Double humid) {
		this.humid = humid;
	}

	public String getLastUpdateTime() {
		return lastUpdateTime;
	}

	public void setLastUpdateTime(String lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}
    
    
	
}
