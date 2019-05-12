package cn.mldn.singup.service.back;

import java.util.List;
import java.util.Map;
import java.util.Set;

import cn.mldn.singup.vo.Member;
import cn.mldn.singup.vo.News;

public interface INewsServiceBack {
	/**
	 * 实现新闻数据的保存处理，调用INewsDAO.doCreate()方法
	 * @param vo
	 * @return
	 */
	public  boolean add(News vo);
	/**
	 * 在进行新闻追加前的查询操作，
	 * 1.要知道所有的新闻数据分类，查询：IDictionaryDAO.findAllByItem()方法
	 * 
	 * @return 返回的内容 包含有如下数据：<br>
	 * key=allNewsType,value=IDictionaryDAO.findAllByItem("news")
	 */
    public Map<String, Object>addPre();
    /**
     * 主要是为了ajax验证使用
     * @param title 进行标题的验证处理
     * @return
     */
    public News getByTitle(String title);
    /**
     * 实现数据的分页查询操作，需要进行如下的查询<br>
      1.调用InewsDAO.findAllSplit()方法查询出具体的数据内容；<br>
      2.调用InewsDAO.getAllCount方法统计出数据量.<br>
     * @param column  模糊查询列
     * @param keyWord 模糊查询关键字
     * @param currentPage 当前所在的页
     * @param lineSize 每页显示的数据量
     * @return   返回的结果包含如下数据：<br>
     * key=allNews value=InewsDAO.findAllSplit()
     * key=newsCount value=InewsDAO.getAllCount
     * @throws Exception
     */
	public Map<String, Object> list(String column, String keyWord,
			int currentPage, int lineSize) ;
	/**
	 * 实现数据的分页查询操作，需要进行如下的查询<br>
      1.调用InewsDAO.findAllSplit()方法查询出具体的数据内容；<br>
      2.调用InewsDAO.getAllCount方法统计出数据量.<br>
	 * @param column  模糊查询列
	 * @param keyWord 模糊查询关键字
	 * @param currentPage 当前所在的页
	 * @param lineSize 每页显示的数据量
	 * @return   返回的结果包含如下数据：<br>
	 * key=allNews value=InewsDAO.findAllSplit()
	 * key=newsCount value=InewsDAO.getAllCount
	 * @throws Exception
	 */
	public Map<String, Object> listNone(String column, String keyWord,
			int currentPage, int lineSize) ;
       
/**
 * 在进行新闻增加前的数据查询处理，要查询如下内容:<br>
 * 1.要知道所有的新闻数据分类，查询 IDcitionaryDAO.findAllByItem()方法<br>
 * 2.根据新闻编号查询新闻的完整数据，INewsDAO.findById()方法<br>
 * @param nid
 * key=allNewsType value=IDcitionaryDAO.findAllByItem()
 * key=news value=INewsDAO.findById()
 * @return
 */
	public  Map<String, Object>editPre(Integer nid);
/**
 * 实现新闻数据的保存处理，调用如下操作<br>
 * 1.需要判断现在的title数据是否存在
 * 2.如果title数据不存在，则可以用INewsDAO.doUPdate()进行数据更新
 * @param vo
 * @return
 */
	public boolean edit(News vo);
	/**
	 * 实现雇员数据的批量删除
	 * @param ids 要删除的数据集合
	 * @return 如果集合为null,或者长度为0,删除失败都会返回false
	 */
	public boolean remove(Set<Integer>ids);
/**
 * 根据公告的状态列出指定的范围数据
 * @param currentPage
 * @param lineSize
 * @param flag
 * @return
 */
	public List<News> listByFlag(int currentPage,int lineSize,int flag);
		

}
