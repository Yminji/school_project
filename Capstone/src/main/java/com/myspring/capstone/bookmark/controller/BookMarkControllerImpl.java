package com.myspring.capstone.bookmark.controller;

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

import com.myspring.capstone.bookmark.service.BookMarkService;
import com.myspring.capstone.bookmark.vo.BookMarkVO;
import com.myspring.capstone.common.base.BaseController;
import com.myspring.capstone.member.vo.MemberVO;

@Controller("bookMarkController")
@RequestMapping(value = "/bookmark")
public class BookMarkControllerImpl extends BaseController implements BookMarkController{
	
	@Autowired
	protected BookMarkService bookMarkService;
	
	@Autowired
	protected BookMarkVO bookMarkVO;
	
	@Autowired
	protected MemberVO memberVO;
	
	@RequestMapping(value="/bookMarkList.do", method=RequestMethod.GET)
	public ModelAndView bookMarkMain(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName"); 
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession(); 
		MemberVO memberVO = (MemberVO)session.getAttribute("memberInfo"); //세션에서 회원정보를 가져옴
		String member_id =   memberVO.getMember_id(); //회원 아이디를 가져옴
		bookMarkVO.setMember_id(member_id); //회원 아이디를 저장
		Map<String, List> bookMarkMap = bookMarkService.bookMarkList(bookMarkVO); //북마크 페이지에 표시할 정보를 가져옴
		session.setAttribute("bookMarkMap", bookMarkMap); //북마크 목록을 세션에 저장
		return mav;
	}
	
	@RequestMapping(value="/addFstvlInBookMark.do", method=RequestMethod.POST, produces="application/text; charset=utf-8")
	public @ResponseBody String addFstvlInBookMark(@RequestParam("fstvl_id") int fstvl_id, HttpServletRequest request, HttpServletResponse response)throws Exception{
		HttpSession session = request.getSession();
		memberVO = (MemberVO)session.getAttribute("memberInfo"); 
		String member_id = memberVO.getMember_id();
		
		bookMarkVO.setMember_id(member_id); //회원 아이디 저장
		bookMarkVO.setFstvl_id(fstvl_id); //전송받은 축제번호 저장
		
		boolean isAreadyExisted = bookMarkService.findBookMarkFstvl(bookMarkVO); //축제 번호가 장바구니에 있는지 확인
		System.out.println("isAreadyExisted:"+isAreadyExisted);
		if(isAreadyExisted == true) {
			return "already_existed";
		}else {
			bookMarkService.addFstvlInBookMark(bookMarkVO);
			return "add_success";
		}
	}
	
	@RequestMapping(value="/removeBookMarkFstvl.do", method=RequestMethod.POST)
	public ModelAndView removeBookMarkFstvl(@RequestParam("RegNO") int regNO, HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		bookMarkService.removeBookMarkFstvl(regNO);
		mav.setViewName("redirect:/bookMark/bookMarkList.do");
		return mav;
	}
}