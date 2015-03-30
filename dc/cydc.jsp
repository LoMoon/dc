 <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body>
<ta:fieldset id="field2">
<ta:text id="ydc008" key="订单编号"></ta:text>
<ta:text id="ydc098" key="参与人"></ta:text>
<ta:text id="ydc001" key="餐馆编号"></ta:text>
 <ta:datagrid  id="cdxx" forceFitColumns="true">
<ta:datagridItem id="ydc005" key="食物编号"></ta:datagridItem>
<ta:datagridItem id="ydc006" key="食物名称"></ta:datagridItem>
<ta:datagridItem id="ydc007" key="食物价格"></ta:datagridItem>
<ta:datagridItem id="ydc097" key="份数">
<ta:datagridEditor type="selectInput" data="[{'id':1,'name':'1','py':'1'},{'id':2,'name':'2','py':'2'},{'id':3,'name':'3','py':'2'},{'id':4,'name':'4','py':'2'}]">
</ta:datagridEditor>
</ta:datagridItem>

</ta:datagrid>
</ta:fieldset>
 <ta:buttonLayout>
 <ta:button id="cydd" key="参与订单" onClick="cydd()"></ta:button>
</ta:buttonLayout> 
</body>
<script type="text/javascript">
</script>
</html>
<%@ include file="/ta/incfooter.jsp"%>
