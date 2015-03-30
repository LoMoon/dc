 <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'demo.jsp' starting page</title>
<%@ include file="/ta/inc.jsp"%>


</head>

<body>
	<ta:box id="b1">
	<ta:text id="ydc002" key="餐馆名称"></ta:text>
	<ta:text id="ydc004" key="餐馆类型"></ta:text>
	</ta:box>
	<ta:buttonGroup>
	<ta:button id='cx' key='查询' onClick="fnquery()"></ta:button>
	</ta:buttonGroup>
	<ta:panel id="p1" key="历史记录">
	<ta:datagrid id="lsjl" fit="true" forceFitColumns="true">
	<ta:datagridItem id="ydc001" key="餐馆编号"></ta:datagridItem>
	<ta:datagridItem id="ydc002" key="餐馆名称"></ta:datagridItem>
	<ta:datagridItem id="ydc004" key="餐馆类型"></ta:datagridItem>
	<ta:datagridItem id="f" key="总订餐数"></ta:datagridItem>
	<ta:datagridItem id="g" key="总价格"></ta:datagridItem>
	</ta:datagrid>
	</ta:panel>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	function fnquery(){
	Base.submit("b1","CtAction!query.do");
	}
</script>

<%@ include file="/ta/incfooter.jsp"%>
