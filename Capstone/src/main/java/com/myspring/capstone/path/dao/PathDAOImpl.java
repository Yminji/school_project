package com.myspring.capstone.path.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.capstone.path.vo.PathVO;

@Repository("pathDAO")
public class PathDAOImpl implements PathDAO{
	@Autowired
	private SqlSession sqlSession;
	
	public List<PathVO> selectPathList(PathVO pathVO) throws DataAccessException{
		List<PathVO> pathList = (List)sqlSession.selectList("mapper.path.selectPathList", pathVO);
		return pathList;
	}
	
	public void insertPlace(PathVO pathVO) throws DataAccessException{
		int regNO = selectMaxPlaceId();
		pathVO.setRegNO(regNO);
		sqlSession.insert("mapper.path.insertPlace", pathVO);
	}
	
	public int selectMaxPlaceId() throws DataAccessException{
		int regNO = sqlSession.selectOne("mapper.path.selectMaxPlaceId");
		return regNO;
	}
	
	public List<PathVO> selectDetailList(PathVO pathVO) throws DataAccessException{
		List<PathVO> pathList = (List)sqlSession.selectList("mapper.path.selectDetailList", pathVO);
		return pathList;
	}
}
