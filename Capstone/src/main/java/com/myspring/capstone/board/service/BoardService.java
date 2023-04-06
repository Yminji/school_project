package com.myspring.capstone.board.service;

import java.util.List;
import java.util.Map;

import com.myspring.capstone.board.vo.ArticleVO;

public interface BoardService {
	public Map<String, Integer> listArticles(Map pagingMap) throws Exception;
	public int addNewArticle(Map articleMap) throws Exception;
	public ArticleVO viewArticle(int articleNO) throws Exception;
	public void modArticle(Map articleMap) throws Exception;
	public void removeArticle(int articleNO) throws Exception;
	public int addReply(Map articleMap) throws Exception;
	public int addParentNO() throws Exception;
}
