<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/plugins/include_static_head.jsp" %>
<html>
<head>
<base href="<%=basePath%>">
<jsp:include page="/WEB-INF/pages/plugins/include_javascript.jsp" />
<script type="text/javascript" src="js/pages/front/news/news_show.js"></script>
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
					<div class="panel-heading"><strong><span class="glyphicon glyphicon-bullhorn"></span>&nbsp;信息查看</strong></div>
					<div class="panel-body">
						<div class="text-center h2">${news.title}</div>
						<div class="text-primary"><strong>新闻摘要：</strong>${news.abs}</div>
						<div class="text-primary"><strong>发布日期：</strong><fmt:formatDate value="${news.pubdate}" pattern="yyyy-MM-dd"/></div>
						<div>
							<pre class="pre-scrollable" style="height:300px;">
								<div><img src="upload/news/${news.photo}" ></div>
								<div>${news.content}</div>
							</pre>
						</div>
					</div>
					<div class="panel-footer">
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