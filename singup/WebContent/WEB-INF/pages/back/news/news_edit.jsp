<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/plugins/include_static_head.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<%
	String editNewsUrl = basePath + "admin/news/edit.action" ;
%>
<jsp:include page="/WEB-INF/pages/plugins/include_javascript_head.jsp" />
<script type="text/javascript" src="js/pages/back/news/news_edit.js"></script>
<script type="text/javascript" src="bootstrap/tinymce/tinymce.min.js"></script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<!-- 导入头部标题栏内容 -->
		<jsp:include page="/WEB-INF/pages/plugins/include_title_head.jsp" />
		<!-- 导入左边菜单项 -->
		<jsp:include page="/WEB-INF/pages/plugins/include_menu_item.jsp">
			<jsp:param name="role" value="news"/>
			<jsp:param name="action" value="news:list"/>
		</jsp:include>
		<div class="content-wrapper">
			<div class="panel panel-success">
				<div class="panel-heading">
					<strong><i class="fa fa-file-picture-o"></i>&nbsp;编辑公告</strong>
				</div>
				<div class="panel-body">
					<form action="<%=editNewsUrl%>" id="myform" method="post" class="form-horizontal" enctype="multipart/form-data">
						<div class="form-group" id="titleDiv">
							<label class="col-md-2 control-label" for="title">公告标题：</label>
							<div class="col-md-5">
								<input type="text" name="title" id="title" value="${news.title}" class="form-control input-sm" placeholder="请输入公告标题">
							</div>
							<div class="col-md-4" id="titleMsg">*</div>
						</div>
						<div class="form-group" id="absDiv">
							<label class="col-md-2 control-label" for="abs">公告摘要：</label>
							<div class="col-md-5">
								<input type="text" name="abs" id="abs" value="${news.abs}" class="form-control input-sm" placeholder="请输入公告摘要">
							</div>
							<div class="col-md-4" id="absMsg">*</div>
						</div>
						<div class="form-group" id="dtidDiv">
							<label class="col-md-2 control-label" for="dtid">公告分类：</label>
							<div class="col-md-5">
								<select id="dtid" name="dtid" class="form-control">
									<option value="">====== 请选择欲发布公告类型 ======</option>
									<c:forEach items="${allNewsType}" var="dct">
									<option value="${dct.dtid}" ${news.dtid==dct.dtid ? "selected" : ""}>${dct.title}</option>  
									</c:forEach>
								
								</select>  
							</div> 
							<div class="col-md-4" id="dtidMsg">*</div>s
						</div>
						<div class="form-group" id="picDiv">
							<label class="col-md-2 control-label" for="pic">公告图片：</label>
							<div class="col-md-5">
								<input type="file" name="pic" id="pic" class="form-control input-sm" placeholder="请选择公告所需要的图片">
								<div><img src="upload/news/${news.photo}" style="width:200px;"></div>
							</div>
							<div class="col-md-4" id="picMsg">*</div>
						</div>
						<div class="form-group" id="contentDiv">
							<label class="col-md-2 control-label" for="status">公告内容：</label>
							<div class="col-md-9">
								<textarea id="content" name="content" class="form-control" rows="10">${news.content}</textarea>
							</div>
						</div>
						<div class="form-group" id="flagDiv">
							<label class="col-md-2 control-label" for="flag">公告状态：</label>
							<div class="col-md-5">
								<div class="radio-inline">
									<input type="radio" id="flag" name="flag" ${news.flag==1?"checked":"" } value="1">直接发布
								</div>
								<div class="radio-inline">
									<input type="radio" id="flag" name="flag" ${news.flag==0?"checked":"" } value="0">暂存草稿
								</div>
							</div>
							<span class="col-md-4" id="flagSpan">*</span>
						</div>
						
						<div class="form-group"> 
							<div class="col-md-offset-2 col-md-5">
								<input type="hidden" value="${news.nid}" id="nid" name="nid">
								<input type="hidden" value="${news.photo}" id="photo" name="photo">
								<input type="submit" value="更新" class="btn btn btn-primary">
								<input type="reset" value="重置" class="btn btn btn-warning">
							</div>
						</div>
					</form>
				</div>
				<div class="panel-footer">
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
</body>
</html>
