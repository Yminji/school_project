package com.myspring.capstone.path.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.capstone.path.vo.PathVO;

public interface PathDAO {
	public List<PathVO> selectPathList(PathVO pathVO) throws DataAccessException;
	
	public void insertPlace(PathVO pathVO) throws DataAccessException;
	
	public List<PathVO> selectDetailList(PathVO pathVO) throws DataAccessException;
}
