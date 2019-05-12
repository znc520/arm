<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/pages/plugins/include_static_head.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<jsp:include page="/pages/plugins/include_javascript_head.jsp" />
<script type="text/javascript" src="js/pages/back/bespeak/bespeak_list.js"></script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<!-- 导入头部标题栏内容 -->
		<jsp:include page="/pages/plugins/include_title_head.jsp" />
		<!-- 导入左边菜单项 -->
		<jsp:include page="/pages/plugins/include_menu_item.jsp">
			<jsp:param name="role" value="bespeak"/>
			<jsp:param name="action" value="bespeak:${param.type}"/>
		</jsp:include>
		<div class="content-wrapper">
			<div class="panel panel-success">
				<div class="panel-heading">
					<c:if test="${param.type == 'all'}">
						<strong><i class="fa fa-laptop"></i>&nbsp;全部预约报名信息</strong>
					</c:if>
					<c:if test="${param.type == 'new'}">
						<strong><i class="fa fa-exclamation-circle"></i>&nbsp;新的预约报名信息</strong>
					</c:if>
					<c:if test="${param.type == 'wait'}">
						<strong><i class="fa fa-vine"></i>&nbsp;待处理预约报名信息</strong>
					</c:if>
					<c:if test="${param.type == 'finish'}">
						<strong><i class="fa fa-ticket"></i>&nbsp;已处理预约报名信息</strong>
					</c:if>
					<c:if test="${param.type == 'invalid'}">
						<strong><i class="fa fa-trash"></i>&nbsp;无效预约报名信息</strong>
					</c:if>
				</div>
				<div class="panel-body">
					<jsp:include page="/pages/plugins/include_splitpage_search.jsp"/>
					<table class="table table-hover">
						<tr>
							<th width="20%" class="text-center">姓名</th> 
							<th width="20%" class="text-center">电话</th>
							<th width="20%" class="text-center">信息来源</th>
							<th width="10%" class="text-center">学历</th>
							<th width="10%" class="text-center">毕业院校</th>
							<th width="10%" class="text-center">提交日期</th>
							<th width="10%" class="text-center">处理状态</th>
						</tr>
						<tr>
							<td class="text-center"><a id="showBespeakInfo-1">老李</a></td>
							<td class="text-center">110</td>
							<td class="text-center">朋友推荐</td>
							<td class="text-center">小学</td>
							<td class="text-center">MLDN</td>
							<td class="text-center">2019-10-10</td>
							<td class="text-center">未处理</td>
						</tr>
					</table>
					<jsp:include page="/pages/plugins/include_splitpage_bar.jsp"/>
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
	<jsp:include page="/pages/plugins/include_bespeak_modal.jsp"/>
	<jsp:include page="/pages/plugins/include_javascript_foot.jsp" />
</body>
</html>
