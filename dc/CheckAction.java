package com.yinhai.peixun.action.培训材料.API文档;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;

import com.yinhai.peixun.domain.Dc01Domain;
import com.yinhai.peixun.domain.Dc03Domain;
import com.yinhai.peixun.domain.Dc04Domain;
import com.yinhai.px.service.OrderService;
import com.yinhai.sysframework.app.domain.Key;
import com.yinhai.sysframework.dto.ParamDTO;
import com.yinhai.sysframework.dto.PrcDTO;
import com.yinhai.webframework.BaseAction;
@Namespace("/dc")
@Action(value="CheckAction",results={
		@Result(name="success",location="/dc/cxdc.jsp"),
		@Result(name="cydc",location="/dc/cydc.jsp"),
		@Result(name="editdd",location="/dc/addFq.jsp"),
		@Result(name="cxmx",location="/dc/cxmx.jsp"),
		@Result(name="addfq",location="/dc/addFq.jsp")	
		})
public class CheckAction extends BaseAction
{
	private OrderService service = (OrderService) getService("orderService");
	public String execute() throws Exception{
		return SUCCESS;
	}
	public String query() throws Exception{
		ParamDTO dto=getDto();
		dto.put("flag", "Dc03");
		List list=getDao().queryForList("dc03.getList3",dto);
		setList("dcxx",list);														
		return JSON;
	}
	public String queryTo() throws Exception{
		ParamDTO dto=getDto();
		dto.put("flag", "Dc03");
		Date date = new Date();
		List list=getDao().queryForList("dc03.getList4",dto);
		setList("dcxx",list);
		
		return JSON;
	}
	public String addfq() throws Exception{
		ParamDTO dto=getDto();
		dto.put("flag", "Dc01");
		List list=getDao().queryForList("dc01.getList",dto);
		setList("cgxx",list);
		return "addfq";
	}
	public String faqi() throws Exception{
		ParamDTO dto=getDto();
		dto.put("ydc010", request.getParameter("ydc010"));
		List list = getSelected("cgxx");
		Key  key = (Key) list.get(0);
		dto.put("ydc001",key.get("ydc001"));
		Long ydc098 = getDto().getUserInfo().getUserid();
		dto.put("ydc098", ydc098);
		service.addFq(dto);
		return JSON;
	}
	public String checkCd() throws Exception{
		ParamDTO dto = getDto();
		dto.put("ydc008", request.getParameter("ydc008"));
		Dc03Domain domain = (Dc03Domain) getDao().queryForObject("dc03.get",dto);
		setData(domain.toMap(),false);
		ParamDTO dto1= getDto();
		dto1.put("ydc001", request.getParameter("ydc001"));
		List list=getDao().queryForList("dc02.get1",dto1);
		setList("cdxx",list);
		return "cydc";
	}
	public String cyDd() throws Exception{
		ParamDTO dto=getDto();
		dto.put("ydc098", request.getParameter("ydc098"));
		dto.put("ydc008", request.getParameter("ydc008"));
		List list = getModified("cdxx");
		for(int i=0;i<list.size();i++)
		{		
			Key  key = (Key) list.get(i);
			dto.put("ydc005",key.get("ydc005"));
			dto.put("ydc097",key.get("ydc097"));
			List list1=getDao().queryForList("dc04.get",dto);
			if(list1.size()==0)service.adddc(dto);
			else service.cydc(dto);
		}
		return JSON;
	}
	public String edit() throws Exception{
		ParamDTO dto = getDto();
		dto.put("ydc008", request.getParameter("ydc008"));
		Dc03Domain domain = (Dc03Domain) getDao().queryForObject("dc03.getList",dto);
		setData(domain.toMap(),false);
		List list=getDao().queryForList("dc01.getList",dto);
		
		
		String user = getDto().getUserInfo().getUserId();
		if(user.equals(request.getParameter("ydc098"))){
			setList("cgxx",list);	
			
		}
		else{
			setMsg("您不是此订单的发起人,不可修改");
		}return "editdd";
		
	}
	public String xgdd() throws Exception{
		ParamDTO dto=getDto();
		dto.put("ydc010", request.getParameter("ydc010"));
		dto.put("ydc008", request.getParameter("ydc008"));
		List list = getSelected("cgxx");
		Key  key = (Key) list.get(0);
		dto.put("ydc001",key.get("ydc001"));
		String ydc098 = getDto().getUserInfo().getUserId();
		dto.put("ydc098", ydc098);
		service.editdd(dto);
		return JSON;
	}
	public String deletedd() throws Exception{
		ParamDTO dto = getDto();
		dto.put("ydc008", request.getParameter("ydc008"));
		dto.put("ydc098", request.getParameter("ydc098"));
		String user = getDto().getUserInfo().getUserId();
		if(user.equals(request.getParameter("ydc098"))){
		service.deletedd(dto);
		}
		else{
			setMsg("您不是此订单的发起人");
		}
		return JSON;
	}
	public String callPrc(){
		PrcDTO pDto = new PrcDTO();
		pDto.put("prm_ydc008",request.getParameter("ydc008"));
		getDao().callPrc("dc04.prc_price", pDto);
		if("NOERROR".equals(pDto.getAppCode())){
			setMsg("成功");
		}else{
			setMsg("失败");
		}
		ParamDTO dto = getDto();
		dto.put("ydc012",pDto.getAsString("prm_ydc012"));
		dto.put("ydc008", request.getParameter("ydc008"));
		getDao().update("dc03.updatePrice", dto);
		return JSON;
	}
	public String checkmx() throws Exception{
		ParamDTO dto = getDto();
		dto.put("ydc008", request.getParameter("ydc008"));
		dto.put("ydc098", request.getParameter("ydc098"));
		List list=getDao().queryForList("dc04.getMX",dto);
		setList("dcmx",list);
		return "cxmx";
	}
	public String cancel() throws Exception{
		ParamDTO dto = getDto();
		dto.put("ydc008", request.getParameter("ydc008"));
		String user = getDto().getUserInfo().getUserId();
		if(user.equals(request.getParameter("ydc098"))){
			service.gbdd(dto);
		}
		else{
			setMsg("您不是此订单的发起人");
		}
		
		return JSON;
	}
}