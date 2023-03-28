package com.myspring.capstone.path.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.capstone.bookmark.vo.BookMarkVO;
import com.myspring.capstone.fstvl.vo.FstvlVO;
import com.myspring.capstone.path.dao.PathDAO;
import com.myspring.capstone.path.vo.MapVO;
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
	
	/*@Override
	public void addPlace(PathVO pathVO) throws Exception{
		pathDAO.insertPlace(pathVO);
	}*/
	
	public Map<String, List> mapList(MapVO mapVO) throws Exception{
		Map<String, List> mapMap = new HashMap<String, List>();
		List<MapVO> mapList = pathDAO.selectMapList(mapVO); //북마크 정보 조회
		
		if(mapList.size() == 0)
			return null;

		mapMap.put("mapList", mapList);
		return mapMap;
	}
	
	public void addPlan(MapVO mapVO) throws Exception{
		pathDAO.insertPath(mapVO);
	}
	
	@Override
	public Map<String, List> detailList(PathVO pathVO) throws Exception{
		Map<String, List> detailMap = new HashMap<String, List>();
		List<PathVO> detailList = pathDAO.selectDetailList(pathVO);
		detailMap.put("detailList", detailList);
		return detailMap;
	}
	
	public void removeMap(int regNO) throws Exception{
		pathDAO.deleteMap(regNO);
	}
}
