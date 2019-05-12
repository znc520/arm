package cn.mldn.singup.service.back.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.stereotype.Service;

import cn.mldn.singup.dao.IDictionaryDAO;
import cn.mldn.singup.service.back.IDictionaryServiceBack;
import cn.mldn.singup.service.back.abs.AbstractServiceBack;
@Service
public class DictionaryServiceBackImpl  extends AbstractServiceBack implements IDictionaryServiceBack{
      @Resource
	private IDictionaryDAO dctionaryDAO;
      @RequiresRoles("bespeak")
      @RequiresPermissions("bespeak:list")
	@Override
	public Map<String, Object> listBespeak() {
		Map<String, Object>map=new HashMap<String, Object>();
		map.put("allEdus", this.dctionaryDAO.findAllByItem("edu"));
		map.put("allBetypes", this.dctionaryDAO.findAllByItem("betype"));
		map.put("allSources", this.dctionaryDAO.findAllByItem("source"));
		return map;
	}

}
