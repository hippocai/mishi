package com.jftt.wifi.bean;

import java.io.Serializable;

public class RateBean implements Serializable {

	/**  
	 * define a field serialVersionUID which type is long
	 */
	private static final long serialVersionUID = -4650587885895436719L;

	/*
		userId
		uId
		commentId
		content
	 */
	
	private long userId;
	private long uId;
	private long commentId;
	private String content;
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public long getuId() {
		return uId;
	}
	public void setuId(long uId) {
		this.uId = uId;
	}
	public long getCommentId() {
		return commentId;
	}
	public void setCommentId(long commentId) {
		this.commentId = commentId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
