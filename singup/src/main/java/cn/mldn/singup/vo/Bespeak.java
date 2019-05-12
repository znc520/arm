package cn.mldn.singup.vo;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class Bespeak implements Serializable {
	private Integer beid ;
	private Integer typeid ;
	private Integer eduid ;
	private Integer srcid ;
	private String name ;
	private String phone ;
	private String school ;
	private Date bedate ;
	private Date indate ;
	private Integer status ;
	private String benote ;
	private String note ;
	private String edu ;
	private String type ;
	private String src ;
	public Integer getBeid() {
		return beid;
	}
	public void setBeid(Integer beid) {
		this.beid = beid;
	}
	public Integer getTypeid() {
		return typeid;
	}
	public void setTypeid(Integer typeid) {
		this.typeid = typeid;
	}
	public Integer getEduid() {
		return eduid;
	}
	public void setEduid(Integer eduid) {
		this.eduid = eduid;
	}
	public Integer getSrcid() {
		return srcid;
	}
	public void setSrcid(Integer srcid) {
		this.srcid = srcid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public Date getBedate() {
		return bedate;
	}
	public void setBedate(Date bedate) {
		this.bedate = bedate;
	}
	public Date getIndate() {
		return indate;
	}
	public void setIndate(Date indate) {
		this.indate = indate;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getBenote() {
		return benote;
	}
	public void setBenote(String benote) {
		this.benote = benote;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getEdu() {
		return edu;
	}
	public void setEdu(String edu) {
		this.edu = edu;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
}
