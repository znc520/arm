package cn.mldn.singup.service.back;

import java.util.List;
import java.util.Map;
import java.util.Set;

import cn.mldn.singup.vo.Member;

public interface IMemberServiceBack {
	/**
	 * 根据用户的id查询出用户的完整数据，调用：IMemberDAO.findById()
	 * @param mid 
	 * @return
	 */
	public Member get(String mid) ;
	/**
	 * 是进行用户对应的角色以及所有的权限数据的查询操作，要调用如下的接口方法：<br>
	 * 1.查询所有的角色：IRoleDAO.findAllRoleFlag();
	 * 2.查询所有的权限：IActionDAO.findAllActionFlag();
	 * @param mid
	 * @return 返回的结果包含如下几个内容：<br>
	 * 1.key=allRoles  value=IRoleDAO.findAllRoleFlag(),set集合
	 * 2.key=allActions value=IActionDAO.findAllActionFlag(),set集合
	 */
	
	public  Map<String, Object>listAuthByMember(String mid);
	/**
	 * 实现密码的修改
	 * @param mid 要修改密码的用户
	 * @param oldPassword 旧密码
	 * @param newPassword 新密码
	 * @return
	 */
	public boolean eidtPassword(String mid,String oldPassword,String newPassword);
	/**
	 * 实现用户的列表显示，调用IMemberDAO.findAll()查询
	 * @return 如果没有数据集合长度为零(size()==0)
	 */
	public List<Member>list();
	/**
	 * 修改指定用户密码操作处理，调用IMemberDAO.doUpdatePasswordByAdmin()方法
	 * @param mid 要修改用户的用户编号
	 * @param password 要修该的用户密码
	 * @return
	 */
	public  boolean editPasswordByAdmin(String mid, String password);
	/**
	 * 实现用户的状态更新处理，调用IMemberDAO.doUpdateLocked()方法
	 * @param mid 要更新的用户编号
	 * @param locked 表示要更新后的状态
	 * @return
	 */
	public  boolean editLocked(String mid, int locked);
	/**
	 * 进行增加前的数据查询操作，本次将执行如下操作<br>
	 * 1.调用IRoleDAO.findAll()取得全部的角色信息
	 * @return 返回的内容包含如下组成<br>
	 * 1key=allRoles ,value=全部角色；
	 */
	public Map<String, Object>addPre();
	/**
	 * 描述数据的追加的操作处理， 本操作将执行如下调用<br>
	 * 1.查询要追加的mid的数据是否存在，调用ImemberDAO.findById()方法
	 * 2.实现数据追加操作。调用 IMemberDAO.doCreate()方法
	 * 3. 调用IMemberDAO.doCreateMemberAndRole()保存用户和角色的关系
	 * @param vo
	 * @param rid
	 * @return
	 */
	public boolean add(Member vo,Set<Integer>rid);
   
	/**
	 * 进行增加前的查询操作，
	 * 1.调用IRoleDAO.findAll() 取得全部的角色信息
	 * 2.调用IMemberDAO.findById()取得指定的用户信息：<br>
	 * 3.调用IMemberDAO。findAllRoleByMember方法取得用户具备的角色信息
	 * @param mid 要更新的用户ID数据
	 * key=allRoles .value=全部的角色
	 * key=memberRoles.value=用户的全部角色编号
	 * key=member value=查询出来的用户信息；<br>
	 * @return
	 */  
	public  Map<String, Object>editPre(String mid);
	/**
	 * 数据追加操作
	 * 1要查询要追加的mid的数据是否存在，调用IMemberDAO.findById()方法
	 * 2.调用IMemberDAO.doUPdate()保存用户信息
	 * 3.调用IMemberDAO.doRemoveMemberAndRole()方法删除掉已经存在的关系、
	 * 4.调用IMemberDAO.doCreateMemberAndRole()保存用户和角色的关系
	 * @param vo
	 * @param rid
	 * @return
	 */
	public boolean edit(Member vo,Set<Integer>rid);

}
