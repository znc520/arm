<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/pages/plugins/include_static_head.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<jsp:include page="/pages/plugins/include_javascript_head.jsp" />
<script type="text/javascript" src="js/pages/back/member/member_list.js"></script>
</head>
<%
	String editMemberUrl = basePath + "pages/back/member/member_edit.jsp" ;
%>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<!-- 导入头部标题栏内容 -->
		<jsp:include page="/pages/plugins/include_title_head.jsp" />
		<!-- 导入左边菜单项 -->
		<jsp:include page="/pages/plugins/include_menu_item.jsp">
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
						<tr>
							<td id="mid-admin">admin</td>
							<td id="name-admin">老张</td>
							<td id="regdate-admin">2019-10-10 19:18:27</td>
							<td id="status-admin">活跃</td>
							<td><input type="button" id="changeBut-admin" name="changeBut-admin" value="修改密码" class="btn btn-xs btn-default"></td>
							<td><input type="button" id="edit-admin" name="edit-admin" value="编辑" class="btn btn-xs btn-primary"></td>
							<td><input type="button" id="statusBut-admin-lock" name="lockBut-admin" value="锁定账户" class="btn btn-xs btn-danger"></td>
						</tr>
						<tr>
							<td id="mid-mermaid">mermaid</td>
							<td id="name-mermaid">老李</td>
							<td id="regdate-mermaid">2019-10-10 19:18:27</td>
							<td id="status-mermaid">锁定</td>
							<td><input type="button" id="changeBut-mermaid" name="changeBut-mermaid" value="修改密码" class="btn btn-xs btn-default"></td>
							<td><input type="button" id="edit-mermaid" name="edit-mermaid" value="编辑" class="btn btn-xs btn-primary"></td>
							<td><input type="button" id="statusBut-mermaid-active" name="lockBut-mermaid" value="激活账户" class="btn btn-xs btn-danger"></td>
						</tr>
					</table>
				</div>
				<div class="panel-footer" style="height:80px;">
					<jsp:include page="/pages/plugins/include_alert.jsp"/>
				</div>
			</div>
		</div>
		<!-- 导入公司尾部认证信息 -->
		<jsp:include page="/pages/plugins/include_title_foot.jsp" />
		<!-- 导入右边工具设置栏 -->
		<jsp:include page="/pages/plugins/include_menu_sidebar.jsp" />
		<div class="control-sidebar-bg"></div>
	</div>
	<jsp:include page="/pages/plugins/include_javascript_foot.jsp" />
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
