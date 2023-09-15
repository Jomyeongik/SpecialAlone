package com.alone.special.review.domain;

import java.sql.Date;

public class Review {
	private int sReviewId;
	private int sProductId;
	private int sUserNo;
	private String sUserId;
	private String sReviewContent;
	private int sReviewReCommend;
	private int sReviewDeRecommend;
	private int sRating;
	private String sFilerename;
	private String sFilePath;
	private int sfileLength;
	private Date sCreateDate;
	private Date sUpdateDate;
	
	public int getsReviewReCommend() {
		return sReviewReCommend;
	}
	public void setsReviewReCommend(int sReviewReCommend) {
		this.sReviewReCommend = sReviewReCommend;
	}
	public int getsReviewDeRecommend() {
		return sReviewDeRecommend;
	}
	public void setsReviewDeRecommend(int sReviewDeRecommend) {
		this.sReviewDeRecommend = sReviewDeRecommend;
	}
	public String getsUserId() {
		return sUserId;
	}
	public void setsUserId(String sUserId) {
		this.sUserId = sUserId;
	}
	public int getsReviewId() {
		return this.sReviewId;
	}
	public void setsReviewId(int sReviewId) {
		this.sReviewId = sReviewId;
	}
	public int getsProductId() {
		return sProductId;
	}
	public void setsProductId(int sProductId) {
		this.sProductId = sProductId;
	}
	public int getsUserNo() {
		return sUserNo;
	}
	public void setsUserNo(int sUserNo) {
		this.sUserNo = sUserNo;
	}
	public String getsReviewContent() {
		return sReviewContent;
	}
	public void setsReviewContent(String sReviewContent) {
		this.sReviewContent = sReviewContent;
	}
	public int getsRating() {
		return sRating;
	}
	public void setsRating(int sRating) {
		this.sRating = sRating;
	}
	public String getsFilerename() {
		return sFilerename;
	}
	public void setsFilename(String sFilerename) {
		this.sFilerename = sFilerename;
	}
	public String getsFilePath() {
		return sFilePath;
	}
	public void setsFilePath(String sFilePath) {
		this.sFilePath = sFilePath;
	}
	public int getSfileLength() {
		return sfileLength;
	}
	public void setSfileLength(int sfileLength) {
		this.sfileLength = sfileLength;
	}
	public Date getsCreateDate() {
		return sCreateDate;
	}
	public void setsCreateDate(Date sCreateDate) {
		this.sCreateDate = sCreateDate;
	}
	public Date getsUpdateDate() {
		return sUpdateDate;
	}
	public void setsUpdateDate(Date sUpdateDate) {
		this.sUpdateDate = sUpdateDate;
	}
	@Override
	public String toString() {
		return "Review [리뷰번호=" + sReviewId + ", 상품아이디=" + sProductId + ", 유저번호=" + sUserNo + ", 유저아이디="
				+ sUserId + ", 리뷰내용=" + sReviewContent + ", 리뷰추천=" + sReviewReCommend
				+ ", 리뷰비추천=" + sReviewDeRecommend + ", 별점=" + sRating + ", 첨부파일이름=" + sFilerename
				+ ", 첨부파일경로=" + sFilePath + ", 첨부파일길이=" + sfileLength + ", 생성일자=" + sCreateDate
				+ ", 수정일자=" + sUpdateDate + "]";
	}
	
	
}
