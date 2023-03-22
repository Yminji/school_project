package com.myspring.capstone.path.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.capstone.common.base.BaseController;
import com.myspring.capstone.member.vo.MemberVO;
import com.myspring.capstone.path.service.PathService;
import com.myspring.capstone.path.vo.PathVO;

@Controller("pathController")
@RequestMapping(value="/path")
public class PathControllerImpl extends BaseController{
	@Autowired
	protected PathService pathService;
	
	@Autowired
	protected PathVO pathVO;
	
	@Autowired
	protected MemberVO memberVO;
	
	//동선 첫 페이지
	@RequestMapping(value="/path.do", method=RequestMethod.GET)
	public ModelAndView path(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		String member_id = memberVO.getMember_id();
		pathVO.setMember_id(member_id);
		Map<String, List> pathMap = pathService.pathList(pathVO);
		session.setAttribute("pathMap", pathMap);
		return mav;
	}
	
	//위도, 경도, 이름 저장
	@RequestMapping(value="/addPlace.do", method = RequestMethod.POST, produces="application/text; charset=utf-8")
	public @ResponseBody void addPlace(@RequestParam("latitude") String latitude, @RequestParam("longitude") String longitude, @RequestParam("placeName") String placeName,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("memberInfo");
		String member_id = memberVO.getMember_id();
		
		memberVO.setMember_id(member_id);
		pathVO.setLatitude(latitude);
		pathVO.setLongitude(longitude);
		pathVO.setPlaceName(placeName);
		
		pathService.addPlace(pathVO);
	}
	
	//동선 저장 페이지
	@RequestMapping(value="/detail.do", method=RequestMethod.GET)
	public ModelAndView detail(HttpServletRequest request, HttpServletResponse response) throws Exception{ 
		request.setCharacterEncoding("utf-8");
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		String member_id = memberVO.getMember_id();
		pathVO.setMember_id(member_id);
		Map<String, List> detailMap = pathService.detailList(pathVO);
		session.setAttribute("detailMap", detailMap);
		return mav;
	}
	
	//동선 수정 페이지(추가)
	@RequestMapping(value="/plan.do", method=RequestMethod.POST, produces="application/text; charset=utf-8")
	public ModelAndView plan(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		//System.out.println("plan");
		return mav;
	}
	
	/*@RequestMapping(value="/addPath.do", method=RequestMethod.POST, produces="application/text; charset=utf-8")
	public ModelAndView plan(@RequestParam("regNO") int regNO, HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		//System.out.println("plan");
		return mav;
	}
	
	동선 삭제
	public ModelAndView removePath(@RequestParam("regNO") int regNO, HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		//pathService.removePath(regNO);
		mav.setViewName("redirect:/path/pathList,do");
		return mav;
	}*/
}
