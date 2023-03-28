package com.myspring.capstone.path.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.capstone.bookmark.vo.BookMarkVO;
import com.myspring.capstone.path.vo.MapVO;
import com.myspring.capstone.path.vo.PathVO;

@Repository("pathDAO")
public class PathDAOImpl implements PathDAO{
	@Autowired
	private SqlSession sqlSession;
	
	public List<PathVO> selectPathList(PathVO pathVO) throws DataAccessException{
		List<PathVO> pathList = (List)sqlSession.selectList("mapper.path.selectPathList", pathVO);
		return pathList;
	}
	
	/*public void insertPlace(PathVO pathVO) throws DataAccessException{
		sqlSession.insert("mapper.path.insertPlace", pathVO);
	}*/
	
	public void insertPath(MapVO mapVO) throws DataAccessException{
		int regNO = selectMaxPlaceId();
		mapVO.setRegNO(regNO);
		sqlSession.insert("mapper.path.insertPath", mapVO);
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
	}
}
