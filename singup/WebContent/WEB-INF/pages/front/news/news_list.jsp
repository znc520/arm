<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/plugins/include_static_head.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>s
<html>
<head>
<base href="<%=basePath%>">
<jsp:include page="/WEB-INF/pages/plugins/include_javascript.jsp" />
<script type="text/javascript" src="js/pages/front/news/news_list.js"></script>
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
					<div class="panel-heading"><strong><span class="glyphicon glyphicon-bullhorn"></span>&nbsp;公司要闻</strong></div>
					<div class="panel-body">
						<ul>
						<c:forEach items="${allNews}" var="news"> 
							<li><a href="news/show.action?nid=${news.nid}"><span class="glyphicon glyphicon-exclamation-sign text-danger">【</span>&nbsp;<fmt:formatDate value="${news.pubdate}" pattern="yyyy-MM-dd HH:mm:ss"/>】${news.title}</a></li>
						</c:forEach>
						</ul>
						<jsp:include page="/WEB-INF/pages/plugins/include_splitpage_bar.jsp"/>
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