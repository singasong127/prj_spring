package com.team.app.infra.api;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WeatherMapper {
	List<AreaRequestDTO> selectArea(Map<String, String> params);
}
