<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/pages/plugins/include_static_head.jsp"%>
<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				<img src="images/mldn-logo.png" class="img-circle"
					alt="User Image">
			</div>
			<div class="pull-left info">
				<p>李兴华</p>
			</div> 
		</div>
		<!-- /.search form -->
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			<li class="header"><i class="fa fa-slack"></i> MLDN报名预约系统</li>
			<li class="${param.role=='member' ? 'active' : ''} treeview"><a href="<%=basePath%>pages/back/index.jsp"> <i
					class="fa fa-group"></i> 
					<span>用户管理</span> <i class="fa fa-angle-left pull-right"></i>
			</a>
				<ul class="treeview-menu"> 
					<li class="${param.action=='member:add' ? 'active' : ''}"><a href="pages/back/member/member_add.jsp"><i class="fa fa-plus-square"></i>
							增加用户</a></li>
					<li class="${param.action=='member:list' ? 'active' : ''}"><a href="pages/back/member/member_list.jsp"><i class="fa fa-list-alt"></i>
							用户列表</a></li>
				</ul></li>
			<li class="${param.role=='news' ? 'active' : ''} treeview"><a href="<%=basePath%>pages/back/index.jsp"> <i class="fa fa-bullhorn"></i>
					<span>公告管理</span> <i class="fa fa-angle-left pull-right"></i>
			</a>
				<ul class="treeview-menu">
					<li class="${param.action=='news:add' ? 'active' : ''}"><a href="pages/back/news/news_add.jsp"><i
							class="fa fa-plus-circle"></i> 发布公告</a></li>
					<li class="${param.action=='news:list' ? 'active' : ''}"><a href="pages/back/news/news_list.jsp?type=list"><i
							class="fa fa-list-ul"></i> 公告列表</a></li>
					<li class="${param.action=='news:unlist' ? 'active' : ''}"><a href="pages/back/news/news_list.jsp?type=unlist"><i
							class="fa fa-archive"></i> 公告草稿箱</a></li>
				</ul></li>
			<li class="${param.role=='bespeak' ? 'active' : ''} treeview"><a href="<%=basePath%>pages/index.jsp"> <i class="fa  fa-slideshare"></i>
					<span>预约报名管理</span> <i class="fa fa-angle-left pull-right"></i>
			</a>
				<ul class="treeview-menu">
					<li class="${param.action=='bespeak:all' ? 'active' : ''}"><a href="pages/back/bespeak/bespeak_list.jsp?type=all"><i
							class="fa fa-laptop"></i> 预约报名列表</a></li>
					<li class="${param.action=='bespeak:new' ? 'active' : ''}"><a href="pages/back/bespeak/bespeak_list.jsp?type=new"><i
							class="fa fa-exclamation-circle"></i> 新的预约报名</a></li>
					<li class="${param.action=='bespeak:wait' ? 'active' : ''}"><a href="pages/back/bespeak/bespeak_list.jsp?type=wait"><i
							class="fa fa-vine"></i> 待处理预约报名</a></li>
					<li class="${param.action=='bespeak:finish' ? 'active' : ''}"><a href="pages/back/bespeak/bespeak_list.jsp?type=finish"><i
							class="fa fa-ticket"></i> 已处理预约报名</a></li>
					<li class="${param.action=='bespeak:invalid' ? 'active' : ''}"><a href="pages/back/bespeak/bespeak_list.jsp?type=invalid"><i
							class="fa fa-trash"></i> 无效预约报名</a></li>
				</ul></li>
		</ul>
	</section>
	<!-- /.sidebar -->
</aside>