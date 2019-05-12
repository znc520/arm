package cn.mldn.singup.service.back.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.stereotype.Service;

import com.sun.prism.Image;

import cn.mldn.singup.dao.IActionDAO;
import cn.mldn.singup.dao.IMemberDAO;
import cn.mldn.singup.dao.IRoleDAO;
import cn.mldn.singup.service.back.IMemberServiceBack;
import cn.mldn.singup.service.back.abs.AbstractServiceBack;
import cn.mldn.singup.vo.Member;
@Service
public class MemberServiceBackImpl extends AbstractServiceBack implements IMemberServiceBack {
	@Resource 
	private IMemberDAO memberDAO ;
	@Resource
	private IRoleDAO roleDAO;
	@Resource
	private IActionDAO actionDAO;
	@Override
	public Member get(String mid) {
		return this.memberDAO.findById(mid); 
	}
	@Override
	public Map<String, Object> listAuthByMember(String mid) {
		Map<String, Object>map=new HashMap<String, Object>();
		map.put("allRoles", roleDAO.findAllRoleFlag(mid));
		map.put("allActions", actionDAO.findAllActionFlag(mid));
		return map;
	}
	@Override
	@RequiresUser
	public boolean eidtPassword(String mid, String oldPassword,
			String newPassword) {
		  Member vo=this.memberDAO.findById(mid);
		  if(vo==null){
			  return false;
		  }
		  if(oldPassword.equals(vo.getPassword())){//判断旧密码是否相等
			  Map<String, Object>params=new HashMap<String, Object>();
			  params.put("mid", mid);
			  params.put("newPassword", newPassword);
			  return this.memberDAO.doUpdatePassword(params);
		  }
		return false;
	}
	@RequiresRoles("member")
	@RequiresPermissions("member:list")
	@Override
	public List<Member> list() {
		// TODO Auto-generated method stub
		return this.memberDAO.findAll();
	}
	@RequiresRoles("member")
	@RequiresPermissions("member:edit")
	@Override
	public boolean editPasswordByAdmin(String mid, String password) {
		  Map<String, Object>map=new HashMap<String, Object>();
		  map.put("mid", mid);
		  map.put("password", password);
		return this.memberDAO.doUpdatePasswordByAdmin(map);
	}
	@RequiresRoles("member")
	@RequiresPermissions("member:edit")
	@Override
	public boolean editLocked(String mid, int locked) {
		  Map<String, Object>map=new HashMap<String, Object>();
		  map.put("mid", mid);
		  map.put("locked", locked);
		return this.memberDAO.doUpdateLocked(map);
	}
	@RequiresRoles("member")
	@RequiresPermissions("member:add")
	@Override
	public Map<String, Object> addPre() {
		Map<String, Object>map=new HashMap<String, Object>();
		map.put("allRoles", this.roleDAO.findAll());
		return map;
	}
	@RequiresPermissions("member:add")
	@Override
	public boolean add(Member vo, Set<Integer> rid) {
		if(this.memberDAO.findById(vo.getMid())==null){//当前要追加不存在
			vo.setRegdate(new Date());
			vo.setSflag(0);// 创建的管理员是普通管理员
			vo.setLocked(0);//新创建的管理员不可能被锁定
			if(this.memberDAO.doCreate(vo)){//实现管理员的追加
				Iterator<Integer>iter=rid.iterator();//迭代输出
				// 随后在所需要向member_role数据表里面保存所有对应的关系
				while(iter.hasNext()){
					 Map<String, Object>map=new HashMap<String, Object>();
					 map.put("mid", vo.getMid());
					 map.put("rid", iter.next());
					this.memberDAO.doCreateMemberAndRole(map);
				 }
				return true;
			}
		}
		return false;
	}
	@RequiresRoles("member")
	@RequiresPermissions("member:edit")
	@Override
	public Map<String, Object> editPre(String mid) {
		  Map<String, Object>map=new HashMap<String, Object>();
		  map.put("allRoles", this.roleDAO.findAll());
		  map.put("memberRoles", this.memberDAO.findAllRoleByMember(mid));
		  map.put("member", this.memberDAO.findById(mid));
		return map;
	}
	@Override
	public boolean edit(Member vo, Set<Integer> rid) {
		if(this.memberDAO.findById(vo.getMid())!=null){//当前要追加存在
		if(this.memberDAO.doUpdate(vo)){//实现数据的更新
			if(this.memberDAO.doRemoveMemberAndRole(vo.getMid())){//删除掉已经存在的关系
				
				Iterator<Integer>iter=rid.iterator();//迭代输出
				// 随后在所需要向member_role数据表里面保存所有对应的关系
				while(iter.hasNext()){
					 Map<String, Object>map=new HashMap<String, Object>();
					 map.put("mid", vo.getMid());
					 map.put("rid", iter.next());
					this.memberDAO.doCreateMemberAndRole(map);
				 }
				return true;
			}  
			
		}
		}
		return false;
	}
	

}
