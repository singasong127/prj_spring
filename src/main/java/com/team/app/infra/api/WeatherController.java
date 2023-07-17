package com.team.app.infra.api;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class WeatherController {
	@Autowired
    private WeatherService weatherService;

    @GetMapping(value = "/team")
    public String openWeatherPage()
    {
        return "team/usr/index/indexUsrView";
    }
    
    @PostMapping(value = "/team.do")
    @ResponseBody
    public List<AreaRequestDTO> getAreaStep(@RequestParam Map<String, String> params)
    {
        return this.weatherService.getArea(params);
    }
}
