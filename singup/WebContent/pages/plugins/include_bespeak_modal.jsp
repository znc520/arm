<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<div class="modal fade" id="bespeakInfo"  tabindex="-1" aria-labelledby="modalTitle" aria-hidden="true" data-keyboard="true">
	<div class="modal-dialog" style="width: 1000px;">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" type="button" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h3 class="modal-title">
					<span class="glyphicon glyphicon-folder-open"></span>
					<strong>处理“<span id="nameTitleSpan"></span>”报名信息</strong></h3>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-2 text-right"><strong>学生姓名：</strong></div>
					<div id="modalName" class="col-md-10">老李</div>
				</div>
				<div class="row">
					<div class="col-md-2 text-right"><span class="text-right"><strong>联系电话：</strong></span></div>
					<div id="modalPhone" class="col-md-10">110</div>
				</div>
				<div class="row">
					<div class="col-md-2 text-right"><span class="text-right"><strong>信息来源：</strong></span></div>
					<div id="modalSource" class="col-md-10">朋友介绍</div>
				</div>
				<div class="row">
					<div class="col-md-2 text-right"><span class="text-right"><strong>最高学历：</strong></span></div>
					<div id="modalEdu" class="col-md-10">本科</div>
				</div>
				<div class="row">
					<div class="col-md-2 text-right"><span class="text-right"><strong>毕业院校：</strong></span></div>
					<div id="modalSchool" class="col-md-10">MLDN</div>
				</div>
				<div class="row">
					<div class="col-md-2 text-right"><span class="text-right"><strong>填写日期：</strong></span></div>
					<div id="modalIndate" class="col-md-10">2019-10-10</div>
				</div>
				<div class="row">
					<div class="col-md-2 text-right"><span class="text-right"><strong>到访日期：</strong></span></div>
					<div id="modalBedate" class="col-md-10">2020-10-10</div>
				</div>
				<div class="row">
					<div class="col-md-2 text-right"><span class="text-right"><strong>预约备注：</strong></span></div>
					<div class="col-md-10">
						<pre id="modalBenote" class="pre-scrollable" style="height:100px;width:740px;">如果现在使用文本的形式进行数据的传递，那么一定会减少网络上的数据量，尤其是现在的移动时代，网络的成本节约也至关重要，所以以上的格式实际上就属于JSON的数据格式。
	JSON是一种文本数据的交互格式，其格式的基本组成就是按照“key:value”的形式描述的。在进行数据取得的时候只需要根据key就可以取得相应的value数据。
	如果现在使用文本的形式进行数据的传递，那么一定会减少网络上的数据量，尤其是现在的移动时代，网络的成本节约也至关重要，所以以上的格式实际上就属于JSON的数据格式。
	JSON是一种文本数据的交互格式，其格式的基本组成就是按照“key:value”的形式描述的。在进行数据取得的时候只需要根据key就可以取得相应的value数据。
	如果现在使用文本的形式进行数据的传递，那么一定会减少网络上的数据量，尤其是现在的移动时代，网络的成本节约也至关重要，所以以上的格式实际上就属于JSON的数据格式。
	JSON是一种文本数据的交互格式，其格式的基本组成就是按照“key:value”的形式描述的。在进行数据取得的时候只需要根据key就可以取得相应的value数据。</pre>
					</div>
				</div>
				<div class="row">
					<div class="col-md-2 text-right"><span class="text-right"><strong>处理备注：</strong></span></div>
					<div class="col-md-10">
						<pre id="modalNote" class="pre-scrollable" style="height:100px;width:740px;">如果现在使用文本的形式进行数据的传递，那么一定会减少网络上的数据量，尤其是现在的移动时代，网络的成本节约也至关重要，所以以上的格式实际上就属于JSON的数据格式。
	JSON是一种文本数据的交互格式，其格式的基本组成就是按照“key:value”的形式描述的。在进行数据取得的时候只需要根据key就可以取得相应的value数据。
	如果现在使用文本的形式进行数据的传递，那么一定会减少网络上的数据量，尤其是现在的移动时代，网络的成本节约也至关重要，所以以上的格式实际上就属于JSON的数据格式。
	JSON是一种文本数据的交互格式，其格式的基本组成就是按照“key:value”的形式描述的。在进行数据取得的时候只需要根据key就可以取得相应的value数据。
	如果现在使用文本的形式进行数据的传递，那么一定会减少网络上的数据量，尤其是现在的移动时代，网络的成本节约也至关重要，所以以上的格式实际上就属于JSON的数据格式。
	JSON是一种文本数据的交互格式，其格式的基本组成就是按照“key:value”的形式描述的。在进行数据取得的时候只需要根据key就可以取得相应的value数据。</pre>
					</div>
				</div>
				<div class="row">
					<div class="col-md-2 text-right"><span class="text-right"><strong>追加备注：</strong></span></div>
					<div class="col-md-10">
						<form action="" id="myform" method="post" class="form-horizontal" enctype="multipart/form-data">
							<div class="form-group" id="newNoteDiv">
								<div class="col-md-11">
									<textarea id="newNote" name="newNote" class="form-control"></textarea>
								</div>
							</div>
							<div class="form-group"> 
								<div class="col-md-5">
									<input type="hidden" name="currBid" id="currBid">
									<button type="submit" class="btn btn-primary">追加备注</button>
									<button type="reset" class="btn btn-warning">重新填写</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭窗口</button>
			</div>
		</div>
	</div>
</div>
 