package com.myspring.capstone.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.capstone.bookmark.vo.BookMarkVO;
import com.myspring.capstone.common.base.BaseController;
import com.myspring.capstone.member.vo.MemberVO;
import com.myspring.capstone.mypage.service.MypageService;

@Controller("mypageController")
@RequestMapping("/mypage")
public class MypageControllerImpl extends BaseController implements MypageController{
	/*@Autowired
	private MypageService mypageService;
	*/
	@Autowired
	private MemberVO memberVO;
	
	@Override
	@RequestMapping(value="/mypageMain.do", method=RequestMethod.GET)
	public ModelAndView myPageMain(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		memberVO = (MemberVO)session.getAttribute("memberInfo");
		String member_name = memberVO.getMember_name();
		mypageVO.setMember_name(member_name);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/myDetailInfo.do", method=RequestMethod.POST)
	public ModelAndView myDetailInfo(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
}
