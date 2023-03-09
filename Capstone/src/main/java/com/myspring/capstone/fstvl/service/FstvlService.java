package com.myspring.capstone.fstvl.service;

import java.util.List;
import java.util.Map;

import com.myspring.capstone.fstvl.vo.FstvlVO;

public interface FstvlService {
	public Map fstvlDetail(int fstvl_id) throws Exception;
	
	public List<FstvlVO> searchFstvls(String searchWord) throws Exception;
	
	public List<String> keywordSearch(String keyword) throws Exception;
	
	public List<FstvlVO> fstvlList(FstvlVO fstvlVO) throws Exception;
}
