package com.myspring.capstone.common.base;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.capstone.festival.vo.ImageFileVO;

public class BaseController {
	private static final String CURR_IMAGE_REPO_PATH = "C:\\festival\\file_repo";
	
	protected List<ImageFileVO> upload(MultipartHttpServletRequest multipartRequest) throws Exception{
		List<ImageFileVO> fileList = new ArrayList<ImageFileVO>();
		Iterator<String> fileNames = multipartRequest.getFileNames(); //첨부된 파일 이름을 가져옴
		while(fileNames.hasNext()) { 
			ImageFileVO imageFileVO = new ImageFileVO();
			String fileName = fileNames.next(); //파일 이름을 읽음
			imageFileVO.setFileType(fileName); //읽은 파일 이름을 imageFileVO에서 파일 종류에 저장
			MultipartFile mFile = multipartRequest.getFile(fileName);  //파일 이름에 대한 multipartFile 객체를 가져옴
			String originalFileName = mFile.getOriginalFilename(); //실제 파일이름을 가져옴
			imageFileVO.setFileName(originalFileName); //실제 파일 이름을 저장
			fileList.add(imageFileVO); //읽은 파일과 실제 파일이 저장된 imageFileVO을 파일 리스트에 저장
			
			File file = new File(CURR_IMAGE_REPO_PATH+"\\"+fileName);
			if(mFile.getSize() != 0) { //첨부된 파일 존재한다면
				if(! file.exists()) { //경로상에 파일이 없으면
					if(file.getParentFile().mkdirs()) {//경로에 해당하는 디텍토리 생성
						file.createNewFile(); //파일 생성
					}
				}
				//임시로 저장된 mulipartFile을 실제 파일로 전송
				mFile.transferTo(new File(CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+originalFileName)); 
			}
		}
		return fileList;
	}
	
	private void deleteFile(String fileName) {
		File file = new File(CURR_IMAGE_REPO_PATH+"\\"+fileName);
		try {
			file.delete();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/*.do", method= {RequestMethod.POST, RequestMethod.GET})
	protected ModelAndView viewForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
}
