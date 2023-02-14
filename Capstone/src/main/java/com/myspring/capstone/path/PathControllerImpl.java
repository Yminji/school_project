package com.myspring.capstone.path;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.capstone.common.base.BaseController;

@Controller("pathController")
@RequestMapping(value="/path")
public class PathControllerImpl extends BaseController{
	
	@RequestMapping(value="/path.do", method=RequestMethod.GET)
	public ModelAndView path(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println("카카오 api 테스트");
		return mav;
	}
	
	@RequestMapping(value="/detail.do", method=RequestMethod.GET)
	public ModelAndView detail(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println("카카오 api 테스트");
		return mav;
	}
}
