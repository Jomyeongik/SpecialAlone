package com.alone.special.hobby.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alone.special.hobby.domain.Board;
import com.alone.special.hobby.service.BoardService;
import com.alone.special.hobby.store.BoardStore;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private SqlSession session;
	@Autowired
	private BoardStore bStore;

	@Override
	public int insertBoard(Board board) {
		int result = bStore.insertBoard(session, board);
		return result;
	}

	@Override
	public Board selectBoardByNo(Integer hBoardNo) {
		Board boardOne = bStore.selectBoardByNo(session, hBoardNo);
		return boardOne;
	}

	@Override
	public int updateBoard(Board board) {
		int result = bStore.updateBoard(session, board);
		return result;
	}

	@Override
	public int deleteBoard(Board board) {
		int result = bStore.deleteBoard(session, board);
		return result;
	}

	@Override
	public List<Board> selectBoardList(Map<String, Object> getListMap) {
		List<Board> bList = bStore.selectBoardList(session, getListMap);
		return bList;
	}

	@Override
	public Integer getListCount(String refCategoryName) {
		int result = bStore.getListCount(session, refCategoryName);
		return result;
	}

}
