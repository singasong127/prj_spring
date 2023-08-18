package com.mycompany.app.infra.index;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mycompany.app.infra.weatherArea.WeatherArea;
import com.mycompany.app.infra.weatherArea.WeatherAreaServImpl;
import com.mycompany.app.infra.weatherArea.WeatherAreaVo;

@Controller
public class IndexController {
	
	@Autowired
	WeatherAreaServImpl service;
	
	@RequestMapping(value="/")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("home");
		
		return mav;
	}
	
	@RequestMapping(value="/user")
	public String user(@ModelAttribute("vo") WeatherAreaVo vo, WeatherArea area, Model model, CurrentDateTime datetime) throws Exception {
		
//		System.out.println("step1: " + vo.getStep1());
//		System.out.println("step2: " + vo.getStep2());
//		System.out.println("step3: " + vo.getStep3());
		
		System.out.println(datetime.getNowDate());
		
		String apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?serviceKey=b%2BIIc8uynU4kozxcKc4cqsrVam5GEW4NpYgDvXjQZqrJEUXXUVb9yKBUncl1i6nr%2FRT5G1BVbopgGeEdpoGiew%3D%3D&numOfRows=10&dataType=JSON&pageNo=1&base_date="+ datetime.getNowDate() +"&base_time=0800&nx=55&ny=127";
		
		URL url = new URL(apiUrl);
		HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
		httpURLConnection.setRequestMethod("GET");
		
		BufferedReader bufferedReader;
		if (httpURLConnection.getResponseCode() >= 200 && httpURLConnection.getResponseCode() <= 300) {
			bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream()));
		} else {
			bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getErrorStream()));
		}
		
		StringBuilder stringBuilder = new StringBuilder();
		String line;
		while ((line = bufferedReader.readLine()) != null) {
//			System.out.println("line: " + line);
			stringBuilder.append(line);
		}
		
		bufferedReader.close();
		httpURLConnection.disconnect();
		
		ObjectMapper objectMapper = new ObjectMapper();
	      
		Map<String, Object> map = objectMapper.readValue(stringBuilder.toString(), Map.class);
      
//		System.out.println("######## Map");
//		for (String key : map.keySet()) {
//			String value = String.valueOf(map.get(key));	// ok
//			System.out.println("[key]:" + key + ", [value]:" + value);
//		}
		
		Map<String, Object> response = new HashMap<String, Object>();
		response = (Map<String, Object>) map.get("response");
		
				
//		System.out.println("######## Response");
//		for (String key : response.keySet()) {
//			String value = String.valueOf(response.get(key));	// ok
//			System.out.println("[key]:" + key + ", [value]:" + value);
//		}
		
//		System.out.println("response.get(\"header\"): " + response.get("header"));
//		System.out.println("response.get(\"body\"): " + response.get("body"));
		
		Map<String, Object> body = new HashMap<String, Object>();
		body = (Map<String, Object>) response.get("body");
		
		Map<String, Object> items = new HashMap<String, Object>();
		items = (Map<String, Object>) body.get("items");
		
		List<Weather> item = new ArrayList<Weather>();
		item = (List<Weather>) items.get("item");
		
//		System.out.println("items: " + item);
		
//		System.out.println("item.size(): " + item.size());

		model.addAllAttributes(response);
//		model.addAllAttributes(header);
		model.addAllAttributes(body);
		model.addAllAttributes(items);
		
		
		return "usr/infra/index/indexUsrView";
	}
	
	@ResponseBody
	@RequestMapping(value="/user/getarea", method=RequestMethod.POST)
	public Map<String, Object> getArea(WeatherAreaVo vo, Model model,
			@RequestParam String step1,
			@RequestParam String step2,
			@RequestParam String step3) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		WeatherArea area = service.selectOne(vo);
		
		vo.setStep1(step1);
		vo.setStep2(step2);
		vo.setStep3(step3);
		
		System.out.println(vo.getStep1());
		System.out.println(vo.getStep2());
		System.out.println(vo.getStep3());
		
		if(area != null) {
			model.addAttribute("area", area);
			
			returnMap.put("rtArea", area);
			returnMap.put("rt", "success");
		} else {
			returnMap.put("rt", "fail");
		}
		
		return returnMap;
	}
	
	@RequestMapping("/publicCorona1List")
	public String publicCorona1List(Model model) throws Exception {
		
		System.out.println("dadsadada");
		
		String apiUrl = "http://apis.data.go.kr/1471000/CovidDagnsRgntProdExprtStusService/getCovidDagnsRgntProdExprtStusInq?serviceKey=b%2BIIc8uynU4kozxcKc4cqsrVam5GEW4NpYgDvXjQZqrJEUXXUVb9yKBUncl1i6nr%2FRT5G1BVbopgGeEdpoGiew%3D%3D&type=json";
		
		URL url = new URL(apiUrl);
		HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
		httpURLConnection.setRequestMethod("GET");
		
		BufferedReader bufferedReader;
		if (httpURLConnection.getResponseCode() >= 200 && httpURLConnection.getResponseCode() <= 300) {
			bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream()));
		} else {
			bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getErrorStream()));
		}
		
		StringBuilder stringBuilder = new StringBuilder();
		String line;
		while ((line = bufferedReader.readLine()) != null) {
			System.out.println("line: " + line);
			stringBuilder.append(line);
		}
		
		bufferedReader.close();
		httpURLConnection.disconnect();
		
		ObjectMapper objectMapper = new ObjectMapper();
	      
		Map<String, Object> map = objectMapper.readValue(stringBuilder.toString(), Map.class);
	      
		System.out.println("######## Map");
			for (String key : map.keySet()) {
				String value = String.valueOf(map.get(key));	// ok
				System.out.println("[key]:" + key + ", [value]:" + value);
			}
			
			Map<String, Object> header = new HashMap<String, Object>();
			header = (Map<String, Object>) map.get("header");
			
			System.out.println("######## Header");
			for (String key : header.keySet()) {
				String value = String.valueOf(header.get(key));	// ok
				System.out.println("[key]:" + key + ", [value]:" + value);
			}
			
			String aaa = (String) header.get("resultCode");
			
			System.out.println("header.get(\"resultCode\"): " + header.get("resultCode"));
			System.out.println("header.get(\"resultMsg\"): " + header.get("resultMsg"));
			
			Map<String, Object> body = new HashMap<String, Object>();
			body = (Map<String, Object>) map.get("body");
			
			List<Test> items = new ArrayList<Test>();
			items = (List<Test>) body.get("items");
			
			System.out.println("items.size(): " + items.size());
			
//			for(Test item : items) {
//				System.out.println(item.getMM());
//			}
			
			model.addAllAttributes(header);
			model.addAllAttributes(body);
		
		return "test/testCorona";
	}
}


