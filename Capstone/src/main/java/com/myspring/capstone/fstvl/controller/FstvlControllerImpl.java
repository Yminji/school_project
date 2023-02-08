package com.myspring.capstone.fstvl.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.capstone.common.base.BaseController;
import com.myspring.capstone.fstvl.service.FstvlService;
import com.myspring.capstone.fstvl.vo.FstvlVO;

@Controller("fstvlController")
@RequestMapping(value="/fstvl")
public class FstvlControllerImpl extends BaseController implements FstvlController{
	@Autowired
	private FstvlService fstvlService;
	
	@RequestMapping(value="/fstvlDetail.do", method=RequestMethod.GET)
	public ModelAndView fstvlDetail(@RequestParam("fstvl_id") int fstvl_id,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		Map fstvlMap = fstvlService.fstvlDetail(fstvl_id);
		mav.addObject("fstvlMap", fstvlMap);
		FstvlVO fstvlVO = (FstvlVO)fstvlMap.get("fstvlVO");
		return mav;
	}
	
	
}
