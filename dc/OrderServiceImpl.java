package com.yinhai.px.service.impl;


import java.util.Date;

import com.yinhai.px.service.OrderService;
import com.yinhai.sysframework.dto.ParamDTO;
import com.yinhai.sysframework.service.BaseService;

/**
 * @yhcip:name OrderServiceImpl
 * @yhcip:desc 
 * @author YINHAI SOFTWARE
 * @copyright Copyrigt 银海软件 2011
 * @version 3.2
 */
public class OrderServiceImpl extends BaseService implements OrderService {

	public String addRes(ParamDTO dto) {
		String ydc001 = getSequence("SEQ_CG");
		dto.put("ydc001", ydc001);
		dao.insert("dc01.insert",dto);
		return ydc001;
	}
	public String editRes(ParamDTO dto) {
		dao.update("dc01.updateNotEmpty",dto);
		return null;
	}
	public String delete(ParamDTO dto) {
		// TODO Auto-generated method stub
		dao.delete("dc01.delete",dto);
		return null;
	}
	@Override
	public String addCd(ParamDTO dto) {
		// TODO Auto-generated method stub
		String ydc005 = getSequence("SEQ_DC");
		dto.put("ydc005", ydc005);
		dao.insert("dc02.insert",dto);
		return ydc005;
	}
	@Override
	public String editCd(ParamDTO dto) {
		// TODO Auto-generated method stub
		dao.update("dc02.updateNotEmpty",dto);
		return null;
	}
	@Override
	public String deleteCd(ParamDTO dto) {
		// TODO Auto-generated method stub
		dao.delete("dc02.delete",dto);
		return null;
	}
	@Override
	public String deleteAll(ParamDTO dto) {
		// TODO Auto-generated method stub
		dao.delete("dc02.deletea",dto);
		dao.delete("dc01.delete",dto);
		return null;
	}
	@Override
	public String addFq(ParamDTO dto) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		String ydc008 = getSequence("SEQ_dd");
		dto.put("ydc008", ydc008);
		Date ydc009=getSysTimestamp();
		dto.put("ydc009", ydc009);
		dto.put("ydc011", 1);
		dao.insert("dc03.insert",dto);
		return ydc008;
	}
	@Override
	public String cydc(ParamDTO dto) {
		// TODO Auto-generated method stub
		
		dao.update("dc04.updateNotEmpty",dto);
		return null;
	}
	
	@Override
	public String editdd(ParamDTO dto) {
		// TODO Auto-generated method stub
		dao.update("dc03.updateNotEmpty",dto);
		return null;
	}
	@Override
	public String deletedd(ParamDTO dto) {
		// TODO Auto-generated method stub
		dao.delete("dc03.delete",dto);
		return null;
	}
	@Override
	public String editfq(ParamDTO dto) {
		dao.update("dc03.updateNotEmpty",dto);
		return null;
	}
	@Override
	public String adddc(ParamDTO dto) {
		// TODO Auto-generated method stub
		dao.insert("dc04.insert",dto);
		return null;
	}
	@Override
	public String gbdd(ParamDTO dto) {
		// TODO Auto-generated method stub
		dao.update("dc03.updatedd",dto);
		return null;
	}

}
