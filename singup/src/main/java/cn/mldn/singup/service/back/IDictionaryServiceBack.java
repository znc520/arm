package cn.mldn.singup.service.back;

import java.util.Map;

public interface IDictionaryServiceBack {
	/**
	 * 列出报名的静态数据信息，需要列出的信息，包括如下内容：
	 * 1、所有的预约类型的数据字典内容；<br>
	 * 2、所有的学历的数据字典内容；<br>
	 * 3、所有信息来源的数据字典内容；<br>
	 * @return 返回的数据保存在Map集合里面，包含有如下的组成：<br>
	 * 1、key = allEdus、value = 所有的学历的数据信息；<br>
	 * 2、key = allBetypes、value = 所有的预约类型的数据信息；<br>
	 * 3、key = allSources、value = 所有的信息来源的数据信息；<br>
	 */
	public Map<String,Object> listBespeak() ;
}
