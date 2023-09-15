package com.alone.special.user.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alone.special.user.domain.User;
import com.alone.special.user.service.UserService;
import com.alone.special.user.store.UserStore;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private SqlSession session;
	@Autowired
	private UserStore uStore;
	
	// 회원가입
	@Override
	public int insertUser(User user) {
		int result = uStore.insertUser(session, user);
		return result;
	}
	// 회원정보수정
	@Override
	public int updateUser(User user) {
		int result = uStore.updateUser(session, user);
		return result;
	}
	// 회원로그인
	@Override
	public int loginUser(User user) {
		int result = uStore.loginUser(session, user);
		return result;
	}
	@Override
	public User selectUserByNo(Integer userNo) {
		User user = uStore.selectUserByNo(session, userNo);
		return user;
	}

}
