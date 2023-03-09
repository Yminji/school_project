package com.myspring.capstone.fstvl.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.capstone.fstvl.vo.FstvlVO;
import com.myspring.capstone.fstvl.vo.ImageFileVO;

public interface FstvlDAO {
	public FstvlVO selectFstvlDetail(int fstvl_id) throws DataAccessException;
	
	public List<String> selectKeywordSearch(String keyword) throws DataAccessException;
	
	public List<String> selectFstvlBySearchWord(String searchWord) throws DataAccessException;

	List<FstvlVO> selectFstvlList(FstvlVO fstvlVO) throws DataAccessException;
}
