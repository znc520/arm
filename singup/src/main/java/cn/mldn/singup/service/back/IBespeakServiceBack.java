package cn.mldn.singup.service.back;

import java.util.Map;

import cn.mldn.singup.vo.Bespeak;

public interface IBespeakServiceBack {
	/**
	 * 根据报名的id查找到报名的完整信息
	 * @param beid
	 * @return  
	 */
	public Bespeak get(int beid) ;
	
	/**
	 * 实现数据的分页查询操作，需要进行如下的查询：<br>
	 * 1、调用IBespeakDAO.findAllSplitByStatus()方法查询出具体的数据内容；<br>
	 * 2、调用IBespeakDAO.getAllCountByStatus()方法统计数据量。<br>
	 * 对于status的内容取值有如下的原则：
	 * 1、status = 0：表示列出所有未处理的报名申请；<br>
	 * 2、status = 1：表示该申请已经被处理过了；<br>
	 * 3、status = 2：表示该申请属于废弃的申请；<br>
	 * @param column 模糊查询列
	 * @param keyWord 模糊查询关键字
	 * @param currentPage 当前所在页
	 * @param lineSize 每页显示的数据行
	 * @param status 描述的是数据查询的类型，如果设置为null表示查询全部
	 * @return 返回的结果包含有如下数据：<br>
	 * 1、key = allBespeaks、value = IBespeakDAO.findAllSplitByStatus()；<br>
	 * 2、key = bespeakCount、value = IBespeakDAO.getAllCountByStatus()；<br>	 
	 */
	public Map<String, Object> listByStatus(String column, String keyWord, int currentPage, int lineSize,
			Integer status);
	/**
	 * 进行备注信息的更新处理
	 * @param beid
	 * @param newNote
	 * @return
	 */
	public boolean editNote(int beid,String newNote);
	/**
	 * 实现报名状态的控制
	 * @param beid

	 * @param status
	 * @return
	 */
	public boolean editStatus(int beid,int status);
	/**
	 * 进行报名信息量的统计处理
	 * @return 返回有如下的数据组成<br>
	 * 1 key=all,value=全部记录数
	 * 2.key=status0,value=新报名记录数；
	 * 3.key=status1,value=已经处理预约
	 * 4.key=status2,value=废弃预约
	 * 
	 */
	public Map<String, Object>loadCount();
}
