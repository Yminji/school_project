 package com.myspring.capstone.board.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.capstone.board.service.BoardService;
import com.myspring.capstone.board.vo.ArticleVO;
import com.myspring.capstone.common.base.BaseController;
import com.myspring.capstone.member.vo.MemberVO;

@Controller("boardController")
@RequestMapping(value="/board")
public class BoardControllerImpl extends BaseController{
	private static final String ARTICLE_IMAGE_REPO = "C:\\board\\article_image";
	@Autowired
	private BoardService boardService;
	@Autowired
	private ArticleVO articleVO;

	@RequestMapping(value= "/listArticles.do", method = RequestMethod.GET)
	public ModelAndView listArticles(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		String _section = request.getParameter("section");
		String _pageNum = request.getParameter("pageNum");
		int section = Integer.parseInt((_section == null) ? "1" : _section);
		int pageNum = Integer.parseInt((_pageNum == null) ? "1" : _pageNum);
		Map<String, Integer> pagingMap = new HashMap<String, Integer>();
		pagingMap.put("section", section);
		pagingMap.put("pageNum", pageNum);
		Map articlesMap = boardService.listArticles(pagingMap);
		articlesMap.put("section", section);
		articlesMap.put("pageNum", pageNum);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("articlesMap", articlesMap);
		return mav;
	}
	
	 //한 개 이미지 글쓰기
	@RequestMapping(value="/addNewArticle.do" ,method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewArticle(MultipartHttpServletRequest multipartRequest, 
	HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String,Object> articleMap = new HashMap<String, Object>();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			articleMap.put(name,value);
		}
		
		String imageFileName= upload(multipartRequest);
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		String member_id = memberVO.getMember_id();
		articleMap.put("parentNO", 0);
		articleMap.put("member_id", member_id);
		articleMap.put("imageFileName", imageFileName);
		
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int articleNO = boardService.addNewArticle(articleMap);
			if(imageFileName!=null && imageFileName.length()!=0) {
				File srcFile = new 
				File(ARTICLE_IMAGE_REPO+ "\\" + "temp"+ "\\" + imageFileName);
				File destDir = new File(ARTICLE_IMAGE_REPO+"\\"+articleNO);
				FileUtils.moveFileToDirectory(srcFile, destDir,true);
			}
	
			message = "<script>";
			message += " alert('새글을 추가했습니다.');";
			message += " location.href='"+multipartRequest.getContextPath()+"/board/listArticles.do'; ";
			message +=" </script>";
		    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
			srcFile.delete();
			
			message = " <script>";
			message +=" alert('오류가 발생했습니다. 다시 시도해 주세요');');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/board/articleForm.do'; ";
			message +=" </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	
	//한개의 이미지 보여주기
	@RequestMapping(value="/viewArticle.do" ,method = RequestMethod.GET)
	public ModelAndView viewArticle(@RequestParam("articleNO") int articleNO,
                                    HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		articleVO=boardService.viewArticle(articleNO);
		//HttpSession session = request.getSession();
		//MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		//String member_id = memberVO.getMember_id();
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("article", articleVO);
		return mav;
	}

	
  //한 개 이미지 수정 기능
  @RequestMapping(value="/modArticle.do" ,method = RequestMethod.POST)
  @ResponseBody
  public ResponseEntity modArticle(MultipartHttpServletRequest multipartRequest,  
    HttpServletResponse response) throws Exception{
    multipartRequest.setCharacterEncoding("utf-8");
	Map<String,Object> articleMap = new HashMap<String, Object>();
	Enumeration enu=multipartRequest.getParameterNames();
	while(enu.hasMoreElements()){
		String name=(String)enu.nextElement();
		String value=multipartRequest.getParameter(name);
		articleMap.put(name,value);
	}
	
	String imageFileName= upload(multipartRequest);
	articleMap.put("imageFileName", imageFileName);
	
	String articleNO=(String)articleMap.get("articleNO");
	String message;
	ResponseEntity resEnt=null;
	HttpHeaders responseHeaders = new HttpHeaders();
	responseHeaders.add("Content-Type", "text/html; charset=utf-8");
    try {
       boardService.modArticle(articleMap);
       if(imageFileName!=null && imageFileName.length()!=0) {
         File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
         File destDir = new File(ARTICLE_IMAGE_REPO+"\\"+articleNO);
         FileUtils.moveFileToDirectory(srcFile, destDir, true);
         
         String originalFileName = (String)articleMap.get("originalFileName");
         File oldFile = new File(ARTICLE_IMAGE_REPO+"\\"+articleNO+"\\"+originalFileName);
         oldFile.delete();
       }	
       message = "<script>";
	   message += " alert('글을 수정했습니다.');";
	   message += " location.href='"+multipartRequest.getContextPath()+"/board/viewArticle.do?articleNO="+articleNO+"';";
	   message +=" </script>";
       resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
    }catch(Exception e) {
      File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
      srcFile.delete();
      message = "<script>";
	  message += " alert('오류가 발생했습니다.다시 수정해주세요');";
	  message += " location.href='"+multipartRequest.getContextPath()+"/board/viewArticle.do?articleNO="+articleNO+"';";
	  message +=" </script>";
      resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
      e.printStackTrace();
    }
    return resEnt;
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
		boardService.removeArticle(articleNO);
		File destDir = new File(ARTICLE_IMAGE_REPO+"\\"+articleNO);
		FileUtils.deleteDirectory(destDir);
		
		message = "<script>";
		message += " alert('글을 삭제했습니다.');";
		message += " location.href='"+request.getContextPath()+"/board/listArticles.do';";
		message +=" </script>";
	    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	       
	}catch(Exception e) {
		message = "<script>";
		message += " alert('작업중 오류가 발생했습니다.다시 시도해 주세요.');";
		message += " location.href='"+request.getContextPath()+"/board/listArticles.do';";
		message +=" </script>";
	    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	    e.printStackTrace();
	}
	return resEnt;
  }  
	

