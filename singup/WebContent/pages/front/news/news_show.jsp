<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/pages/plugins/include_static_head.jsp" %>
<html>
<head>
<base href="<%=basePath%>">
<jsp:include page="/pages/plugins/include_javascript.jsp" />
<script type="text/javascript" src="js/pages/front/news/news_show.js"></script>
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
					<div class="panel-heading"><strong><span class="glyphicon glyphicon-bullhorn"></span>&nbsp;信息查看</strong></div>
					<div class="panel-body">
						<div class="text-center h2">我们牛逼了</div>
						<div class="text-primary"><strong>新闻摘要：</strong>总之我们很牛逼了。</div>
						<div class="text-primary"><strong>发布日期：</strong>2010-10-10</div>
						<div>
							<pre class="pre-scrollable" style="height:300px;">如果现在使用文本的形式进行数据的传递，那么一定会减少网络上的数据量，尤其是现在的移动时代，网络的成本节约也至关重要，所以以上的格式实际上就属于JSON的数据格式。
	JSON是一种文本数据的交互格式，其格式的基本组成就是按照“key:value”的形式描述的。在进行数据取得的时候只需要根据key就可以取得相应的value数据。
	如果现在使用文本的形式进行数据的传递，那么一定会减少网络上的数据量，尤其是现在的移动时代，网络的成本节约也至关重要，所以以上的格式实际上就属于JSON的数据格式。
	JSON是一种文本数据的交互格式，其格式的基本组成就是按照“key:value”的形式描述的。在进行数据取得的时候只需要根据key就可以取得相应的value数据。
	如果现在使用文本的形式进行数据的传递，那么一定会减少网络上的数据量，尤其是现在的移动时代，网络的成本节约也至关重要，所以以上的格式实际上就属于JSON的数据格式。
	JSON是一种文本数据的交互格式，其格式的基本组成就是按照“key:value”的形式描述的。在进行数据取得的时候只需要根据key就可以取得相应的value数据。</pre>
							
						</div>
					</div>
					<div class="panel-footer">
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