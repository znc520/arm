package cn.mldn.singup.vo;

import java.io.Serializable;
import java.util.Date;
/**
 * 
 * @author 朱乃超   (海南大学2015级网络工程专业)
 *
 */
@SuppressWarnings("serial")
public class Member implements Serializable {
	private String mid ;
	private String password ;
	private String name ;
	private Integer sflag ;
	private Date regdate ;
	private Integer locked ;
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getSflag() {
		return sflag;
	}
	public void setSflag(Integer sflag) {
		this.sflag = sflag;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Integer getLocked() {
		return locked;
	}
	public void setLocked(Integer locked) {
		this.locked = locked;
	} 
}
