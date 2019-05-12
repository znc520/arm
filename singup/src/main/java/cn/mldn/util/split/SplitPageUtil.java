package cn.mldn.util.split;

import javax.servlet.http.HttpServletRequest;

public class SplitPageUtil {
	private String column ;
	private String keyWord ;
	private Integer currentPage ;
	private Integer lineSize = 5 ;
	/**
	 * 传入一个默认的分页处理类   
	 * @param column 默认分页处理类
	 */
	public SplitPageUtil(HttpServletRequest request,String column) {
		this.column = column ;
		this.setCp(request.getParameter("cp"));
		this.setLs(request.getParameter("ls"));
		this.setCol(request.getParameter("col"));
		this.setKw(request.getParameter("kw"));
	}
	public Integer getCurrentPage() {
		return currentPage;
	}
	public Integer getLineSize() {
		return lineSize; 
	}
	public String getKeyWord() {
		return keyWord;
	}
	public String getColumn() {
		return column;
	}
	/**
	 * 设置查询关键字，如果没有关键字则内容设置为null
	 * @param kw
	 */
	public void setKw(String kw) {
		if ("".equals(kw)) {
			this.keyWord = null ;
		} else if ("null".equalsIgnoreCase(kw)) {
			this.keyWord = null ;
		} else {
			this.keyWord = kw ;
		} 
	}
	/**
	 * 设置分页组件传递来的col参数，如果没有参数，则使用defaultColumn
	 * @param col
	 */
	public void setCol(String col) {
		if (!(col == null || "".equals(col) || "null".equalsIgnoreCase(col))) {
			this.column = col ;
		} 
	} 
	/**
	 * 接收分页组件传递过来的ls参数的数据
	 * @param ls
	 */
	public void setLs(String ls) {
		try {
			this.lineSize = Integer.parseInt(ls) ;
		} catch (Exception e) {}
	}
	/**
	 * 此操作主要是处理分页组件传递过来的相关信息
	 * @param cp
	 */
	public void setCp(String cp) {
		try {
			this.currentPage = Integer.parseInt(cp) ;
		} catch (Exception e) {
			this.currentPage = 1 ;	// 如果没有cp参数传递，则currentPage的内容就是1
		}
	}
	@Override
	public String toString() {
		return "SplitPageUtil [column=" + column + ", keyWord=" + keyWord + ", currentPage=" + currentPage
				+ ", lineSize=" + lineSize + "]";
	}
}
