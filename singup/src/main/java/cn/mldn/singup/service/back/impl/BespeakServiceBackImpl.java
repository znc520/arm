package cn.mldn.singup.service.back.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.stereotype.Service;

import cn.mldn.singup.dao.IBespeakDAO;
import cn.mldn.singup.service.back.IBespeakServiceBack;
import cn.mldn.singup.service.back.abs.AbstractServiceBack;
import cn.mldn.singup.vo.Bespeak;
import cn.mldn.singup.vo.BespeakCount;
@Service
public class BespeakServiceBackImpl extends AbstractServiceBack implements IBespeakServiceBack {
	@Resource
	private IBespeakDAO bespeakDAO ;
	
	@Override
	@RequiresRoles("bespeak")
	@RequiresPermissions("bespeak:list")  
	public Bespeak get(int beid) {
		return this.bespeakDAO.findById(beid);
	} 
	
	@Override
	@RequiresRoles("bespeak")
	@RequiresPermissions("bespeak:list")
	public Map<String, Object> listByStatus(String column, String keyWord, int currentPage, int lineSize,
			Integer status) {
		Map<String,Object> map = super.handleParams(column, keyWord, currentPage, lineSize) ;
		map.put("status", status) ;
		Map<String,Object> result = new HashMap<String,Object>() ;
		result.put("allBespeaks", this.bespeakDAO.findAllSplitByStatus(map)) ;
		result.put("bespeakCount", this.bespeakDAO.getAllCountByStatus(map)) ;
		return result; 
	}

	@Override
	public boolean editNote(int beid, String newNote) {
	  Map<String, Object>param=new HashMap<String, Object>();
	  Bespeak vo=this.bespeakDAO.findById(beid);
	  param.put("beid", beid);
	  param.put("newNote", vo.getNote() + newNote +"\n");
	   if(vo.getStatus().equals(0)){//当前并未处理的报名信息
		   param.put("status", 1);
		return this.bespeakDAO.doUpdateByStatus(param);  
		
	   }
	   return this.bespeakDAO.doUpdateNote(param);
	}

	@Override
	public boolean editStatus(int beid, int status) {
		  Map<String, Object>param=new HashMap<String, Object>();
		
		  param.put("beid", beid);
		  param.put("status", status);
		return this.bespeakDAO.doUpdateByStatus(param);
	}

	@Override
	public Map<String, Object> loadCount() {
		  Map<String, Object>param=new HashMap<String, Object>();
		  param.put("all", this.bespeakDAO.getAllCountByStatus(param));
		  Iterator<BespeakCount>iter=this.bespeakDAO.getStatusCount().iterator();
		  while(iter.hasNext()){
			  
			  BespeakCount bc=iter.next();
			  param.put("status" + bc.getStatus(),bc.getCount());
		  }
		return param;
	}

}
