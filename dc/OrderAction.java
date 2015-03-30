package com.yinhai.peixun.action.培训材料.API文档;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import com.yinhai.peixun.domain.Dc01Domain;
import com.yinhai.peixun.domain.Dc02Domain;
import com.yinhai.px.service.OrderService;
import com.yinhai.px.service.T0101Service;
import com.yinhai.sysframework.app.domain.Key;
import com.yinhai.sysframework.dto.ParamDTO;
import com.yinhai.webframework.BaseAction;
import com.yinhai.yhcip.print.util.ExcelFileUtils;

@Namespace("/dc")
@Action(value="OrderAction",results={
		@Result(name="success",location="/dc/canguan.jsp"),
		@Result(name="addRes",location="/dc/newcanguan.jsp"),
		@Result(name="addCd",location="/dc/newcd.jsp"),
		@Result(name="EditCd",location="/dc/newcd.jsp"),
		@Result(name="add",location="/dc/candan.jsp")
		
		})
public class OrderAction extends BaseAction
{
	private OrderService service = (OrderService) getService("orderService");
		
	public String execute() throws Exception{
		return SUCCESS;
	}
	public String query() throws Exception{
		ParamDTO dto= getDto();
		dto.put("flag", "Dc01");
		List list=getDao().queryForList("dc01.getList",dto);
		setList("cgxx",list);
		return JSON;
	}
	public String addRes() throws Exception{
		return "addRes";
	}
	public String save() throws Exception{
		ParamDTO dto = getDto();
		service.addRes(dto);
		return JSON;
	}
	public String toUpdate() throws Exception{
		ParamDTO dto = getDto();
		dto.put("ydc001", request.getParameter("ydc001"));
		Dc01Domain domain = (Dc01Domain) getDao().queryForObject("dc01.get",dto);
		setData(domain.toMap(),false);
		return "addRes";
	}
	public String edit() throws Exception{
		ParamDTO dto = getDto();
		service.editRes(dto);
		return JSON;
	}
	public String delet() throws Exception{
		ParamDTO dto = getDto();
		dto.put("ydc001", request.getParameter("ydc001"));
		service.deleteAll(dto);
		dto.put("ydc001", request.getParameter("ydc001"));
		return JSON;
	}
	public String deleteAll() throws  Exception{
		ParamDTO dto = getDto();
		List list = getSelected("cgxx");
		for(int i=0;i<list.size();i++)
		{
			Key  key = (Key) list.get(i);
			dto.put("ydc001",key.get("ydc001"));
			service.deleteAll(dto);
		}
		return JSON;
	}
	public String checkcd() throws Exception{
		ParamDTO dto = getDto();
		dto.put("ydc001", request.getParameter("ydc001"));
		Dc01Domain domain = (Dc01Domain) getDao().queryForObject("dc01.get",dto);
		setData(domain.toMap(),false);
		return "add";
	}
	public String querycd() throws Exception{
		ParamDTO dto= getDto();
		dto.put("flag", "Dc02");
		List list=getDao().queryForList("dc02.getList",dto);
		setList("cdxx",list);
		return JSON;
	}
	public String toUpdateCd() throws Exception{
		ParamDTO dto = getDto();
		dto.put("ydc005", request.getParameter("ydc005"));
		Dc02Domain domain = (Dc02Domain) getDao().queryForObject("dc02.get",dto);
		setData(domain.toMap(),false);
		return "EditCd";
	}
	public String addCd() throws Exception{
		ParamDTO dto= getDto();
		setData("ydc001_", request.getParameter("ydc001_"));
		return "addCd";
	}
	public String savecd() throws Exception{
		ParamDTO dto = getDto();
		service.addCd(dto);
		return JSON;
	}
	public String editCd() throws Exception{
		ParamDTO dto = getDto();
		service.editCd(dto);
		return JSON;
	}
	public String deletCd() throws Exception{
		ParamDTO dto = getDto();
		dto.put("ydc005", request.getParameter("ydc005"));
		service.deleteCd(dto);
		return JSON;
	}
	 private java.io.File theFile;
	 private String theFileFileName;
	 private String theFileContentType;


	 public File getTheFile() {
		 return theFile;
	 }


	 public void setTheFile(File theFile) {
		 this.theFile= theFile;
	 }


	 public String getTheFileFileName() {
		 return theFileFileName;
	 }


	 public void setTheFileFileName(String theFileFileName) {
		 this.theFileFileName = theFileFileName;
	 }


	 public String getTheFileContentType() {
		 return theFileContentType;
	 }


	 public void setTheFileContentType(String theFileContentType) {
		 this.theFileContentType = theFileContentType;
	 }


	
	 public String savefu() throws Exception {
		
		 if (theFile != null){
			ParamDTO dto = getDto();
	    if (getTheFileFileName().indexOf(".xls") < 0) {
			 setMsg("请上传 Excel 文件！");
			 }
		 else{
			
			 try{
				
				InputStream fin = new FileInputStream(theFile.getPath());			
	            List list=ExcelFileUtils.getExcelInputStream2ObjectList(fin, "ydc006,ydc007,ydc001", "com.yinhai.peixun.domain.Dc02Domain", false);
			    setList("grid1", list);
			    for (int i = 0; i < list.size(); i++) {
			    	Dc02Domain dc02=(Dc02Domain) list.get(i);
			    	dto.put("ydc006", dc02.getYdc006());
			    	dto.put("ydc007", dc02.getYdc007());
			    	dto.put("ydc001", dc02.getYdc001());
			    	service.addCd(dto);
				}  
			    setMsg("文件上传成功已保存！");
			    theFile.delete();
			    fin.close();
			 }
			 catch(Exception e){			
				 /*setMsg( e.getMessage());*/	
			   }		
			 }		
	       }
		    else {
		    	 setMsg("请先上传文件！");
			 }
		 return SUCCESS;
	 }
}