package com.alone.special.review.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.alone.special.review.store.ReviewStore;

@Repository
public class ReviewStoreLogic implements ReviewStore{
	@Autowired
	private SqlSession session;
}
