 <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body>
<ta:box key="新增餐厅" id="f4" cols="1">
<ta:text id="ydc005" key='食物编号'></ta:text>
<ta:text id="ydc006" key='食物名称' required="true" maxLength="100" ></ta:text>
<ta:text id="ydc007" key='食物价格' maxLength="100"></ta:text>
<ta:text id="ydc001_" key='餐厅编号' maxLength="100" ></ta:text>
</ta:box>
 <ta:buttonLayout>
 <ta:button key="保存" id="save" onClick="saveCd()"></ta:button>
 <ta:button key="修改" id="edit" onClick="fnEditCd()"></ta:button> 
</ta:buttonLayout> 
</body>
<script type="text/javascript">
</script>
</html>
<%@ include file="/ta/incfooter.jsp"%>
