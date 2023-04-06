package com.myspring.capstone.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.capstone.board.vo.ArticleVO;

public interface BoardDAO {
	public List selectAllArticlesList(Map<String, Integer> pagingMap) throws DataAccessException;
	public int insertNewArticle(Map articleMap) throws DataAccessException;
	//public void insertNewImage(Map articleMap) throws DataAccessException;
	public int insertNewParent(Map articleMap) throws DataAccessException;
	public ArticleVO selectArticle(int articleNO) throws DataAccessException;
	public void updateArticle(Map articleMap) throws DataAccessException;
	public void deleteArticle(int articleNO) throws DataAccessException;
	public List selectImageFileList(int articleNO) throws DataAccessException;
	public int selectNewParentNO() throws DataAccessException;
	public int selectToArticles() throws DataAccessException;
}
