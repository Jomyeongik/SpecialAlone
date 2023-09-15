package com.alone.special.hobby.service;

import java.util.List;
import java.util.Map;

import com.alone.special.hobby.domain.Board;

public interface BoardService {

	int insertBoard(Board board);

	Board selectBoardByNo(Integer hBoardNo);

	int updateBoard(Board board);

	int deleteBoard(Board board);

	List<Board> selectBoardList(Map<String, Object> getListMap);

	Integer getListCount(String refCategoryName);

}
