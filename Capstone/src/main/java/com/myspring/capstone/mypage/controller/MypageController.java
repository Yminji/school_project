package com.myspring.capstone.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface MypageController {
	public ModelAndView myPageMain(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView myDetailInfo(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
