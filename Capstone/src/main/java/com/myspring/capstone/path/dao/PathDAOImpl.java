package com.myspring.capstone.path.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.capstone.path.vo.MapVO;
import com.myspring.capstone.path.vo.PathVO;

@Repository("pathDAO")
public class PathDAOImpl implements PathDAO{
	@Autowired
	private SqlSession sqlSession;
	
	public List selectAllArticlesList(PathVO pathVO) throws DataAccessException{
		List<PathVO> articlesList = sqlSession.selectList("mapper.path.selectAllArticles", pathVO);
		return articlesList;
	}
	
	public int insertNewArticle(Map articleMap) throws DataAccessException{
		int articleNO = selectNewArticleNO();
		articleMap.put("articleNO", articleNO);
		sqlSession.insert("mapper.path.insertNewArticle", articleMap);
		return articleNO;
	}
	
	private int selectNewArticleNO() throws DataAccessException{
		return sqlSession.selectOne("mapper.path.selectNewArticleNO");
	}
	
	public void insertNewMap(Map articleMap) throws DataAccessException{
		int regNO = selectNewRegNO();
		articleMap.put("regNO", regNO);
		sqlSession.insert("mapper.path.insertNewMap", articleMap);
	}
	
	private int selectNewRegNO() throws DataAccessException{
		return sqlSession.selectOne("mapper.path.insertNewMap");
	}
	
	public PathVO selectArticle(int articleNO) throws DataAccessException{
		return sqlSession.selectOne("mapper.path.selectArticle", articleNO);
	}
	
	public MapVO selectMap(int articleNO) throws DataAccessException{
		return sqlSession.selectOne("mapper.path.selectMap", articleNO);
	}
	
	public void insertPath(MapVO mapVO) throws DataAccessException{
		int regNO = selectMaxPlaceId();
		//int articleNO = selectNOone();
		
		//mapVO.setArticleNO(articleNO);
		mapVO.setRegNO(regNO);
		sqlSession.insert("mapper.path.insertPath", mapVO);
	}
	
	public int selectNOone() throws DataAccessException{
		int articleNO = sqlSession.selectOne("mapper.path.selectNOone");
		return articleNO;
	}
	
	public int selectMaxPlaceId() throws DataAccessException{
		int regNO = sqlSession.selectOne("mapper.path.selectMaxPlaceId");
		return regNO;
	}

	public void deleteArticle(int articleNO) throws DataAccessException{
		sqlSession.delete("mapper.path.deleteArticle", articleNO);
	}
	
	public List<MapVO> selectMapList(MapVO mapVO) throws DataAccessException{
		List<MapVO> selectMapList = (List)sqlSession.selectList("mapper.path.selectMapList", mapVO);
		return selectMapList;
	}
	
	public int selectArticleNO() throws DataAccessException{
		return sqlSession.selectOne("mapper.path.selectArticleNO");
	}
	
	public void deleteMap(int regNO) throws DataAccessException{
		sqlSession.delete("mapper.path.deleteMap", regNO);
	}
	
	public PathVO selectPlanDetail(int articleNO) throws DataAccessException{
		PathVO pathVO = sqlSession.selectOne("mapper.path.selectPlanDetail", articleNO);
		return pathVO;
	}
	
	public List<MapVO> selectMapDetail(int articleNO) throws DataAccessException{
		List<MapVO> mapVO = (List) sqlSession.selectList("mapper.path.selectMapDetail", articleNO);
		return mapVO;
	}
	/*
	public List<PathVO> selectPathList(PathVO pathVO) throws DataAccessException{
		List<PathVO> pathList = (List)sqlSession.selectList("mapper.path.selectPathList", pathVO);
		return pathList;
	}
	
	
	public void insertPath(MapVO mapVO) throws DataAccessException{
		int regNO = selectMaxPlaceId();
		mapVO.setRegNO(regNO);
		sqlSession.insert("mapper.path.insertPath", mapVO);
	}
	
	@Override
	public int insertNewArticle(Map articleMap) throws DataAccessException {
		int numNO = selectNewArticleNO();
		articleMap.put("numNO", numNO);
		sqlSession.insert("mapper.path.insertNewArticle",articleMap);
		return numNO;
	}
	
	private int selectNewArticleNO() throws DataAccessException {
		return sqlSession.selectOne("mapper.path.selectNewArticleNO");
	}
	
	public int insertNumNO() throws DataAccessException{
		return sqlSession.selectOne("mapper.path.insertNumNO ");
	}
	
	public int selectMaxPlaceId() throws DataAccessException{
		int regNO = sqlSession.selectOne("mapper.path.selectMaxPlaceId");
		return regNO;
	}
	
	public List<MapVO> selectMapList(MapVO mapVO) throws DataAccessException{
		List<MapVO> selectMapList = (List)sqlSession.selectList("mapper.path.selectMapList", mapVO);
		return selectMapList;
	}
	
	public List<PathVO> selectDetailList(PathVO pathVO) throws DataAccessException{
		List<PathVO> pathList = (List)sqlSession.selectList("mapper.path.selectDetailList", pathVO);
		return pathList;
	}
	
	public void deleteMap(int regNO) throws DataAccessException{
		sqlSession.delete("mapper.path.deleteMap", regNO);
	}*/
}