	@RequestMapping(value = "/*Form.do", method =  RequestMethod.POST)
	private ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//int parentNO = boardService.addParentNO();
		int parentNO = Integer.parseInt(request.getParameter("parentNO"));
		HttpSession session = request.getSession();
		session = request.getSession();
		session.setAttribute("parentNO", parentNO);
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		System.out.println("답글쓰기"+parentNO);
		return mav;
	}
	
	/*@RequestMapping(value="/addReply.do", method=RequestMethod.POST)
	public ResponseEntity addReply(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception{
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String,Object> articleMap = new HashMap<String, Object>();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			articleMap.put(name,value);
		}
		
		String imageFileName= upload(multipartRequest);
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		String member_id = memberVO.getMember_id();
		int parentNO = (Integer) session.getAttribute("parentNO");
		session.removeAttribute("parentNO");
		articleMap.put("parentNO", parentNO);
		articleMap.put("member_id", member_id);
		articleMap.put("imageFileName", imageFileName);
		
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int articleNO = boardService.addReply(articleMap);
			if(imageFileName!=null && imageFileName.length()!=0) {
				File srcFile = new 
				File(ARTICLE_IMAGE_REPO+ "\\" + "temp"+ "\\" + imageFileName);
				File destDir = new File(ARTICLE_IMAGE_REPO+"\\"+articleNO);
				FileUtils.moveFileToDirectory(srcFile, destDir,true);
			}
	
			message = "<script>";
			message += " alert('답글을 추가했습니다.');";
			message += " location.href='"+multipartRequest.getContextPath()+"/board/viewArticle.do?articleNO="+articleNO+"'; ";
			message +=" </script>";
		    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
			srcFile.delete();
			
			message = " <script>";
			message +=" alert('오류가 발생했습니다. 다시 시도해 주세요');');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/board/articleForm.do'; ";
			message +=" </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
		   
	}*/
	

	//한개 이미지 업로드하기
	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception{
		String imageFileName= null;
		Iterator<String> fileNames = multipartRequest.getFileNames();
		
		while(fileNames.hasNext()){
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			imageFileName=mFile.getOriginalFilename();
			File file = new File(ARTICLE_IMAGE_REPO +"\\"+"temp"+"\\" + fileName);
			if(mFile.getSize()!=0){ //File Null Check
				if(!file.exists()){ //경로상에 파일이 존재하지 않을 경우
					file.getParentFile().mkdirs();  //경로에 해당하는 디렉토리들을 생성
					mFile.transferTo(new File(ARTICLE_IMAGE_REPO +"\\"+"temp"+ "\\"+imageFileName)); //임시로 저장된 multipartFile을 실제 파일로 전송
				}
			}
			
		}
		return imageFileName;
	}
}
	
