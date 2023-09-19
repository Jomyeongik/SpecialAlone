package com.alone.special.admin.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alone.special.admin.domain.Singo;
import com.alone.special.admin.service.AdminService;
import com.alone.special.admin.store.AdminStore;
import com.alone.special.noticeEvent.domain.PageInfo;
import com.alone.special.user.domain.User;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private AdminStore aStore;
	@Override
	public Integer getSingoListCount() {
		int result = aStore.getSingoListCount(sqlSession);
		return result;
	}
	@Override
	public List<Singo> selectSingoList(PageInfo pInfo) {
		List<Singo> sList = aStore.selectSingoList(sqlSession, pInfo);
		return sList;
	}
	@Override
	public int deleteSingo(Integer singoNo) {
		int result = aStore.deleteSingo(sqlSession, singoNo);
		return result;
	}
	@Override
	public Integer getSingoListCount(String searchKeyword) {
		int result = aStore.getSingoListCount(sqlSession, searchKeyword);
		return result;
	}
	@Override
	public List<Singo> selectSingoList(PageInfo pInfo, String searchKeyword) {
		List<Singo> sList = aStore.selectSingoList(sqlSession, pInfo, searchKeyword);
		return sList;
	}
	@Override
	public int insertSingo(Singo singo) {
		int result = aStore.insertSingo(sqlSession, singo);
		return result;
	}
}
