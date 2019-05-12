<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/plugins/include_static_head.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<jsp:include page="/WEB-INF/pages/plugins/include_javascript_head.jsp" />
<script type="text/javascript" src="js/pages/back/member/member_list.js"></script>
</head>
<%
	String editMemberUrl = basePath + "admin/member/editPre.action" ;
%>
<body class="hold-transition skin-blue sidebar-mini">    
	<div class="wrapper">
		<!-- 导入头部标题栏内容 -->
		<jsp:include page="/WEB-INF/pages/plugins/include_title_head.jsp" />
		<!-- 导入左边菜单项 -->
		<jsp:include page="/WEB-INF/pages/plugins/include_menu_item.jsp">
			<jsp:param name="role" value="member"/>
			<jsp:param name="action" value="member:list"/>
		</jsp:include>
		<div class="content-wrapper">
			<div class="panel panel-success">
				<div class="panel-heading">
					<strong><i class="fa fa-list"></i>&nbsp;管理员账户列表</strong>
				</div>
				<div class="panel-body">
					<table class="table table-hover">
						<tr>
							<th width="40%">登录帐号</th>
							<th width="10%">姓名</th>
							<th width="20%">注册日期</th>
							<th width="10%">当前状态</th>
							<th colspan="3" width="20%">操作</th>
						</tr>
						<c:forEach items="${allMembers}" var="member"> 
						<tr>
							<td id="mid-${member.mid}">${member.mid}</td>
							<td id="name-${member.name}">${member.name}</td>
							<td id="regdate-${member.mid}"><fmt:formatDate value="${member.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td id="status-${member.mid}">
							<c:if test="${member.locked==0}">
							<span class="text-success">活跃</span>
							</c:if>
							<c:if test="${member.locked==1}">
							<span class="text-danger">活跃</span>
							</c:if>
							</td>
							<td><input type="button" id="changeBut-${member.mid}" name="changeBut-${member.mid}" value="修改密码" class="btn btn-xs btn-default">
							<shiro:hasPermission name="member:edit">
							<a href="<%=editMemberUrl%>?mid=${member.mid}" id="edit-${member.mid}" name="edit-${member.mid}" class="btn btn-xs btn-primary">编辑</a>
							
							</shiro:hasPermission>
							<input type="button" id="lockBut-${member.mid}-${member.locked}" name="lockBut-${member.mid}-${member.locked}"  value="${member.locked==1?  '激活用户':'锁定用户'}" class="btn btn-xs ${member.locked==1?'btn-success':'btn-danger'}">
							</td>
						</tr>
						</c:forEach>
					</table>
				</div>
				<div class="panel-footer" style="height:80px;">
					<jsp:include page="/WEB-INF/pages/plugins/include_alert.jsp"/>
				</div>
			</div>
		</div>
		<!-- 导入公司尾部认证信息 -->
		<jsp:include page="/WEB-INF/pages/plugins/include_title_foot.jsp" />
		<!-- 导入右边工具设置栏 -->
		<jsp:include page="/WEB-INF/pages/plugins/include_menu_sidebar.jsp" />
		<div class="control-sidebar-bg"></div>
	</div>
	<jsp:include page="/WEB-INF/pages/plugins/include_javascript_foot.jsp" />
	<div class="modal fade" id="memberPasswordInfo"  tabindex="-1" aria-labelledby="modalTitle" aria-hidden="true" data-keyboard="true">
		<div class="modal-dialog" style="width: 700px;">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" type="button" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h3 class="modal-title">
						<span class="glyphicon glyphicon-folder-open"></span>
						<strong>修改“<span id="midTitleSpan"></span>”用户密码</strong></h3>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							<form id="myform" method="post" class="form-horizontal">
								<div class="form-group" id="passwordDiv">
									<label class="col-md-2 control-label" for="password">新的密码：</label>
									<div class="col-md-5">
										<input type="text" name="password" id="password" class="form-control input-sm" placeholder="请输入雇员真实姓名">
									</div>
									<div class="col-md-4" id="passwordMsg">*</div>
								</div>
								<div class="form-group"> 
									<div class="col-md-offset-2 col-md-5">
										<input type="hidden" id="cpmid" name="cpmid" value="">
										<input type="submit" value="修改密码" class="btn btn btn-primary btn-xs">
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭窗口</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
