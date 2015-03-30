package com.yinhai.px.service;


import com.yinhai.sysframework.dto.ParamDTO;
import com.yinhai.sysframework.service.Service;

/**
 * @yhcip:name OrderService
 * @yhcip:desc 
 * @author YINHAI SOFTWARE
 * @copyright Copyrigt 银海软件 2011
 * @version 3.2
 */
public interface OrderService extends Service {
	public String addRes(ParamDTO dto);
	public String editRes(ParamDTO dto);
	public String delete(ParamDTO dto);
	public String addCd(ParamDTO dto);
	public String editCd(ParamDTO dto);
	public String deleteCd(ParamDTO dto);
	public String deleteAll(ParamDTO dto);
	public String addFq(ParamDTO dto);
	public String cydc(ParamDTO dto);
	public String editdd(ParamDTO dto);
	public String deletedd(ParamDTO dto);
	public String editfq(ParamDTO dto);
	public String adddc(ParamDTO dto);
	public String gbdd(ParamDTO dto);
}
