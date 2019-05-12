<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/pages/plugins/include_basepath.jsp" %>
<%
	String loginUrl = basePath + "pages/shiroLogin.action" ;
%>
<html>
<head>
<base href="<%=basePath%>">
<jsp:include page="/pages/plugins/include_javascript.jsp" />
<script type="text/javascript" src="js/pages/login.js"></script>
</head>
<body>
	<div class="container contentback" >
		<div id="navbarDiv" class="row">
			<jsp:include page="/pages/plugins/include_navbar.jsp"/>
		</div>
		<div id="splitDiv" class="row">
			<div class="col-md-12" style="height:50px;"></div>
		</div>
		<div id="adDiv" class="row">
			<div class="col-md-12 col-xs-12">
				<jsp:include page="/pages/plugins/include_ad.jsp" />
			</div>
		</div>
		<div id="newsDiv" class="row">
			<div class="col-md-12">
				<div class="panel panel-info">
					<div class="panel-heading"><strong><span class="glyphicon glyphicon-user"></span>&nbsp;内部用户登录</strong></div>
					<div class="panel-body">
						<div>
							<div>${msg}</div>
							<div><span id="mytime">2</span>秒后跳转到<a href="<%=basePath%>${url}">首页</a>！</div>
						</div>
						<script type="text/javascript">
							var goUrl = "<%=basePath%>${url}" ;
							goTime() ; 
						</script>
					</div>
					<div class="panel-footer text-right">
						<span class="glyphicon glyphicon-warning-sign"></span>&nbsp;忘记密码，请联系管理员
					</div>
				</div>
			</div>
		</div>
		<div id="footDiv" class="text-left">
			<jsp:include page="/pages/plugins/include_title_foot.jsp"/>
		</div>
	</div>
</body>
</html>