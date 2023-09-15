package com.alone.special.review.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alone.special.review.domain.Review;
import com.alone.special.review.service.ReviewService;
import com.alone.special.review.store.ReviewStore;

@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private SqlSession session;
	@Autowired
	private ReviewStore store;
	@Override
	public Review selectOne(String sReviewId) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
