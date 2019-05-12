<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/plugins/include_basepath.jsp" %>
<% 
	String loginUrl = basePath + "loginUrl.action" ;
%>
<html>
<head>
<base href="<%=basePath%>">
<jsp:include page="/WEB-INF/pages/plugins/include_javascript.jsp" />
<script type="text/javascript" src="js/pages/login.js"></script>
</head>
<body>
	<div class="container contentback" >
		<div id="navbarDiv" class="row">
			<jsp:include page="/WEB-INF/pages/plugins/include_navbar.jsp"/>
		</div>
		<div id="splitDiv" class="row">
			<div class="col-md-12" style="height:50px;"></div>
		</div>
		<div id="adDiv" class="row">
			<div class="col-md-12 col-xs-12">
				<jsp:include page="/WEB-INF/pages/plugins/include_ad.jsp" />
			</div>
		</div>
		<div id="newsDiv" class="row">
			<div class="col-md-12">
				<div class="panel panel-info">
					<div class="panel-heading"><strong><span class="glyphicon glyphicon-user"></span>&nbsp;内部用户登录</strong></div>
					<div class="panel-body">
						<form action="<%=loginUrl%>" id="myform" method="post" class="form-horizontal">
							<div class="form-group" id="midDiv">
								<label class="col-md-2 control-label" for="mid">登录账号：</label>
								<div class="col-md-5">
									<input type="text" name="mid" id="mid" class="form-control input-sm" placeholder="请输入管理员为您提供的帐号...">
								</div>
								<div class="col-md-4" id="midMsg">*</div>
							</div>
							<div class="form-group" id="passwordDiv">
								<label class="col-md-2 control-label" for="password">登录密码：</label>
								<div class="col-md-5">
									<input type="password" name="password" id="password" class="form-control input-sm" placeholder="请输入登录密码...">
								</div>
								<div class="col-md-4" id="passwordMsg">*</div>
							</div>
							<div class="form-group" id="codeDiv">
								<label class="col-md-2 control-label" for="code">验证码：</label>
								<div class="col-md-3">
									<input type="text" name="code" id="code" class="form-control input-sm" size="4" maxlength="4" placeholder="请输入验证码...">
								</div>
								<div class="col-md-2">
									<img id="imageCode" src="captcha.jpg">
								</div>
								<div class="col-md-4" id="codeMsg">*</div>
							</div>
							<div class="form-group" id="rememberMeDiv">
								<div class="col-md-push-1 checkbox">
									<label class="col-md-2 control-label" for="rememberMe">
										<input type="checkbox" name="rememberMe" id="rememberMe" value="true">&nbsp;下次免登录
									</label>
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-3 col-md-offset-3">
									<input type="submit" value="登录" class="btn btn-primary">
									<input type="reset" value="重置" class="btn btn-warning">
								</div>
							</div>
						</form>
					</div>
					<div class="panel-footer text-right">
						<span class="glyphicon glyphicon-warning-sign"></span>&nbsp;忘记密码，请联系管理员
					</div>
				</div>
			</div>
		</div>
		<div id="footDiv" class="text-left">
			<jsp:include page="/WEB-INF/pages/plugins/include_title_foot.jsp"/>
		</div>
	</div>
</body>
</html>