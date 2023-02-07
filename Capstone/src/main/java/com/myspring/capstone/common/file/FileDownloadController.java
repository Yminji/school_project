package com.myspring.capstone.common.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class FileDownloadController {
	private static final String CURR_IMAGE_REPO_PATH = "C:\\festival\\file_repo";
	
	@RequestMapping("/download")
	protected void download(@RequestParam("fileName") String fileName, @RequestParam("fstvl_id") String fstvl_id,
			HttpServletResponse response ) throws Exception{
		OutputStream out = response.getOutputStream();
		String filePath = CURR_IMAGE_REPO_PATH+"\\"+fstvl_id+"\\"+fileName;
		File image = new File(filePath);
		
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Content-diposition", "attachment; fileName="+fileName);
		FileInputStream in = new FileInputStream(image);
		byte[] buffer = new byte[1024 * 8]; //8KByte
		while(true) {
			int count = in.read(buffer); //버퍼에 읽어들인 문자 수
			if(count== -1) { //버퍼의 마지막에 도달했으면
				break;
			}
			out.write(buffer, 0, count); //버퍼를 읽어 한번에 8kbtye씩 보냄
		}
		in.close();
		out.close();
	}
	
	@RequestMapping("/thumbnails.do")
	protected void thumbnails(@RequestParam("fileName") String fileName, @RequestParam("fstvl_id") String fstvl_id,
			HttpServletResponse response ) throws Exception{
		OutputStream out = response.getOutputStream();
		String filePath = CURR_IMAGE_REPO_PATH+"\\"+fstvl_id+"\\"+fileName;
		File image = new File(filePath);
		
		if(image.exists()) {//파일이 존재한다면
			//원본 이미지에 대한 썸네일 이미지를 생성한 후 outputStream 객체에 할당
			Thumbnails.of(image).size(121, 154).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}
	
	
}
