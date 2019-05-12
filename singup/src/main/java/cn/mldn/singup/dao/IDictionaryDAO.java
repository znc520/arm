package cn.mldn.singup.dao;

import java.util.List;

import cn.mldn.singup.vo.Dictionary;

public interface IDictionaryDAO {
	/**
	 * 根据数据字典的id取得标题信息
	 * @param dtid
	 * @return
	 */ 
	public Dictionary findById(int dtid) ;
	
	/**
	 * 根据数据字典的分类查询出所有相关的数据信息
	 * @param item 数据字典的分类处理 
	 * @return
	 */
	public List<Dictionary> findAllByItem(String item) ;
}
