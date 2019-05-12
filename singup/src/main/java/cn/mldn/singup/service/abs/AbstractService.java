package cn.mldn.singup.service.abs;

import java.util.HashMap;
import java.util.Map;

public abstract class AbstractService {
	/**   
	 * 针对于Mybatis中需要接收Map集合的操作进行统一的定义，以保证传入的空字符串可以变为null
	 * @param column 模糊查询列
	 * @param keyWord 模糊查询关键字
	 * @param currentPage 当前所在页  
	 * @param lineSize 每页显示的数据行
	 * @return 根据指定的参数返回有相关的数据，包含如下内容：<br>
	 * 1、key = column、value = 具体的列或者是null；<br>
	 * 2、key = keyWord、value = 具体的模糊的关键字或者是null；<br>
	 * 3、key = start、value = (currentPage - 1) * lineSize；<br>
	 * 4、key = lineSize、value = 每页显示的数据行数。<br> 
	 */
	protected Map<String, Object> handleParams(String column, String keyWord, int currentPage, int lineSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		if ("".equals(column) || column == null || "null".equalsIgnoreCase(column)) {
			// map.put("column", null) ;
		} else {
			map.put("column", column) ;
		}
		if ("".equals(keyWord) || "null".equalsIgnoreCase(keyWord) || keyWord == null) {
			// map.put("keyWord", null) ;
		} else { 
			map.put("keyWord", "%" + keyWord + "%") ;
		}
		if ((currentPage - 1) * lineSize < 0) {
			map.put("start", 0) ;
		} else {
			map.put("start", (currentPage - 1) * lineSize) ;
		}
		map.put("lineSize", lineSize > 0 ? lineSize : 5) ;
		return map;
	}
}
