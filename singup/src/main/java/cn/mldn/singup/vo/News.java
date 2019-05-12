package cn.mldn.singup.vo;

import java.io.Serializable;
import java.util.Date;

import cn.mldn.util.FormDateUtil;

@SuppressWarnings("serial")
public class News implements Serializable {
	private Integer nid;
	private Integer dtid;
	private String mid;
	private String title;
	private String abs;
	private String content;
	private String photo;
	private Date pubdate;
	private Integer flag;

	public Integer getNid() {
		return nid;
	}

	public void setNid(Integer nid) {
		this.nid = nid;
	}

	public Integer getDtid() {
		return dtid;
	}

	public void setDtid(Integer dtid) {
		this.dtid = dtid;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAbs() {
		return abs;
	}

	public void setAbs(String abs) {
		this.abs = abs;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public Date getPubdate() {
		return pubdate;
	}

	public void setPubdate(Date pubdate) {
		this.pubdate = pubdate;
	}

	public Integer getFlag() {
		return flag;
	}

	public void setFlag(Integer flag) {
		this.flag = flag;
	}

	@Override
	public String toString() {
		return "<li><a href=\"news/show.action?nid=" + this.nid
				+ "\"><span class=\"glyphicon glyphicon-exclamation-sign text-danger\"></span>&nbsp;【"
				+ FormDateUtil.formatDate(this.pubdate) + "】" + this.title + "</a></li>";
	}
}
