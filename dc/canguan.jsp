 <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'demo.jsp' starting page</title>
<%@ include file="/ta/inc.jsp"%>


</head>

<body>
	<ta:fieldset cols="3" id="f1">
		<ta:text id="aab001" key="餐厅编号"></ta:text>
		<ta:text id="aab002" key="餐厅名称"></ta:text>
		<ta:text id="aab003" key="餐厅类型"></ta:text>	
	</ta:fieldset>
	<ta:buttonLayout>
		 <ta:button key="查询[Q]" hotKey="q" onClick="fnquery()"></ta:button> 
		 <ta:button key="新增[N]" hotKey="N" onClick="fnAdd()"></ta:button>
		  <ta:button key='删除多选项' onClick="fnDelAll()"></ta:button> 
	</ta:buttonLayout>
	<ta:panel key="餐厅信息">
		<ta:datagrid id="cgxx" fit="true" forceFitColumns="true" enableColumnMove="true" selectType="checkbox" onRowDBClick="clickfn">
		<ta:datagridItem  key="编辑" icon="icon-edit" click="fnClick"  width="25"></ta:datagridItem> 
		<ta:datagridItem  key="删除" icon="icon-remove" click="fnDelete" width="25"></ta:datagridItem> 
			<ta:datagridItem id="ydc001" key="餐厅编号" sortable="true"  ></ta:datagridItem>
			<ta:datagridItem id="ydc002" key="餐厅名称" sortable="true" ></ta:datagridItem>
			<ta:datagridItem id="ydc003" key="餐馆地址"   sortable="true"></ta:datagridItem>
			<ta:datagridItem id="ydc004" key="餐馆类型"  sortable="true"></ta:datagridItem>
			<ta:datagridItem id="ydc099" key="餐馆电话"   sortable="true"></ta:datagridItem>
		</ta:datagrid>
	</ta:panel>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	function fnquery()
	{
		Base.submit('f1','OrderAction!query.do');
	}
	function fnAdd()
	{
		Base.openWindow("newwin","新增餐馆","OrderAction!addRes.do",null,600,300);
	}
	function fnSave(){
		Base.submit('f2','OrderAction!save.do');
	}
	function fnClick(data,e){
		Base.openWindow("newwin2","修改餐馆","OrderAction!toUpdate.do?ydc001="+data.ydc001,null,400,300);
	}
	function fnEdit(){
		Base.submit('f2','OrderAction!edit.do');
	}
	function fnDelete(data,e){
		
		Base.submit('cgxx',"OrderAction!delet.do?ydc001="+data.ydc001); 
		
	}
	function fnDelAll(){
	/* Base.submit('f1','t0101Action!clearAll.do'); */
	 Base.submit('cgxx','OrderAction!deleteAll.do');		
	}
	function clickfn(e,rowdata){
	Base.openWindow("newwin2","查询菜单","OrderAction!checkcd.do?ydc001="+rowdata.ydc001,null,600,300);
	}
	function cxcd(){
	Base.submit('f3','OrderAction!querycd.do');
	}
	function fnClickCd(){
	Base.openWindow("newwin3","修改菜单","OrderAction!toUpdateCd.do?ydc005="+data.ydc005,null,400,300);
	}
	function xzcd(){
	var ctbm = Base.getValue("ydc001");
	Base.openWindow("newwin4","新增餐馆","OrderAction!addCd.do?ydc001_="+ctbm,null,600,300);
	}
	function saveCd(){
	Base.submit('f4','OrderAction!savecd.do');
	}
	function fnClickCd(data,e){
		Base.openWindow("newwin5","修改菜单","OrderAction!toUpdateCd.do?ydc005="+data.ydc005,null,400,300);
	}
	function fnEditCd(){
	Base.submit('f4','OrderAction!editCd.do');
	}
	function fnDeleteCd(data,e){
	Base.submit('cdxx',"OrderAction!deletCd.do?ydc005="+data.ydc005); 
	}
	function Sace(data,e){
	Base.submit("f3","OrderAction!savefu.do?ydc001="+data.ydc001);
	}
</script>

<%@ include file="/ta/incfooter.jsp"%>
