package cn.mldn.singup.dao;

import java.util.List;
import java.util.Map;

import cn.mldn.singup.vo.Bespeak;
import cn.mldn.singup.vo.BespeakCount;

public interface IBespeakDAO {
	public boolean doCreate(Bespeak vo) ;
	/**
	 * 根据id查看报名详情信息
	 * @param beid
	 * @return
	 */
	public Bespeak findById(Integer beid) ;
	
	/**
	 * 实现分页的数据列表，处理的时候采用动态SQL，如果没有column或keyWord表示查询全部
	 * @param params 包含有如下的几个参数：<br>
	 * 1、key = column、value = 模糊查询的数据列；<br>
	 * 2、key = keyWord、value = 模糊查询关键字；<br>
	 * 3、key = start、value = (currentPage - 1) * lineSize，开始记录数；<br>
	 * 4、key = lineSize、value = 每页显示的数据行数。 <br>
	 * 5、key = status、value = 处理状态。<br>
	 * @return
	 */	
	public List<Bespeak> findAllSplitByStatus(Map<String,Object> params) ;
	/**
	 * 进行数据的模糊查询统计操作，处理采用了的动态SQL，没有column与keyWord统计全表数据量
	 * @param params  包含有如下的几个参数：<br>
	 * 1、key = column、value = 模糊查询的数据列；<br>
	 * 2、key = keyWord、value = 模糊查询关键字；<br>
	 * 3、key = status、value = 处理状态。<br>
	 * @return 
	 */
	public Integer getAllCountByStatus(Map<String,Object> params) ; 
	/**
	 * 实现备注数据的更新处理操作，本操作中需要传入的Map集合包含有如下内容；<br>
	 * key=beid value=要追加的备注信息。
	 * key=newNote value= 要追加的备注信息。<br>
	 * key=status value=要更新的状态值。<br>
	 * 
	 * @param param
	 * @return
	 */
	public boolean doUpdateNote(Map<String, Object>param);
	
	/**
	 * 实现备注数据的更新处理操作，本操作中需要传入的Map集合包含有如下内容；<br>
	 * key=beid value=要追加的备注信息。
	 * key=newNote value= 要追加的备注信息。<br>
	 * key=status value=要更新的状态值。<br>
	 * 
	 * @param param
	 * @return
	 */
	public boolean doUpdateByStatus(Map<String, Object>param);
	/**
	 * 根据status的内容进行数据分组，而后取得每组的查询结果
	 * @return
	 */
	public List<BespeakCount>getStatusCount();
	
}
