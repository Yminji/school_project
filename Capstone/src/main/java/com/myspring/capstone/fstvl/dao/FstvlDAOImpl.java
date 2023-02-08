package com.myspring.capstone.fstvl.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.capstone.fstvl.vo.FstvlVO;
import com.myspring.capstone.fstvl.vo.ImageFileVO;

@Repository("fstvlDAO")
public class FstvlDAOImpl implements FstvlDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public FstvlVO selectFstvlDetail(int fstvl_id) throws DataAccessException{
		FstvlVO fstvlVO = sqlSession.selectOne("mapper.fstvl.selectFstvlDetail", fstvl_id);
		return fstvlVO;
	}
	
	@Override
	public List<ImageFileVO> selectFstvlDetailImage(int fstvl_id) throws DataAccessException{
		List<ImageFileVO> imageList = (ArrayList) sqlSession.selectList("mapper.fstvl.selectFstvlDetailImage", fstvl_id);
		return imageList;
	}
}
