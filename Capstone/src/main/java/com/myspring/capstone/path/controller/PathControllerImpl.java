package com.myspring.capstone.path.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping(value= "/path.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView path(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession(); 
		MemberVO memberVO = (MemberVO)session.getAttribute("memberInfo"); //세션에서 회원정보를 가져옴
		String member_id = memberVO.getMember_id();
		pathVO.setMember_id(member_id);
		List articlesList = pathService.listArticles(pathVO);
		mav.addObject("articlesList", articlesList);
		return mav;
		
	}
	
	@RequestMapping(value="/addNewArticle.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewArticle(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration enu = request.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = request.getParameter(name);
			articleMap.put(name, value);
		}
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		String member_id = memberVO.getMember_id();
		articleMap.put("member_id", member_id);
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int articleNO = pathService.addNewArticle(articleMap);
			message = "<script>";
			message += "openWin = window.close();";
			message += "opener.location.href='"+request.getContextPath()+"/path/planMap.do?articleNO="+articleNO+"';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			message = "<script>";
			message += "alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			//message += "location.href='"+request.getContextPath()+"/path/path.do';";
			message += "openWin = window.close();";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	@RequestMapping(value="/addNewMap.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewMap(HttpServletRequest request, HttpServletResponse response) throws Exception{
		  request.setCharacterEncoding("utf-8");
		  Map<String, Object> articleMap = new HashMap<String, Object>();
		  Enumeration enu = request.getParameterNames();
		  while(enu.hasMoreElements()) {
			  String name = (String)enu.nextElement();
			  String value = request.getParameter(name);
			  articleMap.put(name, value);
		  }
		  
		  
		  String articleNO=(String)articleMap.get("articleNO");
		  articleMap.put("articleNO", articleNO);
		  
		  String message;
		  ResponseEntity resEnt = null;
		  HttpHeaders responseHeaders = new HttpHeaders();
		  responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		  try {
			  pathService.addNewMap(articleMap);
			  message = "<script>";
			  message += "alert('저장되었습니다.');";
			  message += "location.href='"+request.getContextPath()+"/path/path.do";
			  resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		  }catch(Exception e) {
			  message = "<script>";
			  message += "alert('오류가 발생했습니다. 다시 시도해주세요.');";
			  message += "location.href='"+request.getContextPath()+"/path/path.do";
			  resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			  e.printStackTrace();
		  }
		  return resEnt;
	}
	
	@RequestMapping(value="/addPlan.do", method = RequestMethod.POST)
	public ResponseEntity addPlan(@RequestParam("articleNO") int articleNO, @ModelAttribute("map") MapVO map,  HttpServletRequest request, HttpServletResponse response) throws Exception{
		map.setArticleNO(articleNO);
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			pathService.addPlan(map);
			message  = "<script>";
			message +=" alert('저장했습니다.');";
			//message += " location.href='"+request.getContextPath()+"/path/plan.do';";
			message += " </script>";
			
			}catch(Exception e) {
			message  = "<script>";
			message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
			message += " </script>";
			e.printStackTrace();
			}
		
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	//동선 수정 (추가)
	@RequestMapping(value="/planMap.do", method=RequestMethod.GET)
	public ModelAndView plan(@RequestParam("articleNO") int articleNO, HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		String viewName = (String)request.getAttribute("viewName"); 
		ModelAndView mav = new ModelAndView(viewName);
		mapVO.setArticleNO(articleNO);
		Map<String, List> mapMap = pathService.mapList(mapVO);
		Map planMap = pathService.pathDetail(articleNO);
		mav.addObject("mapMap", mapMap); 
		mav.addObject("articleNO", articleNO); 
		mav.addObject("planMap", planMap);
		return mav;
	}
	
	@RequestMapping(value="/detail.do", method=RequestMethod.GET)
	public ModelAndView detail(@RequestParam("articleNO") int articleNO, 
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		Map planMap = pathService.pathDetail(articleNO);
		mav.addObject("planMap", planMap);
		mav.addObject("articleNO", articleNO);
		return mav;
	}
	
	@RequestMapping(value="/removeArticle.do" ,method = RequestMethod.POST)
	  @ResponseBody
	  public ResponseEntity  removeArticle(@RequestParam("articleNO") int articleNO,
	                              HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html; charset=UTF-8");
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			pathService.removeArticle(articleNO);
			
			
			message = "<script>";
			//message += " alert('저장된 동선을 삭제했습니다.');";
			message += " location.href='"+request.getContextPath()+"/path/path.do';";
			message +=" </script>";
		    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		       
		}catch(Exception e) {
			message = "<script>";
			message += " alert('작업중 오류가 발생했습니다.다시 시도해 주세요.');";
			message += " location.href='"+request.getContextPath()+"/path/path.do';";
			message +=" </script>";
		    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		    e.printStackTrace();
		}
		return resEnt;
	  }  
	@RequestMapping(value="/removeMap.do", method=RequestMethod.POST)
	public ResponseEntity removeMap(@RequestParam("regNO") int regNO, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			pathService.removeMap(regNO); 
			message  = "<script>";
			message +=" alert('삭제했습니다.');";
			//message += " location.href='"+request.getContextPath()+"/path/plan.do';";
			message += " </script>";
			
			}catch(Exception e) {
			message  = "<script>";
			message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
			message += " </script>";
			e.printStackTrace();
			}
		
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	 
}
