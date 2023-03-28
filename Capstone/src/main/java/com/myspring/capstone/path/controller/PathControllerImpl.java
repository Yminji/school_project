package com.myspring.capstone.path.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.capstone.common.base.BaseController;
import com.myspring.capstone.member.vo.MemberVO;
import com.myspring.capstone.path.service.PathService;
import com.myspring.capstone.path.vo.MapVO;
import com.myspring.capstone.path.vo.PathVO;

@Controller("pathController")
@RequestMapping(value="/path")
public class PathControllerImpl extends BaseController{
	@Autowired
	private PathService pathService;
	
	@Autowired
	private PathVO pathVO;
	
	@Autowired
	private MemberVO memberVO;
	
	@Autowired
	private MapVO mapVO;
	
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
	/*@RequestMapping(value="/addPlace.do", method = RequestMethod.POST, produces="application/text; charset=utf-8")
	public @ResponseBody void addPlace(@RequestParam("latitude") String latitude, @RequestParam("longitude") String longitude, @RequestParam("placeName") String placeName,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("memberInfo");
		String member_id = memberVO.getMember_id();
		
		pathVO.setMember_id(member_id);
		//pathVO.setLatitude(latitude);
		//pathVO.setLongitude(longitude);
		//pathVO.setPlaceName(placeName);
		pathService.addPlace(pathVO);
	}*/
	
	//위도, 경도, 이름 저장
		@RequestMapping(value="/addPlan.do", method = RequestMethod.POST)
		public ModelAndView addPlan(@ModelAttribute("map") MapVO map, HttpServletRequest request, HttpServletResponse response) throws Exception{
			ModelAndView mav = new ModelAndView();
			HttpSession session = request.getSession();
			memberVO = (MemberVO) session.getAttribute("memberInfo");
			String member_id = memberVO.getMember_id();
			map.setMember_id(member_id);
			pathService.addPlan(map);
			mav.setViewName("redirect:/path/plan.do");
			return mav;
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
	
	//동선 수정 (추가)
	@RequestMapping(value="/plan.do", method=RequestMethod.GET)
	public ModelAndView plan(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		String viewName = (String)request.getAttribute("viewName"); 
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession(); 
		MemberVO memberVO = (MemberVO)session.getAttribute("memberInfo"); //세션에서 회원정보를 가져옴
		String member_id =   memberVO.getMember_id(); //회원 아이디를 가져옴
		mapVO.setMember_id(member_id); //회원 아이디를 저장
		//Map<String, List> pathList = pathVO.pathList(pathVO); //북마크 페이지에 표시할 정보를 가져옴
		Map<String, List> mapMap = pathService.mapList(mapVO);
		session.setAttribute("mapMap", mapMap); //북마크 목록을 세션에 저장
		return mav;
	}
	
	
	/*@RequestMapping(value="/addPath.do", method=RequestMethod.POST, produces="application/text; charset=utf-8")
	public ModelAndView plan(@RequestParam("regNO") int regNO, HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		//System.out.println("plan");
		return mav;
	}*/
	
	
	//동선 삭제
	@RequestMapping(value="/removeMap.do", method=RequestMethod.POST)
	public ModelAndView removeMap(@RequestParam("regNO") int regNO, HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		pathService.removeMap(regNO); 
		mav.setViewName("redirect:/path/plan.do");
		return mav;
	}
}
