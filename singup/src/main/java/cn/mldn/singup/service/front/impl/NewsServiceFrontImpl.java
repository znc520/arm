package cn.mldn.singup.service.front.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.stereotype.Service;

import cn.mldn.singup.dao.INewsDAO;
import cn.mldn.singup.service.front.INewsServiceFront;
import cn.mldn.singup.service.front.abs.AbstractServiceFront;
import cn.mldn.singup.vo.News;
@Service
public class NewsServiceFrontImpl extends AbstractServiceFront implements INewsServiceFront{
  @Resource
	private INewsDAO newsDAO;
     

	@Override
	public News show(Integer nid) {
		News  vo=this.newsDAO.findById(nid);
		if(vo.getFlag().equals(1)){//只查询发布的公告信息
			return vo;
		}
		return null;
	}

	@Override
	public Map<String, Object> list(String column, String keyWord,
			int currentPage, int lineSize) {
		Map<String, Object>params=super.handleParams(column, keyWord, currentPage, lineSize);
		params.put("flag", 1);//业务层上针对的是flag进行控制
		Map<String, Object>map=new HashMap<String, Object>();
		map.put("allNews", this.newsDAO.findAllSplitByFlag(params));
		map.put("newsCount", this.newsDAO.getAllCountByFlag(params));
		return map;
	}
  
}
