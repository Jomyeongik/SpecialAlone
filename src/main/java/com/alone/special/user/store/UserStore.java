package com.alone.special.user.store;

import org.apache.ibatis.session.SqlSession;

import com.alone.special.user.domain.User;

public interface UserStore {
	/**
	 * 회원가입 store
	 * @param session
	 * @param user
	 * @return
	 */
	int insertUser(SqlSession session, User user);
	/**
	 * 회원정보수정 store
	 * @param session
	 * @param user
	 * @return
	 */
	int updateUser(SqlSession session, User user);
	/**
	 * 회원로그인 store
	 * @param session
	 * @param user
	 * @return
	 */
	int loginUser(SqlSession session, User user);
	/**
	 * 회원정보 store
	 * @param session
	 * @param userNo
	 * @return
	 */
	User selectUserByNo(SqlSession session, Integer userNo);

}
