package com.myspring.capstone.fstvl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class FestivalApi {
	public static void main(String[] args) throws IOException {
		try {
	        StringBuilder urlBuilder = new StringBuilder("http://api.data.go.kr/openapi/tn_pubr_public_cltur_fstvl_api"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=vV1V4z5VeFV5FsZDo8dVr7Di601HssrdbU3saDwOtSM9XVQG7zoQzXXeF5ok6Qnh%2Fp%2FNop%2FnvmomAnocFI2wCA%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*XML/JSON 여부*/
	        
	        URL url = new URL(urlBuilder.toString());
	        
	        String line="";
	        String result = "";
	        
	        BufferedReader br;
	        br = new BufferedReader(new InputStreamReader(url.openStream()));
	        while((line = br.readLine()) != null) {
	        	result = result.concat(line);
	        }
	        
	       //JSON parser 만들어 문자열 데이터를 객체화
	        JSONParser jsonParser = new JSONParser();
	        JSONObject jsonObject = (JSONObject)jsonParser.parse(result);

	        JSONArray array = (JSONArray)jsonObject.get("body");
	        for(int i = 0; i < array.size(); i++) {
	        	System.out.println("items__"+i+"===========================");
	        	
	        	JSONObject object = (JSONObject)array.get(i);
	        	String items = (String)object.get("items");
	        	StringBuffer sb = new StringBuffer();
	        	sb.append("fstvlNm : "+items);
	        	System.out.println(sb.toString());
	        }
	        br.close();
        }catch(Exception e) {
        	e.printStackTrace();
        }
        
        //System.out.println(sb.toString());
    }
}
