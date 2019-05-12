<%@ page pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	// request.setCharacterEncoding("UTF-8") ;
%>
<%--
<jsp:include page="/pages/plugins/include_splitpage_search.jsp"/>
--%>
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
<%
	request.setCharacterEncoding("UTF-8") ;
%>
<%
	String url = basePath + (String) request.getAttribute("url") ;
	int currentPage = 1 ;
	int lineSize = 10 ;
	String keyWord = "" ;
	String column = "" ;
	int pageSize = 1 ;
	int allRecorders = 0 ;
%>
<%
	// 将用户输入的参数变为int型赋值给currentPage变量
	try {	// 整个的操作之中唯一可能出现异常的情况就是没有cp参数
		currentPage = (Integer) request.getAttribute("currentPage") ;
	} catch (Exception e) {}
	try {	// 控制每页显示的数据行数
		lineSize = (Integer) request.getAttribute("lineSize") ;
	} catch (Exception e) {}
	try {	// 接收总记录数
		allRecorders = Integer.parseInt(request.getAttribute("allRecorders").toString()) ;
	} catch (Exception e) {}
	column = (String) request.getAttribute("column") ;
	keyWord = (String) request.getAttribute("keyWord") ;
%>
<%
	// 计算总页数
	if (allRecorders > 0) {
		pageSize = (allRecorders + lineSize - 1) / lineSize ;
	}
%>
<div id="splitPageDiv" style="float:right">
	<ul class="pagination pagination-sm"> 
<%
		if (currentPage == 1) {
%>
			<li class="disabled"><span>上一页</span></li>
<%
			if (pageSize > 1) {
%>
				<li class="active"><span>1</span></li>
<%
			}
		} else {
%>
			<li><a href="<%=url%>?cp=<%=currentPage - 1%>&ls=<%=lineSize%>&kw=<%=keyWord%>&col=<%=column%>">上一页</a></li>
			<li class="<%=currentPage == 1 ? "active" : ""%>"><a href="<%=url%>?cp=1&ls=<%=lineSize%>&kw=<%=keyWord%>&col=<%=column%>">1</a></li>
<%
		}
%>
<%
	int seed = 3 ;	// 现在这是一个判断的种子数
	if (pageSize > seed * 2) {	// 总页数很多，需要进行生vle控制
		if (currentPage <= seed * 2) {	// 先显示前面的数据
			for (int x = 2 ; x < currentPage + seed ; x ++) {
%>
				<li class="<%=currentPage == x ? "active" : ""%>"><a href="<%=url%>?cp=<%=x%>&ls=<%=lineSize%>&kw=<%=keyWord%>&col=<%=column%>"><%=x%></a></li>
<%
			}
			if ((currentPage + seed * 2) <= pageSize) {
%>
				<li class="disabled"><span>...</span></li>
<%
			}
		} else {	// 
%>
			<li class="disabled"><span>...</span></li>
<%
			int startPage = currentPage - seed ;
			int endPage = currentPage + seed ;
			for (int x = startPage ; x <= endPage ; x ++) {
				if (x < pageSize) {
%>
					<li class="<%=currentPage == x ? "active" : ""%>"><a href="<%=url%>?cp=<%=x%>&ls=<%=lineSize%>&kw=<%=keyWord%>&col=<%=column%>"><%=x%></a></li>
<%
				}
			}
			if ((currentPage + seed * 2) < pageSize) {	// 后面还有很多页
%>
				<li class="disabled"><span>...</span></li>
<%
			}
		}
	} else {	// 如果没有超过6页，那么就全部显示即可
		for (int x = 2 ; x < pageSize ; x ++) {	// 实现页数的循环输出
%>
			<li class="<%=currentPage == x ? "active" : ""%>"><a href="<%=url%>?cp=<%=x%>&ls=<%=lineSize%>&kw=<%=keyWord%>&col=<%=column%>"><%=x%></a></li>
<%
		}
	}
%>
<%
		if (currentPage == pageSize) {	// 已经到了尾页
%>
			<li class="active"><span><%=pageSize%></span></li>
			<li class="disabled"><span>下一页</span></li>
<%
		} else {
%>			
			<li class="<%=currentPage == pageSize ? "active" : ""%>"><a href="<%=url%>?cp=<%=pageSize%>&ls=<%=lineSize%>&kw=<%=keyWord%>&col=<%=column%>"><%=pageSize%></a></li>
			<li><a href="<%=url%>?cp=<%=currentPage + 1%>&ls=<%=lineSize%>&kw=<%=keyWord%>&col=<%=column%>">下一页</a></li>
<%
		}
%>
	</ul>
</div>