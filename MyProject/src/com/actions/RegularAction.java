/*package com.actions;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.HibernateException;

import com.dto.RegularInfoDto;
import com.entities.RegularShareEntity;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.services.RegularShareService;
import com.services.RegularShareServiceImpl;

import flexjson.JSONSerializer;

public class RegularAction extends ActionSupport implements ModelDriven<RegularInfoDto>, ServletRequestAware{

	*//**
	 * 
	 *//*
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request = null;
	private HttpSession session;
	private String resultString = SUCCESS;
	private String errorString = "";
	private RegularShareService regularService = null;
	private RegularInfoDto reqDto = new RegularInfoDto();
	private Map<String, String> map = new HashMap<String, String>();
	
	@Override
	public String execute()
	{
		session = request.getSession();
		session.invalidate();
		session = null;
		session=request.getSession();
		JSONSerializer jss=new JSONSerializer();
		try{
			
				regularService =new RegularShareServiceImpl();
				
				List<RegularShareEntity> info = regularService.getRegularInfo(reqDto);
				session.setAttribute("regularlist", info);
				map.put("info", jss.serialize(info));
				map.put("fromDate", reqDto.getFromDate());
				map.put("toDate", reqDto.getToDate());
				//session.invalidate();
				
			
			}catch (HibernateException e) {
					resultString = ERROR;
					if(e.getCause() == null) {
						errorString = e.getMessage();
					} else {
						errorString = e.getCause().toString();
					}
				} catch (Exception e) {
					resultString = ERROR;
					errorString = e.getMessage();
				}
				String jsondata = "";
				map.put("resultString", resultString);
				map.put("errorString", errorString);
				jsondata = jss.serialize(map);
				request.setAttribute("jsondata", jsondata);
				return "jsondata";
		
	}
	public HttpServletRequest getRequest() {
		return request;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		
	}
	@Override
	public RegularInfoDto getModel() {
		// TODO Auto-generated method stub
		return reqDto;
	}
}
*/