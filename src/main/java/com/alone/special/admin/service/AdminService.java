package com.alone.special.admin.service;

import java.util.List;

import com.alone.special.admin.domain.Singo;
import com.alone.special.noticeEvent.domain.PageInfo;
import com.alone.special.user.domain.User;

public interface AdminService {
	/**
	 * 신고 회원 수 Service
	 * @return
	 */
	Integer getSingoListCount();

	/**
	 * 신고 회원 리스트 Service
	 * @param pInfo
	 * @return
	 */
	List<Singo> selectSingoList(PageInfo pInfo);

	/**
	 * 신고 취소 Service
	 * @param singoNo
	 * @return
	 */
	int deleteSingo(Integer singoNo);

	/**
	 * 신고 회원 검색 수 Service
	 * @param searchKeyword
	 * @return
	 */
	Integer getSingoListCount(String searchKeyword);

	/**
	 * 신고 회원 검색 리스트 Service
	 * @param pInfo
	 * @param searchKeyword
	 * @return
	 */
	List<Singo> selectSingoList(PageInfo pInfo, String searchKeyword);

	/**
	 * 신고 등록 Service
	 * @param singo
	 * @return
	 */
	int insertSingo(Singo singo);

}
