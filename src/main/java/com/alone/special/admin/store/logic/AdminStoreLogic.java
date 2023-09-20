package com.alone.special.admin.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.alone.special.admin.domain.Singo;
import com.alone.special.admin.store.AdminStore;
import com.alone.special.noticeEvent.domain.PageInfo;
import com.alone.special.review.domain.Review;
import com.alone.special.review.domain.ReviewPageInfo;
import com.alone.special.user.domain.User;

@Repository
public class AdminStoreLogic implements AdminStore{

	@Override
	public int getSingoListCount(SqlSession sqlSession) {
		int result = sqlSession.selectOne("SingoMapper.getSingoListCount");
		return result;
	}

	@Override
	public List<Singo> selectSingoList(SqlSession sqlSession, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Singo> sList = sqlSession.selectList("SingoMapper.selectSingoList", null, rowBounds);
		return sList;
	}

	@Override
	public int deleteSingo(SqlSession sqlSession, Integer singoNo) {
		int result = sqlSession.delete("SingoMapper.deleteSingo", singoNo);
		return result;
	}

	@Override
	public int getSingoListCount(SqlSession sqlSession, String searchKeyword) {
		int result = sqlSession.selectOne("SingoMapper.getSingoListCountByKeyword", searchKeyword);
		return result;
	}

	@Override
	public List<Singo> selectSingoList(SqlSession sqlSession, PageInfo pInfo, String searchKeyword) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Singo> sList = sqlSession.selectList("SingoMapper.selectSingoListByKeyword", searchKeyword, rowBounds);
		return sList;
	}

	@Override
	public int insertSingo(SqlSession sqlSession, Singo singo) {
		int	result = sqlSession.insert("SingoMapper.insertSingo", singo);
		return result;
	}

	@Override
	public List<Review> getAllReviews(SqlSession sqlSession, ReviewPageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Review> rList = sqlSession.selectList("ReviewMapper.getAllReviews", null, rowBounds);
		return rList;
	}

	@Override
	public int selectReviewListCountByKeyword(SqlSession sqlSession, String searchKeyword) {
		int result = sqlSession.selectOne("ReviewMapper.selectReviewListCountByKeyword", searchKeyword);
		return result;
	}

	@Override
	public List<Review> getAllReviewsByKeyword(SqlSession sqlSession, ReviewPageInfo pInfo, String searchKeyword) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Review> sList = sqlSession.selectList("ReviewMapper.getAllReviewsByKeyword", searchKeyword, rowBounds);
		return sList;
	}

	@Override
	public int getUserListCount(SqlSession sqlSession) {
		int result = sqlSession.selectOne("UserMapper.getUserListCount");
		return result;
	}

	@Override
	public List<User> selectUserList(SqlSession sqlSession, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<User> uList = sqlSession.selectList("UserMapper.selectUserList", null, rowBounds);
		return uList;
	}

	@Override
	public int getUserListCountByKeyword(SqlSession sqlSession, String searchKeyword) {
		int result = sqlSession.selectOne("UserMapper.getUserListCountByKeyword", searchKeyword);
		return result;
	}

	@Override
	public List<User> searchUserByKeyword(SqlSession sqlSession, PageInfo pInfo, String searchKeyword) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<User> uList = sqlSession.selectList("UserMapper.searchUserByKeyword", searchKeyword, rowBounds);
		return uList;
	}

}
