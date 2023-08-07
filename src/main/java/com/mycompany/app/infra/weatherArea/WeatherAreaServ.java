package com.mycompany.app.infra.weatherArea;

import java.util.List;

public interface WeatherAreaServ {
	public List<WeatherArea> selectList(WeatherAreaVo vo);
	
	public WeatherArea selectOne(WeatherAreaVo vo);
}
