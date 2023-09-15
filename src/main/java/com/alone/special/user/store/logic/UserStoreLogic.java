package com.alone.special.user.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.alone.special.user.domain.User;
import com.alone.special.user.store.UserStore;

@Repository
public class UserStoreLogic implements UserStore{
	
	// 회원가입
	@Override
	public int insertUser(SqlSession session, User user) {
		int result = session.insert("UserMapper.insertUser", user);
		return result;
	}
	// 회원정보수정
	@Override
	public int updateUser(SqlSession session, User user) {
		int result = session.update("UserMapper.updateUser", user);
		return result;
	}
	// 회원로그인
	@Override
	public int loginUser(SqlSession session, User user) {
		int result = session.selectOne("UserMapper.loginUser", user);
		return result;
	}
	// 회원정보
	@Override
	public User selectUserByNo(SqlSession session, Integer userNo) {
		return null;
	}

}
