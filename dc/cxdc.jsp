 <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'demo.jsp' starting page</title>
<%@ include file="/ta/inc.jsp"%>


</head>

<body>
	<ta:fieldset id="field1">
	<ta:text id="ydc002" key="餐馆名称"></ta:text>
	<ta:text id="ydc004" key="餐馆类型"></ta:text>
	</ta:fieldset>
	<ta:buttonLayout>
		 <ta:button id="ydc" key="查询所有订单" onClick="fnCx()"></ta:button>
		 <ta:button id="ydc1" key="查询今日订单" onClick="fnCxto()"></ta:button>
		 <ta:button id="xz" key="发起订单" onClick="fnFq()"></ta:button>
	</ta:buttonLayout>
	<ta:panel key="订餐信息" fit="true">
		<ta:datagrid id="dcxx" forceFitColumns="true" enableColumnMove="true" fit="true" rowColorfn="fnColor" haveSn="true" onRowDBClick="cxmx" groupingBy="ydc011">
		<ta:datagridItem  key="响应" icon="icon-add" click="answer" width="25"></ta:datagridItem> 
		<ta:datagridItem  key="编辑" icon="icon-edit" click="edit" width="25"></ta:datagridItem> 
		<ta:datagridItem  key="删除" icon="icon-remove" click="deletedd" width="25"></ta:datagridItem> 
		<ta:datagridItem  key="提交" icon="icon-ok" click="uploading" width="25"></ta:datagridItem>
		<ta:datagridItem  key="关闭" icon="icon-cancel" click="canc" width="25"></ta:datagridItem>
		<ta:datagridItem id="ydc008" key="订单流水号"></ta:datagridItem>
		<ta:datagridItem id="ydc001" key="餐馆编号"></ta:datagridItem>
		<ta:datagridItem id="ydc002" key="餐馆名称"></ta:datagridItem>
		<ta:datagridItem id="ydc009" key="订餐开始时间" sortable="true"></ta:datagridItem>
		<ta:datagridItem id="ydc010" key="订餐截至时间"></ta:datagridItem>
		<ta:datagridItem id="ydc011" key="订餐状态" collection="ydc011"></ta:datagridItem>
		<ta:datagridItem id="name" key="订餐发起人"></ta:datagridItem>
		<ta:datagridItem id="ydc098" key="订餐发起人编号"></ta:datagridItem>
		<ta:datagridItem id="ydc012" key="订餐合计费用"></ta:datagridItem>
		</ta:datagrid>
		
	</ta:panel>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	function fnCx(){
	Base.submit("field1","CheckAction!query.do");
	}
	function fnFq(){
	Base.openWindow("newwin1","发起订餐","CheckAction!addfq.do",null,600,400);
	}
	function fnfaqi(){
	var ctbm = Base.getValue("ydc010");
	Base.submit("cgxx","CheckAction!faqi.do?ydc010="+ctbm,null,null,null,fnCallB);
	}
	function answer(data,e){
	if(Date.parse(data.ydc010)<Date.parse(Date())){
	alert("订餐已关闭");
	}
	else if(data.ydc011=='2'||data.ydc011=='3'){
	 alert("订餐已关闭");
	 }
	else {
	Base.openWindow("newwin2","参与选菜","CheckAction!checkCd.do?ydc008="+data.ydc008+"&ydc001="+data.ydc001,null,600,400);
	}
	}
	function cydd(){
	var ydc008 = Base.getValue("ydc008");
	var ydc098 = Base.getValue("ydc098");
	Base.submit("cdxx","CheckAction!cyDd.do?ydc098="+ydc098+"&ydc008="+ydc008,null,null,null,fnCallC); 
	}
	function edit(data,e){
	Base.openWindow("newwin3","修改订餐","CheckAction!edit.do?ydc008="+data.ydc008+"&ydc098="+data.ydc098,null,600,400);
	}
	function fnedqi(){
	var ctbm = Base.getValue("ydc010");
	var ydc008=Base.getValue("ydc008");
	Base.submit("cgxx","CheckAction!xgdd.do?ydc010="+ctbm+"&ydc008="+ydc008,null,null,null,fnCall);
	}
	function deletedd(data,e){
	Base.submit("dcxx","CheckAction!deletedd.do?ydc008="+data.ydc008+"&ydc098="+data.ydc098,null,null,null,fnCx); 
	}
	function fnCall(){
	Base.closeWindow('newwin3');
	fnCx();
	}
	function fnCxto(){
	Base.submit("field1","CheckAction!queryTo.do");
	}
	function fnCallB(){
	Base.closeWindow('newwin1');
	fnCxto();
	}
	function fnCallC(){
	Base.closeWindow('newwin2');
	fnCxto();
	}
	function fnColor(data){
	
	 if(Date.parse(data.ydc010)<Date.parse(Date())) return "pink";
	else return "white"; 
	
	}
	function uploading(data,e){
	if(Date.parse(data.ydc010)>Date.parse(Date()))
	Base.submit("dcxx","CheckAction!callPrc.do?ydc008="+data.ydc008);
	else alert("订单已关闭");
	}
	
	function cxmx(e,rowdata){
	Base.openWindow("newwin4","查询明细","CheckAction!checkmx.do?ydc008="+rowdata.ydc008+"&ydc098="+rowdata.ydc098,null,600,300);
	}
	function canc(data,e){
	Base.submit("dcxx","CheckAction!cancel.do?ydc008="+data.ydc008+"&ydc098="+data.ydc098,null,null,null,fnCx);
	}
</script>

<%@ include file="/ta/incfooter.jsp"%>
