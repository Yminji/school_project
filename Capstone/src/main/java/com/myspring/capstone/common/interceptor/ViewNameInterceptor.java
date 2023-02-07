package com.myspring.capstone.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ViewNameInterceptor extends HandlerInterceptorAdapter{
	//컨트롤러 실행 전 호출
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		try {
			String viewName = getViewName(request);
			request.setAttribute("viewName", viewName);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return true;
	}
	
	//컨트롤러 실행 후 DispatcherServlet이 뷰로 보내기 전에 호출
	@Override
	public void postHandle(HttpServletRequest rquest, HttpServletResponse response, Object handler, ModelAndView mav) throws Exception{
	}
	
	//뷰까지 수행하고 나서 호출
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception{
		
	}
	
	public String getViewName(HttpServletRequest request) throws Exception{
		String contextPath = request.getContextPath(); //요청 경로를 가져옴
		String uri = (String)request.getAttribute("javax.servlet.include.request_uri"); //포워드된 jsp 페이지에서 최초의 브라우저 또는 클라이언트 프로그램으로부터 호출될 때 사용된 URL을 가져옴
		if(uri == null || uri.trim().equals("")) //uri가 없으면
			uri = request.getRequestURI(); //uri 요청해서 가져옴
		
		int begin = 0;
		if(!(contextPath == null)|| ("".equals(contextPath))) //경로가 존재한다몀ㄴ
			begin = contextPath.length(); //경로의 길이의 값을 begin에 저장
		
		int end;
		if(uri.indexOf(";") != -1) //;이 존재한다면
			end = uri.indexOf(";"); //;이 처음 나온 위치의 인덱스 값을 end에 저장
		else if(uri.indexOf("?") != -1) //?가 존재한다면
			end = uri.indexOf("?"); //?가 처음 나온 위치의 인덱스 값 end에 저장
		else
			end = uri.length(); //아니라면 uri 길이의 값을 end에 저장
		
		String fileName = uri.substring(begin, end); //begin에서부터 end 전까지의 문자열까지 반환
		if(fileName.indexOf(".") != -1) //.이 존재한다면
			fileName = fileName.substring(0, fileName.lastIndexOf(".")); //0에서부터 마지막에 나오는 .전까지 fileName에 저장
		if(fileName.indexOf("/") != -1) // /가 존재한다면
			fileName = fileName.substring(fileName.lastIndexOf("/", 1), fileName.length()); //1부터 탐색해 /가 있는 인덱스값에서부터 fileName의 길이의 값까지의 문자열 반환
		
		return fileName;
	}
	
	
}
