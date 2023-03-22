 package com.myspring.capstone.board.controller;

import java.io.File;
import java.util.ArrayList;
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
import com.myspring.capstone.board.vo.BoardVO;
import com.myspring.capstone.board.vo.ImageVO;
import com.myspring.capstone.member.vo.MemberVO;

@Controller("boardController")
@RequestMapping(value="/board")
public class BoardControllerImpl implements BoardController{
	private static final String BOARD_IMAGE_REPO = "C:\\board\\board_image";
	@Autowired
	private BoardService boardService;
	@Autowired
	private BoardVO boardVO;
	
	@RequestMapping(value="/listBoard.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listBoard(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		List boardList = boardService.listBoard();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("boardList", boardList);
		return mav;
	}
	
	//상세
	@RequestMapping(value="/viewBoard.do", method=RequestMethod.GET)
	public ModelAndView viewBoard (@RequestParam("articleNO") int articleNO,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		boardVO=boardService.viewBoard(articleNO);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("article", boardVO);
		return mav;
	} 
	
	/*수정
	@RequestMapping(value="/editBoard.do", method={RequestMethod.GET, RequestMethod.POST})
	public ResponseEntity editBoard(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception{
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
		       boardService.modBoard(articleMap);
		       if(imageFileName!=null && imageFileName.length()!=0) {
		         File srcFile = new File(BOARD_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
		         File destDir = new File(BOARD_IMAGE_REPO+"\\"+articleNO);
		         FileUtils.moveFileToDirectory(srcFile, destDir, true);
		         
		         String originalFileName = (String)articleMap.get("originalFileName");
		         File oldFile = new File(BOARD_IMAGE_REPO+"\\"+articleNO+"\\"+originalFileName);
		         oldFile.delete();
		       }	
		       message = "<script>";
			   message += " alert('글을 수정했습니다.');";
			   message += " location.href='"+multipartRequest.getContextPath()+"/board/viewArticle.do?articleNO="+articleNO+"';";
			   message +=" </script>";
		       resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		    }catch(Exception e) {
		      File srcFile = new File(BOARD_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
		      srcFile.delete();
		      message = "<script>";
			  message += " alert('오류가 발생했습니다.다시 수정해주세요');";
			  message += " location.href='"+multipartRequest.getContextPath()+"/board/viewArticle.do?articleNO="+articleNO+"';";
			  message +=" </script>";
		      resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		    }
		    return resEnt;
	}*/
	
	/*추가
	@RequestMapping(value="/addBoard.do", method= RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addBoard(MultipartHttpServletRequest multipartRequest, 
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
					File(BOARD_IMAGE_REPO+ "\\" + "temp"+ "\\" + imageFileName);
					File destDir = new File(BOARD_IMAGE_REPO+"\\"+articleNO);
					FileUtils.moveFileToDirectory(srcFile, destDir,true);
				}			
				message = "<script>";
				message += " alert('새글을 추가했습니다.');";
				message += " location.href='"+multipartRequest.getContextPath()+"/board/listBoard.do'; ";
				message +=" </script>";
			    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			}catch(Exception e) {
				File srcFile = new File(BOARD_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
				srcFile.delete();
				
				message = " <script>";
				message +=" alert('오류가 발생했습니다. 다시 시도해 주세요');');";
				message +=" location.href='"+multipartRequest.getContextPath()+"/board/addBoard.do'; ";
				message +=" </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				e.printStackTrace();
			}
			return resEnt;
	}*/
	@RequestMapping(value = "/addBoard.do", method =  RequestMethod.GET)
	public ModelAndView addBoard(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//인터셉터에 저장한 viewName을 가져옴
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value = "/editBoard.do", method =  RequestMethod.GET)
	public ModelAndView editBoard(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//인터셉터에 저장한 viewName을 가져옴
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value = "/board/*Form.do", method =  RequestMethod.GET)
	private ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//인터셉터에 저장한 viewName을 가져옴
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/removeBoard.do" ,method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity removeBoard(@RequestParam("articleNO") int articleNO, HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html; charset=UTF-8");
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			boardService.removeBoard(articleNO);
			File destDir = new File(BOARD_IMAGE_REPO+"\\"+articleNO);
			FileUtils.deleteDirectory(destDir);
			
			message = "<script>";
			message += " alert('글을 삭제했습니다.');";
			message += " location.href='"+request.getContextPath()+"/listBoard.do';";
			message +=" </script>";
		    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		       
		}catch(Exception e) {
			message = "<script>";
			message += " alert('작업중 오류가 발생했습니다.다시 시도해 주세요.');";
			message += " location.href='"+request.getContextPath()+"/listBoard.do';";
			message +=" </script>";
		    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		    e.printStackTrace();
		}
		return resEnt;
	}
		
		//한개 이미지 업로드하기
		private String upload(MultipartHttpServletRequest multipartRequest) throws Exception{
			String imageFileName= null;
			Iterator<String> fileNames = multipartRequest.getFileNames();
			
			while(fileNames.hasNext()){
				String fileName = fileNames.next();
				MultipartFile mFile = multipartRequest.getFile(fileName);
				imageFileName=mFile.getOriginalFilename();
				File file = new File(BOARD_IMAGE_REPO +"\\"+"temp"+"\\" + fileName);
				if(mFile.getSize()!=0){ //File Null Check
					if(!file.exists()){ //경로상에 파일이 존재하지 않을 경우
						file.getParentFile().mkdirs();  //경로에 해당하는 디렉토리들을 생성
						mFile.transferTo(new File(BOARD_IMAGE_REPO +"\\"+"temp"+ "\\"+imageFileName)); //임시로 저장된 multipartFile을 실제 파일로 전송
					}
				}
				
			}
			return imageFileName;
		}
	
	}
	
