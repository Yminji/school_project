package com.myspring.capstone.path.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.capstone.path.dao.PathDAO;
import com.myspring.capstone.path.vo.PathVO;

@Service("pathService")
@Transactional(propagation = Propagation.REQUIRED)
public class PathServiceImpl implements PathService{
	@Autowired
	private PathDAO pathDAO;
	
	@Override
	public Map<String, List> pathList(PathVO pathVO) throws Exception{
		Map<String, List> pathMap = new HashMap<String, List>();
		List<PathVO> pathList = pathDAO.selectPathList(pathVO);
		
		if(pathList.size() == 0)
			return null;
		
		pathMap.put("pathList", pathList);
		return pathMap;
	}
	
	@Override
	public void addPlace(PathVO pathVO) throws Exception{
		pathDAO.insertPlace(pathVO);
	}
	
	@Override
	public Map<String, List> detailList(PathVO pathVO) throws Exception{
		Map<String, List> detailMap = new HashMap<String, List>();
		List<PathVO> detailList = pathDAO.selectDetailList(pathVO);
		detailMap.put("detailList", detailList);
		return detailMap;
	}
}
