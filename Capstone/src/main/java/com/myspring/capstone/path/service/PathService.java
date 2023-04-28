package com.myspring.capstone.path.service;

import java.util.List;
import java.util.Map;

import com.myspring.capstone.path.vo.MapVO;
import com.myspring.capstone.path.vo.PathVO;

public interface PathService {
	
	public List<PathVO> listArticles(PathVO pathVO) throws Exception;
	
	public int addNewArticle(Map articleMap) throws Exception;
	
	public void addNewMap(Map articleMap) throws Exception;
	
	public Map viewArticle(int articleNO) throws Exception;
	
	public void addPlan(MapVO mapVO) throws Exception;
	
	public void removeArticle(int articleNO) throws Exception;
	
	public Map<String, List> mapList(MapVO mapVO) throws Exception;
	
	public int addArticleNO() throws Exception;
	
	public void removeMap(int regNO) throws Exception;
	
	public Map<String, List> pathDetail(int articleNO) throws Exception;
	
	public void modPath(Map pathMap) throws Exception;
	/*public Map<String, List> pathList(PathVO pathVO) throws Exception;
	//public void addPlace(PathVO pathVO) throws Exception;
	
	public Map<String, List> mapList(MapVO mapVO) throws Exception;
	
	public void addPlan(MapVO mapVO) throws Exception;
	
	public Map<String, List> detailList(PathVO pathVO) throws Exception;
	
	public void removeMap(int regNO) throws Exception;
	
	public int addNewArticle(Map articleMap) throws Exception;
	
	public int addNumNO() throws Exception;*/
}
