package com.team.app.infra.api;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WeatherServiceImpl implements WeatherService {
	
	@Autowired
    private WeatherMapper weatherMapper;
	
	@Override
	public List<AreaRequestDTO> getArea(Map<String, String> params) {
		return this.weatherMapper.selectArea(params);
	}

}
