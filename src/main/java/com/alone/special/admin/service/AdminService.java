package com.alone.special.admin.service;

import java.util.List;

import com.alone.special.admin.domain.Singo;
import com.alone.special.noticeEvent.domain.PageInfo;
import com.alone.special.review.domain.Review;
import com.alone.special.review.domain.ReviewPageInfo;
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

	/**
	 * 안전리뷰 전체 리스트 Service
	 * @param pInfo
	 * @return
	 */
	List<Review> getAllReviews(ReviewPageInfo pInfo);

	/**
	 * 안전리뷰 검색 갯수 조회 Service
	 * @param searchKeyword
	 * @return
	 */
	Integer selectReviewListCountByKeyword(String searchKeyword);

	/**
	 * 안전 리뷰 검색 리스트 Service
	 * @param pInfo
	 * @param searchKeyword
	 * @return
	 */
	List<Review> getAllReviewsByKeyword(ReviewPageInfo pInfo, String searchKeyword);

	/**
	 * 전체 회원 수 조회 Service
	 * @return
	 */
	Integer getUserListCount();

	/**
	 * 전체 회원 조회 Service
	 * @param pInfo
	 * @return
	 */
	List<User> selectUserList(PageInfo pInfo);

	/**
	 * 검색 회원 수 조회 Service
	 * @param searchKeyword
	 * @return
	 */
	Integer getUserListCount(String searchKeyword);

	/**
	 * 검색 회원 리스트 Service
	 * @param pInfo
	 * @param searchKeyword
	 * @return
	 */
	List<User> selectUserList(PageInfo pInfo, String searchKeyword);

}
