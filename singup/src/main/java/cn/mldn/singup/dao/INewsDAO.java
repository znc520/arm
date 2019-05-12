package cn.mldn.singup.dao;

import java.util.List;
import java.util.Map;

import cn.mldn.singup.vo.Member;
import cn.mldn.singup.vo.News;

public interface INewsDAO {
	/**
	 * 根据新闻标题查询出新闻数据是否存在
	 * @param title
	 * @return
	 */
public News findByTitle(String title);
/**
 * 实现新闻数据的增加
 * @param vo
 * @return
 */
public boolean doCreate(News vo);
/**
 * 实现分页的数据列表，处理的时候采用动态SQL,如果没有column或者keyword表示查询全部
 * @param params 包含有如下的几个参数：<br>
 * key=column value=模糊的查询数据列：<br>
 * key=keyWord value=模糊的查询关键字
 * key=start,value=(currentPage -1)*lineSize,开始的记录数；<br>
 * key=lineSize,value=每行显示的数据行数
 * @return
 */
public List<News>findAllSplit(Map<String, Object>params);
/**
 * 进行数据的模糊查询统计操作，处理采用动态SQL，没有column与keyword统计全表数据量
 * @param params 包含有如下的参数 ：<br>
 * key=column。value=模糊查询的数据列；<br>
 * key=keyWord,value=模糊查询的关机键；<br>
 * @return
 */
public Integer getAllCount(Map<String, Object>params);
/**
 * 进行数据的模糊查询统计操作，处理采用动态SQL，没有column与keyword统计全表数据量
 * @param params 包含有如下的参数 ：<br>
 * key=column。value=模糊查询的数据列；<br>
 * key=keyWord,value=模糊查询的关机键；<br>
 * key=start value=(currentPage - 1) * lineSize,开始记录数；<br>
 * key=lineSize value=每页显示的数据行数.<br>
 * 
 * key=flag,value=发布状态
 * @return
 */
public List<News>findAllSplitByFlag(Map<String, Object>params);
/**
 * 进行数据的模糊查询统计操作，处理采用动态SQL，没有column与keyword统计全表数据量
 * @param params 包含有如下的参数 ：<br>
 * key=column。value=模糊查询的数据列；<br>
 * key=keyWord,value=模糊查询的关机键；<br>
 * key=flag,value=发布状态
 * @return
 */
public Integer getAllCountByFlag(Map<String, Object>params);

/** 
 * 根据id实现news数据的查询过程
 * @param nid 要查询的nid的数据
 * @return
 */
public News findById(Integer nid) ;  
/**
* 实现用户的更新处理
* @param vo
* @return
*/
public boolean doUpdate(News vo);
/**
 * 实现数据的批量删除，执行到此层次的Set集合一定有数据
 * @param ids
 * @return
 */
public boolean doRemove(Object ids[]);
}
