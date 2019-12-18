package com.simple.www.vo;

import java.sql.*;
import java.text.*;

/**
 * 	이 클래스는 댓글게시판의 글을 저장할 클래스
 * 
 * @author	전은석
 * @since	2019.12.03
 * @version	v.1.0
 * @see
 * 			변경이력
 * 				2019.12.03		- 클래스 제작		- 담당자 : 전은석
 *
 */
public class ReboardVO {
	private int rbno;
	private int upno;
	private int lvl;
	private int mno;
	private String body;
	private Date rbDate;
	private Time rbTime;
	private String wDate;
	private String wTime;
	private String id;
	private String avatar;
	public int getRbno() {
		return rbno;
	}
	public void setRbno(int rbno) {
		this.rbno = rbno;
	}
	public int getUpno() {
		return upno;
	}
	public void setUpno(int upno) {
		this.upno = upno;
	}
	public int getLvl() {
		return lvl;
	}
	public void setLvl(int lvl) {
		this.lvl = lvl;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public Date getRbDate() {
		return rbDate;
	}
	public void setRbDate(Date rbDate) {
		this.rbDate = rbDate;
		setwDate();
	}
	public Time getRbTime() {
		return rbTime;
	}
	public void setRbTime(Time rbTime) {
		this.rbTime = rbTime;
		setwTime();
	}
	public String getwDate() {
		return wDate;
	}
	public void setwDate() {
		SimpleDateFormat form = new SimpleDateFormat("yyyy/ MM/ dd");
		this.wDate = form.format(rbDate);
	}
	public void setwDate(String wDate) {
		this.wDate = wDate;
	}
	public String getwTime() {
		return wTime;
	}
	public void setwTime() {
		SimpleDateFormat form = new SimpleDateFormat("HH:mm:ss");
		this.wTime = form.format(rbTime);
	}
	public void setwTime(String wTime) {
		this.wTime = wTime;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
}
