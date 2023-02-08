package com.myspring.capstone.fstvl.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface FstvlController {
	public ModelAndView fstvlDetail(@RequestParam("fstvl_id") int fstvl_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
