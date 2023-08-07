package com.mycompany.app.infra.weatherArea;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class WeatherAreaDao {
	
	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	public String namespace = "com.mycompany.app.infra.weatherArea.WeatherAreaMpp";
	
	public List<WeatherArea> selectList(WeatherAreaVo vo) {return sqlSession.selectList(namespace + ".selectList", vo);}
	
	public WeatherArea selectOne(WeatherAreaVo vo) {return sqlSession.selectOne(namespace + ".selectOne", vo);}
	
}
