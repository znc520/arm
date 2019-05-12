package cn.mldn.singup.service.back.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.stereotype.Service;

import cn.mldn.singup.dao.IDictionaryDAO;
import cn.mldn.singup.dao.INewsDAO;
import cn.mldn.singup.service.back.INewsServiceBack;
import cn.mldn.singup.service.back.abs.AbstractServiceBack;
import cn.mldn.singup.vo.News;
@Service
public class NewsServiceBack extends AbstractServiceBack implements INewsServiceBack {
      @Resource
	private INewsDAO newsDAO;
      @Resource
      private IDictionaryDAO dctionaryDAO;
  	@RequiresRoles("news")
  	@RequiresPermissions("news:add")
	@Override
	public boolean add(News vo) {  
  		vo.setPubdate(new Date());
		if(this.newsDAO.findByTitle(vo.getTitle())==null){
		return this.newsDAO.doCreate(vo);
		
		}
		return false;    
	}
	@RequiresRoles("news")
  	@RequiresPermissions("news:add")
	@Override
	public Map<String, Object> addPre() {
	Map<String, Object>map=new HashMap<String, Object>();
	map.put("allNewsType", this.dctionaryDAO.findAllByItem("news"));
		return map;
	}

	@Override
	public News getByTitle(String title) {
		// TODO Auto-generated method stub
		return this.newsDAO.findByTitle(title);
	}
	@RequiresRoles("news")
  	@RequiresPermissions("news:list")
	@Override
	public Map<String, Object> list(String column, String keyWord,
			int currentPage, int lineSize) {
		Map<String, Object>params=super.handleParams(column, keyWord, currentPage, lineSize);
		Map<String, Object>map=new HashMap<String, Object>();
		map.put("allNews", this.newsDAO.findAllSplit(params));
		map.put("newsCount", this.newsDAO.getAllCount(params));
		return map;
	}
	@RequiresRoles("news")
  	@RequiresPermissions("news:list")
	@Override
	public Map<String, Object> listNone(String column, String keyWord,
			int currentPage, int lineSize) {
		Map<String, Object>params=super.handleParams(column, keyWord, currentPage, lineSize);
		params.put("flag", 0);//业务层上针对的是flag进行控制
		Map<String, Object>map=new HashMap<String, Object>();
		map.put("allNews", this.newsDAO.findAllSplitByFlag(params));
		map.put("newsCount", this.newsDAO.getAllCountByFlag(params));
		return map;
	}
	@RequiresRoles("news")
  	@RequiresPermissions("news:edit")
	@Override
	public Map<String, Object> editPre(Integer nid) {
		 Map<String, Object>map=new HashMap<String, Object>();
		 map.put("allNewsType", this.dctionaryDAO.findAllByItem("news"));
		 map.put("news", this.newsDAO.findById(nid));
		return map;
	}
	@RequiresRoles("news")
  	@RequiresPermissions("news:edit")
	@Override
	public boolean edit(News vo) {
		 News oldNews=this.newsDAO.findByTitle(vo.getTitle());
		// vo.setPubdate(new Date());
		
		 if(oldNews!=null){//该标题存在，可以使用
			 if(!vo.getNid().equals(oldNews.getNid())){//新闻标号不同
				 return false;
				 
			 }
		 }
		return this.newsDAO.doUpdate(vo);
	}
	@RequiresRoles("news")
  	@RequiresPermissions("news:edit")
	@Override
	public boolean remove(Set<Integer> ids) {
	if(ids==null || ids.size()==0){
		return false;
	}
		return this.newsDAO.doRemove(ids.toArray()); 
	}
	@RequiresRoles("news")
  	@RequiresPermissions("news:list")
	@Override
	public List<News> listByFlag(int currentPage, int lineSize, int flag) {
		Map<String, Object>map=super.handleParams(null, null, currentPage, lineSize);
		map.put("flag", flag);
		return this.newsDAO.findAllSplitByFlag(map);
	}


}
