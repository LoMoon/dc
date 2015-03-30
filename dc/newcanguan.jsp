 <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body>
<ta:box key="新增餐厅" id="f2" cols="2">
<ta:text id="ydc001" key='餐厅编号' ></ta:text>
<ta:text id="ydc002" key='餐馆名称' required="true" maxLength="100" ></ta:text>
<ta:text id="ydc003" key='餐馆地址' maxLength="100"></ta:text>
<ta:text id="ydc004" key='餐馆类型 ' required="true" maxLength="10"></ta:text>
<ta:text id="ydc099" key="餐馆电话"required="true" maxLength="100"></ta:text>
</ta:box>
 <ta:buttonLayout>
<ta:button key='保存' onClick="fnSave()"></ta:button>
<ta:button key="修改" onClick="fnEdit()"></ta:button> 
<ta:button key='菜单导入'></ta:button>
</ta:buttonLayout> 
<ta:panel key="餐厅菜单信息">
		<ta:datagrid id="cdxx" fit="true" forceFitColumns="true" enableColumnMove="true" selectType="checkbox" onRowDBClick="clickfn">
			<ta:datagridItem id="ydc005" key="食物编码" sortable="true"  ></ta:datagridItem>
			<ta:datagridItem id="ydc006" key="食物名称" sortable="true" ></ta:datagridItem>
			<ta:datagridItem id="ydc007" key="食物单价"   sortable="true"></ta:datagridItem>
		</ta:datagrid>
	</ta:panel>
</body>
<script type="text/javascript">
	
</script>
</html>
<%@ include file="/ta/incfooter.jsp"%>
