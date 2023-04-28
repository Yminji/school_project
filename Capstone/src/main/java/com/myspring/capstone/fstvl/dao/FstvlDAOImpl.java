package com.myspring.capstone.fstvl.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.capstone.board.vo.ArticleVO;
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
	public List<String> selectKeywordSearch(String keyword) throws DataAccessException{
		List<String> list = (ArrayList)sqlSession.selectList("mapper.fstvl.selectKeywordSearchs", keyword);
		return list;
	}

	@Override
	public List<String> selectFstvlBySearchWord(String searchWord) throws DataAccessException {
		ArrayList list = (ArrayList)sqlSession.selectList("mapper.fstvl.selectFstvlBySearchWord", searchWord);
		return list;
	}
	
	@Override
	public List<FstvlVO> selectFstvlList(FstvlVO fstvlVO) throws DataAccessException{
		List<FstvlVO> fstslList = sqlSession.selectList("mapper.fstvl.selectFstvlList", fstvlVO);
		return fstslList;
 	}
	
	@Override
	public List selectAllArticlesList(Map<String, Integer> pagingMap) throws DataAccessException {
		int section = (Integer) pagingMap.get("section");
		int pageNum = (Integer) pagingMap.get("pageNum");
		List<ArticleVO> articlesList = sqlSession.selectList("mapper.fstvl.selectAllArticlesList", pagingMap);
		return articlesList;
	}
	
	public int selectToArticles() throws DataAccessException{
		int articleNO = sqlSession.selectOne("mapper.fstvl.selectToArticles");
		return articleNO;
	}
}
