package cn.mldn.singup.dao;

import java.util.List;
import java.util.Map;
import java.util.Set;

import cn.mldn.singup.vo.Member;

public interface IMemberDAO {
	/** 
	 * 根据id实现member数据的查询过程
	 * @param mid 要查询的mid的数据
	 * @return
	 */
	public Member findById(String mid) ;
	/**
	 * 进行用户的密码修改
	 * @param params
	 * key=mid value=要修改的用户编
	 * key=newPassword,value=加密后的新密码
	 * @return 修改成功返回true,否则返回fasle
	 */
	public boolean doUpdatePassword(Map<String, Object>params);
	/**
	 * 查询全部的用户数据
	 * @return
	 */
	public List<Member>findAll();
	/**
	 *  实现用户的密码变更，但是不会变更超级管理员的密码
	 * @param params 要进行变更的数据，包含有一下内容：<br>
	 * key=mid, value=要修改的雇员编号；
	 * key=password value=要更新的密码（已经加过密）
	 * @return
	 */
	public  boolean doUpdatePasswordByAdmin(Map<String, Object>params);
	/**
	 * 进行用户锁定状态的更新操作，锁定状态<br>
	 * 1.locked=0,表示该用户属于活跃用户，不锁定
	 * 2.locked=1，表示该用户被锁定，无法登陆
	 * @param params
	 * key=mid, value=要更新新用户的id
	 * key=locked value=表示锁定状态
	 * @return
	 */
	public  boolean doUpdateLocked(Map<String, Object>params);
	
	/**
	 * 实现用户的追加处理，所有的追加用户的锁定状态都应该是活跃的
	 * @param vo
	 * @return
	 */
	public boolean doCreate (Member vo);
	/**
	 * 实现member_role数据表的保存
	 * @param params 包含有两类数据：<br>
	 * key=mid,value=用户ID;<br>
	 * key=rid,value=角色id；
	 * @return
	 */
	public boolean doCreateMemberAndRole (Map<String, Object>params);
	/**
	 * 实现用户的更新处理
	 * @param vo
	 * @return
	 */
	public boolean doUpdate(Member vo);
	/**
	 * 取得一个用户对应的所有角色编号
	 * @param mid
	 * @return
	 */
	public Set<Integer>findAllRoleByMember(String mid);
	/**
	 * 更新前前删除掉所有member_role与此用户有关系的数据信息
	 * @param mid
	 * @return
	 */
	public boolean doRemoveMemberAndRole(String mid);
	
}
