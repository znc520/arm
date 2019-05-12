<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/pages/plugins/include_static_head.jsp" %>
<%
	String bespeakAddUrl = basePath + "pages/front/bespeak/add.action" ;
%>
<html>
<head>
<base href="<%=basePath%>">
<jsp:include page="/pages/plugins/include_javascript.jsp" />
<script type="text/javascript" src="js/pages/front/bespeak/bespeak_add.js"></script>
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
					<div class="panel-heading"><strong><span class="glyphicon glyphicon-calendar"></span>&nbsp;访问预约</strong></div>
					<div class="panel-body">
						<div class="alert alert-danger">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<h5><strong><span class="glyphicon glyphicon-warning-sign"></span>&nbsp;请保证资料填写正确！</strong></h5><hr>
							<div>为了确保您能够正常进行访问预约，请确保以下预约资料填写正确！</div>
							<div>在您预约信息提交之后我们会由工作人员和您进行电话联系（010-51283346）！</div>
						</div>
						<form action="<%=bespeakAddUrl%>" id="myform" method="post" class="form-horizontal">
							<div class="form-group" id="nameDiv">
								<label class="col-md-2 control-label" for="name">真实姓名：</label>
								<div class="col-md-5">
									<input type="text" name="name" id="name" class="form-control input-sm" placeholder="请输入您的姓名...">
								</div>
								<div class="col-md-4" id="nameMsg">*</div>
							</div>
							<div class="form-group" id="phoneDiv">
								<label class="col-md-2 control-label" for="phone">联系电话：</label>
								<div class="col-md-5">
									<input type="text" name="phone" id="phone" class="form-control input-sm" placeholder="请输入您的联系电话...">
								</div>
								<div class="col-md-4" id="phoneMsg">*</div>
							</div>
							<div class="form-group" id="schoolDiv">
								<label class="col-md-2 control-label" for="school">毕业院校：</label>
								<div class="col-md-5">
									<input type="text" name="school" id="school" class="form-control input-sm" placeholder="请输入您的毕业院校...">
								</div>
								<div class="col-md-4" id="schoolMsg">*</div>
							</div>
							<div class="form-group" id="eduDiv">
								<label class="col-md-2 control-label" for="edu">最高学历：</label>
								<div class="col-md-5">
									<select id="edu" name="edu" class="form-control">
										<option value="">====== 请选择您的学历 ======</option>
										<option value="1">博士</option>
										<option value="2">硕士</option>
										<option value="2">大学本科</option>
										<option value="2">大学本科</option>
										<option value="2">高中</option>
										<option value="2">初中</option>
										<option value="3">小学</option>
									</select>
								</div> 
								<div class="col-md-4" id="eduMsg">*</div>
							</div>
							<div class="form-group" id="typeDiv">
								<label class="col-md-2 control-label" for="type">预约类型：</label>
								<div class="col-md-5">
									<select id="type" name="type" class="form-control">
										<option value="">====== 请告诉我您的预约类型 ======</option>
										<option value="1">上门访问</option>
										<option value="2">内容咨询</option>
										<option value="2">网络学习</option>
										<option value="2">入学报道</option>
									</select>
								</div> 
								<div class="col-md-4" id="typeMsg">*</div>
							</div>
							<div class="form-group" id="srcDiv">
								<label class="col-md-2 control-label" for="src">信息来源：</label>
								<div class="col-md-5">
									<select id="src" name="src" class="form-control">
										<option value="">====== 您是从那里知道的我们？ ======</option>
										<option value="1">网络</option>
										<option value="2">图书出版物</option>
										<option value="2">朋友介绍</option>
									</select>
								</div> 
								<div class="col-md-4" id="srcMsg">*</div>
							</div>
							<div class="form-group" id="bedateDiv">
								<!-- 定义表单提示文字 -->
								<label class="col-md-2 control-label" for="bedate">到访日期：</label>
								<div class="col-md-5">
									<input type="text" id="bedate" name="bedate" 
										class="form-control input-sm laydate-icon" placeholder="请选择您的的预约日期...">
								</div>
								<!-- 定义表单错误提示显示元素 -->
								<div class="col-md-4" id="bedateMsg">*</div>
							</div>
							<div class="form-group" id="benoteDiv"> 
								<label class="col-md-2 control-label" for="benote">预约留言：</label>
								<div class="col-md-5">
									<textarea rows="6" name="benote" id="benote" class="form-control input-sm" placeholder="请输入您的相关需求..."></textarea>
								</div>
								<div class="col-md-4" id="benoteMsg">*</div>
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
							<div class="form-group">
								<div class="col-md-3 col-md-offset-3">
									<input type="submit" value="预约" class="btn btn-primary">
									<input type="reset" value="重置" class="btn btn-warning">
								</div>
							</div>
						</form>
					</div>
					<div class="panel-footer text-right">
						<span class="glyphicon glyphicon-warning-sign"></span>&nbsp;预约之后我们会有工作人员与您电话联系。
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