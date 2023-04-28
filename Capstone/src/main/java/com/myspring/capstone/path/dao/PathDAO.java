package com.myspring.capstone.path.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.capstone.path.vo.MapVO;
import com.myspring.capstone.path.vo.PathVO;

public interface PathDAO {
	
	public List selectAllArticlesList(PathVO pathVO) throws DataAccessException;
	
	public int insertNewArticle(Map articleMap) throws DataAccessException;
	
	public void insertNewMap(Map articleMap) throws DataAccessException;
	
	public PathVO selectArticle(int articleNO) throws DataAccessException;
	
	public MapVO selectMap(int articleNO) throws DataAccessException;
	
	public void insertPath(MapVO mapVO) throws DataAccessException;

	public void deleteArticle(int articleNO) throws DataAccessException;
	
	public List<MapVO> selectMapList(MapVO mapVO) throws DataAccessException;
	
	public int selectArticleNO() throws DataAccessException;
	
	public void deleteMap(int regNO) throws DataAccessException;
	
	public PathVO selectPlanDetail(int articleNO) throws DataAccessException;
	
	public List<MapVO> selectMapDetail(int articleNO) throws DataAccessException;
	/*public List<PathVO> selectPathList(PathVO pathVO) throws DataAccessException;
	
	public List<MapVO> selectMapList(MapVO mapVO) throws DataAccessException;
	
	//public void insertPlace(PathVO pathVO) throws DataAccessException;
	
	public void insertPath(MapVO mapVO) throws DataAccessException;
	
	public List<PathVO> selectDetailList(PathVO pathVO) throws DataAccessException;
	
	public void deleteMap(int regNO) throws DataAccessException;
	
	public int insertNewArticle(Map articleMap) throws DataAccessException ;
	
	public int insertNumNO() throws DataAccessException;*/
}
