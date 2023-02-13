package com.myspring.capstone.bookmark.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

public interface BookMarkController {
	public ModelAndView bookMarkMain(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public @ResponseBody String addFstvlInBookMark(@RequestParam("fstvl_id") int fstvl_id, HttpServletRequest request, HttpServletResponse response)throws Exception;
	
	public ModelAndView removeBookMarkFstvl(@RequestParam("RegNO") int regNO, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
