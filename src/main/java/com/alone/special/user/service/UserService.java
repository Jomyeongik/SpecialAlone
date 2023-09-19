package com.alone.special.user.service;

import java.util.List;
import java.util.Map;

import com.alone.special.noticeEvent.domain.PageInfo;
import com.alone.special.user.domain.User;

public interface UserService {
	/**
	 * 회원가입 service
	 * @param user
	 * @return
	 */
	int insertUser(User user);
	/**
	 * 회원정보수정 service
	 * @param user
	 * @return
	 */
	int updateUser(User user);
	/**
	 * 회원정보 탈퇴 service
	 * @param userId
	 * @return
	 */
	int deleteUser(String userId);
	/**
	 * 회원로그인 service
	 * @param user
	 * @return
	 */
	int loginUser(User user);
	/**
	 * 회원정보 
	 * @param userId
	 * @return
	 */
	User selectOneById(String userId);
	/**
	 * 회원가입 아이디 유효성 체크 service
	 * @param userId
	 * @return
	 */
	boolean userIdValid(String userId);
	/**
	 * 회원가입 이메일 유효성 체크 service
	 * @param userEmail
	 * @return
	 */
	boolean userEmailValid(String userEmail);
	/**
	 * 회원 아이디 찾기 service
	 * @param userEmail
	 * @return
	 */
	String findUserId(String userEmail);
	/**
	 * 회원 비밀번호 찾기 service
	 * @param userId
	 * @param userEmail
	 * @return
	 */
	Map<String, String> findUserPw(String userId, String userEmail);
	/**
	 * 회원 전체 수 Service
	 * @return
	 */
	Integer getUserListCount();
	/**
	 * 회원 전체 리스트 조회 service
	 * @param pInfo
	 * @return
	 */
	List<User> selectUserList(PageInfo pInfo);
	/**
	 * 검색된 회원 수 service
	 * @param searchKeyword
	 * @return
	 */
	Integer getUserListCount(String searchKeyword);
	/**
	 * 회원 검색 리스트 service
	 * @param pInfo
	 * @param searchKeyword
	 * @return
	 */
	List<User> selectUserList(PageInfo pInfo, String searchKeyword);

}
