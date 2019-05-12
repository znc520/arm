package cn.mldn.singup.dao;

import java.util.List;
import java.util.Set;

import cn.mldn.singup.vo.Role;

public interface IRoleDAO {
 public Set<String>findAllRoleFlag(String mid);   
 /**
  * 实现所有的角色信息查询显示
  * @return
  */
 public List<Role>findAll();
}
 