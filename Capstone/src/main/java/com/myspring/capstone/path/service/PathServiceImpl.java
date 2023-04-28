package com.myspring.capstone.path.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.capstone.path.dao.PathDAO;
import com.myspring.capstone.path.vo.MapVO;
import com.myspring.capstone.path.vo.PathVO;

@Service("pathService")
@Transactional(propagation = Propagation.REQUIRED)
public class PathServiceImpl implements PathService{
	@Autowired
	private PathDAO pathDAO;
	
	public List<PathVO> listArticles(PathVO pathVO) throws Exception{
		List<PathVO> articlesList =  pathDAO.selectAllArticlesList(pathVO);
        return articlesList;
	}

	public int addNewArticle(Map articleMap) throws Exception{
		return pathDAO.insertNewArticle(articleMap);
	}
	
	public void addNewMap(Map articleMap) throws Exception{
		pathDAO.insertNewMap(articleMap);
	}
	
	public Map viewArticle(int articleNO) throws Exception{
		Map articleMap = new HashMap();
		PathVO pathVO = pathDAO.selectArticle(articleNO);
		MapVO mapVO = pathDAO.selectMap(articleNO);
		articleMap.put("pathVO", pathVO);
		articleMap.put("mapVO", mapVO);
		return articleMap;
	}
	public void addPlan(MapVO mapVO) throws Exception{
		pathDAO.insertPath(mapVO);
	}
	
	public void  removeArticle(int articleNO) throws Exception{
		pathDAO.deleteArticle(articleNO);
	}
	
	public Map<String, List> mapList(MapVO mapVO) throws Exception{
		Map<String, List> mapMap = new HashMap<String, List>();
		List<MapVO> mapList = pathDAO.selectMapList(mapVO); 
		
		if(mapList.size() == 0)
			return null;

		mapMap.put("mapList", mapList);
		return mapMap;
	}

	public int addArticleNO() throws Exception{
		return pathDAO.selectArticleNO();
	}
	
	public void removeMap(int regNO) throws Exception{
		pathDAO.deleteMap(regNO);
	}
	
	@Override
	public Map<String, List> pathDetail(int articleNO) throws Exception{
		Map planMap = new HashMap();
		PathVO pathVO = pathDAO.selectPlanDetail(articleNO);
		List<MapVO> mapVO = pathDAO.selectMapDetail(articleNO);
		planMap.put("mapVO", mapVO);
		planMap.put("pathVO", pathVO);
		return planMap;
	}
	
	public void modPath(Map pathMap) throws Exception{
		
	}
	
}
