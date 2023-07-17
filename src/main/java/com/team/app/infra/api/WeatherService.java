package com.team.app.infra.api;

import java.util.List;
import java.util.Map;

public interface WeatherService {
	List<AreaRequestDTO> getArea(Map<String, String> params);
}
