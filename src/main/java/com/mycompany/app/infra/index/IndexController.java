package com.mycompany.app.infra.index;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class IndexController {
	
	/*
	 * @RequestMapping(value="/") public String home(String href) {
	 * 
	 * // 여기에서 서버단에서 필요한 작업을 수행한다.
	 * 
	 * href="/resources/assets/css/style.css"; href="/resources/assets/js/main.js";
	 * href="/resources/assets/img/portfolio_bg.png"; href=
	 * "/resources/assets/img/vector-flat-illustration-software-developer-cyber-program-security_776789-207.avif";
	 * 
	 * // 아래의 jsp 파일 호출 return "home"; }
	 */
	
	@RequestMapping(value="/")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("home");
		
		return mav;
	}
	
	
	@RequestMapping(value="/user")
	public ModelAndView user() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("usr/infra/index/indexUsrView");
		
		return mav;
	}
	
		
	@RequestMapping("/team")
	public ModelAndView team() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("team/usr/index/indexUsrView");
		
		return mav;
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


