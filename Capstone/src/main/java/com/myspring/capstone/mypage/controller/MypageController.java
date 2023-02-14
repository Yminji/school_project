package com.myspring.capstone.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.capstone.member.vo.MemberVO;

public interface MypageController {
	public ModelAndView myPageMain(@ModelAttribute("_memberVO") MemberVO _memberVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	//public ModelAndView mypageMain(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView myDetailInfo(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
