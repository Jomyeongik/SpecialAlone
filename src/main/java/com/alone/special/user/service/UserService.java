package com.alone.special.user.service;

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
	 * 회원로그인 service
	 * @param user
	 * @return
	 */
	int loginUser(User user);
	/**
	 * 회원정보 service
	 * @param userNo
	 * @return
	 */
	User selectUserByNo(Integer userNo);

}
