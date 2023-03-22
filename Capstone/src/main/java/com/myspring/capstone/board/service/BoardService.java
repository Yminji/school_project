package com.myspring.capstone.board.service;

import java.util.List;
import java.util.Map;

import com.myspring.capstone.board.vo.BoardVO;

public interface BoardService {
	 public List<BoardVO> listBoard() throws Exception;
	 
	 public int addNewArticle(Map articleMap) throws Exception;
	 
	 public BoardVO viewBoard(int articleNO) throws Exception;
	 
	 public void modBoard(Map articleMap) throws Exception;
	 
	 public void removeBoard(int articleNO) throws Exception;
}
