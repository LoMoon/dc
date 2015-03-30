 <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body>
<%-- <ta:box key="发起订餐" id="f1" cols="2">
<ta:text id="ydc008" key='订餐编号' readOnly="true"></ta:text>
<ta:text id="ydc001" key='餐馆编号' maxLength="100" ></ta:text>
<ta:text id="ydc009" key='订餐开始时间' maxLength="100"></ta:text>
<ta:text id="ydc010" key='订餐结束时间' maxLength="100" ></ta:text>
<ta:text id="ydc098" key='订餐发起人' maxLength="100" ></ta:text>
</ta:box> --%>
<ta:fieldset id="field2">
<ta:datagrid  id="cgxx" forceFitColumns="true" selectType="radio">
<ta:datagridItem id="ydc001" key="餐馆编号"></ta:datagridItem>
<ta:datagridItem id="ydc002" key="餐馆名称"></ta:datagridItem>
</ta:datagrid>
<ta:panel cols="2">
<ta:text id="ydc008" key='订餐编号' readOnly="true"></ta:text>
<ta:text id="ydc009" key='订餐开始时间' readOnly="true"></ta:text>
<ta:date id="ydc010" key='订餐结束时间' datetime="true" showSelectPanel="true"></ta:date>
<ta:text id="ydc098" key='订餐发起人'  readOnly="true"></ta:text>
</ta:panel>
</ta:fieldset>
 <ta:buttonLayout>
 <ta:button id="faqi" key="发起订单" onClick="fnfaqi()"></ta:button>
  <ta:button id="edqi" key="修改订单" onClick="fnedqi()"></ta:button>
</ta:buttonLayout> 
</body>
<script type="text/javascript">
</script>
</html>
<%@ include file="/ta/incfooter.jsp"%>
