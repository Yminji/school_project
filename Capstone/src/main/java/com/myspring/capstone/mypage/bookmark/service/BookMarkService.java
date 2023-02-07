package com.myspring.capstone.mypage.bookmark.service;

import java.util.List;
import java.util.Map;

import com.myspring.capstone.mypage.bookmark.vo.BookMarkVO;

public interface BookMarkService {
	public Map<String, List> bookMarkList(BookMarkVO bookMarkVO) throws Exception;
	
	public boolean findBookMarkFstvl(BookMarkVO bookMarkVO) throws Exception;
	
	public void addFstvlInBookMark(BookMarkVO bookMarkVO) throws Exception;
	
	public void removeBookMarkFstvl(int regNO) throws Exception;
}
