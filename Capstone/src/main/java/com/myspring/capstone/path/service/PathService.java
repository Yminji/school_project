package com.myspring.capstone.path.service;

import java.util.List;
import java.util.Map;

import com.myspring.capstone.path.vo.PathVO;

public interface PathService {
	public Map<String, List> pathList(PathVO pathVO) throws Exception;
	
	public void addPlace(PathVO pathVO) throws Exception;
	
	public Map<String, List> detailList(PathVO pathVO) throws Exception;
}
