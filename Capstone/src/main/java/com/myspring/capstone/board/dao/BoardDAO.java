package com.myspring.capstone.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.capstone.board.vo.BoardVO;
import com.myspring.capstone.board.vo.ImageVO;

public interface BoardDAO {
	public List<BoardVO> selectAllArticlesList() throws DataAccessException;
	
	public int insertNewArticle(Map articleMap) throws DataAccessException;

	public BoardVO selectArticle(int articleNO) throws DataAccessException;
	
	public List<ImageVO> selectImageFileList(int articleNO) throws DataAccessException;
	
	public void updateArticle(Map articleMap) throws DataAccessException;
	
	public void deleteArticle(int articleNO) throws DataAccessException;
}
