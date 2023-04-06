package com.myspring.capstone.common.base;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

public class BaseController {
	private static final String CURR_IMAGE_REPO_PATH = "C:\\festival\\file_repo";
	
	
	private void deleteFile(String fileName) {
		File file = new File(CURR_IMAGE_REPO_PATH+"\\"+fileName);
		try {
			file.delete();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/*.do", method= {RequestMethod.POST, RequestMethod.GET})
	protected ModelAndView viewForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
}
