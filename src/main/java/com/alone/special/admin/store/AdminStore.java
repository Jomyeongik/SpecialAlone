package com.alone.special.admin.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.alone.special.admin.domain.Singo;
import com.alone.special.noticeEvent.domain.PageInfo;

public interface AdminStore {

	/**
	 * 신고 회원 수 Store
	 * @param sqlSession
	 * @return
	 */
	int getSingoListCount(SqlSession sqlSession);

	/**
	 * 신고 회원 리스트 Store
	 * @param sqlSession
	 * @param pInfo
	 * @return
	 */
	List<Singo> selectSingoList(SqlSession sqlSession, PageInfo pInfo);

	/**
	 * 신고 취소 Store
	 * @param sqlSession
	 * @param singoNo
	 * @return
	 */
	int deleteSingo(SqlSession sqlSession, Integer singoNo);

	/**
	 * 신고 회원 검색 수 Store
	 * @param sqlSession
	 * @param searchKeyword
	 * @return
	 */
	int getSingoListCount(SqlSession sqlSession, String searchKeyword);

	/**
	 * 신고 회원 검색 리스트 Store
	 * @param sqlSession
	 * @param pInfo
	 * @param searchKeyword
	 * @return
	 */
	List<Singo> selectSingoList(SqlSession sqlSession, PageInfo pInfo, String searchKeyword);

	/**
	 * 신고 등록 Store
	 * @param sqlSession
	 * @param singo
	 * @return
	 */
	int insertSingo(SqlSession sqlSession, Singo singo);

}
