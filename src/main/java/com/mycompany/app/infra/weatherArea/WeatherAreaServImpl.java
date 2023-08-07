package com.mycompany.app.infra.weatherArea;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class WeatherAreaServImpl implements WeatherAreaServ {
	
	WeatherAreaDao dao;
	
	@Override
	public List<WeatherArea> selectList(WeatherAreaVo vo) {
		
		List<WeatherArea> list = dao.selectList(vo);
		
		return list;
	}

	@Override
	public WeatherArea selectOne(WeatherAreaVo vo) {
		
		return dao.selectOne(vo);
	}

}
