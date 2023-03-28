package com.myspring.capstone.path.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.capstone.path.vo.MapVO;
import com.myspring.capstone.path.vo.PathVO;

public interface PathDAO {
	public List<PathVO> selectPathList(PathVO pathVO) throws DataAccessException;
	
	public List<MapVO> selectMapList(MapVO mapVO) throws DataAccessException;
	
	//public void insertPlace(PathVO pathVO) throws DataAccessException;
	
	public void insertPath(MapVO mapVO) throws DataAccessException;
	
	public List<PathVO> selectDetailList(PathVO pathVO) throws DataAccessException;
	
	public void deleteMap(int regNO) throws DataAccessException;
}
