package com.myspring.capstone.fstvl.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.capstone.bookmark.vo.BookMarkVO;
import com.myspring.capstone.common.base.BaseController;
import com.myspring.capstone.fstvl.service.FstvlService;
import com.myspring.capstone.fstvl.vo.FstvlVO;
import com.myspring.capstone.member.vo.MemberVO;

@Controller("fstvlController")
@RequestMapping(value="/fstvl")
public class FstvlControllerImpl extends BaseController implements FstvlController{
	@Autowired
	private FstvlService fstvlService;
	
	@Autowired
	protected FstvlVO fstvlVO;
	
	@RequestMapping(value="/fstvlList.do", method=RequestMethod.GET)
	public ModelAndView fstvlList(HttpServletRequest request, HttpServletResponse respons) throws Exception{
		request.setCharacterEncoding("utf-8");
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		List<FstvlVO> listFstvl = fstvlService.fstvlList(fstvlVO);
		mav.addObject("listFstvl", listFstvl);
		return mav;
	}
	
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
	
	@RequestMapping(value="/searchFstvl.do", method=RequestMethod.GET)
	public ModelAndView searchFstvls(@RequestParam("searchWord") String searchWord, HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		List<FstvlVO> fstvlsList = fstvlService.searchFstvls(searchWord);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("fstvlsList", fstvlsList);
		return mav;
	}
	
	@RequestMapping(value="/keywordSearch.do", method=RequestMethod.GET, produces="application/text; charset=utf-8")
	public @ResponseBody String keywordSearch(@RequestParam("keyword") String keyword, HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		if(keyword == null || keyword.equals(""))
			return null;
		keyword = keyword.toUpperCase();
		List<String> keywordList = fstvlService.keywordSearch(keyword);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("keyword", keywordList);
		
		String jsoinInfo = jsonObject.toString();
		return jsoinInfo;
	}
}
