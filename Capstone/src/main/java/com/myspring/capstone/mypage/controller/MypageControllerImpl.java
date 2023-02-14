package com.myspring.capstone.mypage.controller;

import java.util.HashMap;
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
import org.springframework.web.servlet.ModelAndView;

import com.myspring.capstone.common.base.BaseController;
import com.myspring.capstone.member.vo.MemberVO;

@Controller("mypageController")
@RequestMapping("/mypage")
public class MypageControllerImpl extends BaseController implements MypageController{

	
	@Autowired
	private MemberVO memberVO;
	
	
	@Override
	@RequestMapping(value="/mypageMain.do", method=RequestMethod.GET)
	public ModelAndView myPageMain(@ModelAttribute("_memberVO") MemberVO _memberVO, HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName"); 
		ModelAndView mav = new ModelAndView(viewName);
		Map<String,String> memberMap=new HashMap<String,String>();
		HttpSession session=request.getSession();
		_memberVO=(MemberVO)session.getAttribute("memberInfo");
		String  member_id=_memberVO.getMember_id();
		memberMap.put("member_id", member_id);
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		resEntity =new ResponseEntity(memberMap, responseHeaders, HttpStatus.OK);
		mav.addObject("memberMap", memberMap);
		System.out.println(resEntity );
		System.out.println(memberMap);
		return mav; 
	}
	/*public ModelAndView mypageMain(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName"); 
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession(); 
		MemberVO memberVO = (MemberVO)session.getAttribute("memberInfo"); //세션에서 회원정보를 가져옴
		String member_id =   memberVO.getMember_id(); //회원 아이디를 가져옴
		mypageVO.setMember_id(member_id); //회원 아이디를 저장
		Map<String, String> mypageMap = mypageService.selectMember(mypageVO); //마이페이지에 표시할 정보를 가져옴
		session.setAttribute("mypageMap", mypageMap); //북마크 목록을 세션에 저장
		return mav;
	}*/
	
	@Override
	@RequestMapping(value="/myDetailInfo.do", method=RequestMethod.POST)
	public ModelAndView myDetailInfo(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
}
