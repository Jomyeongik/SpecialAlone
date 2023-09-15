package com.alone.special.hobby.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.alone.special.hobby.domain.Board;

public interface BoardStore {

	int insertBoard(SqlSession session, Board board);

	Board selectBoardByNo(SqlSession session, Integer hBoardNo);

	int updateBoard(SqlSession session, Board board);

	int deleteBoard(SqlSession session, Board board);

	List<Board> selectBoardList(SqlSession session, Map<String, Object> getListMap);

	int getListCount(SqlSession session, String refCategoryName);

}
