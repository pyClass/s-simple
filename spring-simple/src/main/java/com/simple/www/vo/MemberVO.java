package com.simple.www.vo;

import java.text.*;

import org.springframework.web.multipart.*;

import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.sql.*;
/**
 * 이 클래스는 회원정보에 대한 데이터를 저장해서
 *  넘겨주는 용도로 사용할 클래스( DTO 또는 VO )
 *  
 * @author	전은석
 * @since	2019.11.12
 * @version	v.1.0
 * 
 * 			변경이력
 * 				2019.11.12	-	클래스 제작 	- 	담당자 : 전은석
 * 				2019.12.10	- 	jsp프로젝트에서 spring 프로젝트로 클래스 복사
 * 											- 	담당자 : 전은석
 * 
 */
public class MemberVO {
	private int mno;
	private String id;
	private String pw;
	private String name;
	private String mail;
	private String tel;
	private Date joinDate;
	private Time joinTime;
	private String sDate;
	private String sTime;
	private int avt; 		// 아바타 번호 저장할 변수
	private String avatar; 	// 아바타 파일이름 저장할 변수
	private String gen;
	private int cnt;
	private MultipartFile sFile;
	private MultipartFile[] file;
	
	public MultipartFile getsFile() {
		return sFile;
	}
	public void setsFile(MultipartFile sFile) {
		this.sFile = sFile;
	}
	public MultipartFile[] getFile() {
		return file;
	}
	public void setFile(MultipartFile[] file) {
		this.file = file;
	}
	public int getAvt() {
		return avt;
	}
	public void setAvt(int avt) {
		this.avt = avt;
	}
	public String getGen() {
		return gen;
	}
	public void setGen(String gen) {
		this.gen = gen;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public Time getJoinTime() {
		return joinTime;
	}
	public void setJoinTime(Time joinTime) {
		this.joinTime = joinTime;
	}
	public String getsDate() {
		return sDate;
	}
	public void setsDate(String sDate) {
		this.sDate = sDate;
	}
	public String getsTime() {
		return sTime;
	}
	public void setsTime() {
		SimpleDateFormat form = new SimpleDateFormat("HH:mm:ss");
		this.sTime = form.format(joinTime);
	}
	public void setsTime(String sTime) {
		this.sTime = sTime;
	}
	public void setsDate() {
		SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
		this.sDate = form.format(joinDate);
	}
}
