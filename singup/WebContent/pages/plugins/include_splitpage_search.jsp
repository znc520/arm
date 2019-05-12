<%@ page pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	// request.setCharacterEncoding("UTF-8") ;
%>
<%
	request.setCharacterEncoding("UTF-8") ;
%>
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
<%--
<jsp:include page="/pages/plugins/include_splitpage_bar.jsp"/>
--%>
<%
	String url = basePath + (String) request.getAttribute("url") ;
	String allRecorders = "0" ;
	String columnData = (String) request.getAttribute("columnData") ;
	// if (columnData == null) {
		// columnData = "姓名 - 测试:name|邮箱 - 测试:email" ;
	// }
	String column = (String) request.getAttribute("column") ;
	String keyWord = (String) request.getAttribute("keyWord") ;
	try {
		allRecorders = request.getAttribute("allRecorders").toString() ;
	} catch (Exception e) {}
%>
<div id="searchDiv">
	<form action="<%=url%>" method="post" class="form-horizontal">
		<div class="form-group">
<%		// 现在columnData变量有内容
		if (!(columnData == null || "".equals(columnData))) {
			String result [] = columnData.split("\\|") ;	// 拆分
%>
			<div class="col-md-3 col-md-offset-2">
			<select id="col" name="col" class="form-control">
<%
				for (int x = 0 ; x < result.length ; x ++) {
					String temp [] = result[x].split(":") ;
%>
					<option value="<%=temp[1]%>" <%=temp[1].equals(column) ? "selected" : ""%>><%=temp[0]%></option>
<%
				}
%>
			</select>
			</div>
<%  
		}
%>
			<div class="col-md-5">
				<input type="text" name="kw" id="kw" class="form-control" placeholder="请输入检索关键字" value="<%=keyWord == null ? "" : keyWord%>">
				<span class="h5">本次查询一共返回有“<span class="text-danger"><%=allRecorders%></span>”行记录！</span>
			</div>
			<div class="col-md-2">
				<input type="submit" value="检索" class="btn btn-primary">
			</div>
		</div>
	</form>
</div>