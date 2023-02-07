package com.myspring.capstone.festival;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/festival")
public class FestivalController {
	private static final long serialVersionID = 1L;
	
	@RequestMapping(value="/test.do", method=RequestMethod.GET)
	public ModelAndView test(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		//인터셉트에서 전달된 뷰이름 가져옴
		String viewName = (String)request.getAttribute("viewName");
		
		ModelAndView mav = new ModelAndView(viewName);
		
		return mav;
	}
	
}
