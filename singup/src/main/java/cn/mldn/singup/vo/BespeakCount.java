package cn.mldn.singup.vo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class BespeakCount implements Serializable {
	
	private Integer status;
	private Integer count;
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	

}
