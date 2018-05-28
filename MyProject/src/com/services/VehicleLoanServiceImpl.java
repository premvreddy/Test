package com.services;

import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.common.CommonUtils;
import com.dao.VehicleLoanDao;
import com.dao.VehicleLoanDaoImpl;
import com.dto.VehicleInfoDto;
import com.entities.AshareEntity;
import com.entities.NominalShareEntity;
import com.entities.RegularShareEntity;
import com.entities.VehicleLoanEntity;

public class VehicleLoanServiceImpl implements VehicleLoanService {
	private VehicleLoanDao dao = null;

	@Override
	public VehicleLoanEntity adduser(String memberid, String loanaccountnumber, String loannumber, String name, int age,
			String occupation, String nationality, String income, String makevehicle, String usepurpose,
			String normalpurpose, String fathersname, String accidentsoccurred, String bankrupt, String property,
			String contract, String nameandaddress, String paddress, String coobligantname, String professions,
			String securites, String permanentadd, String make, String article, String priceofchasis,
			String installment, String commencing,Date accountdate) {
		dao = new VehicleLoanDaoImpl();
		VehicleLoanEntity entity = new VehicleLoanEntity();
		entity.setMemberid(memberid);
		entity.setLoanaccountnumber(loanaccountnumber);
		entity.setLoannumber(loannumber);
		entity.setName(name);
		entity.setAge(age);
		entity.setOccupation(occupation);
		entity.setPaddress(paddress);
		entity.setNationality(nationality);
		entity.setIncome(income);
		entity.setMakevehicle(makevehicle);
		entity.setUsepurpose(usepurpose);
		entity.setNormalpurpose(normalpurpose);
		entity.setFathersname(fathersname);
		entity.setAccidentsoccurred(accidentsoccurred);
		entity.setBankrupt(bankrupt);
		entity.setProperty(property);
		entity.setContract(contract);
		entity.setNameandaddress(nameandaddress);

		entity.setCoobligantname(coobligantname);
		entity.setProfessions(professions);
		entity.setSecurites(securites);
		entity.setPermanentadd(permanentadd);
		entity.setMake(make);
		entity.setArticle(article);
		entity.setPriceofchasis(priceofchasis);
		entity.setInstallment(installment);
		entity.setCommencing(commencing);
		entity.setDate(new Date());


		dao.adduser(entity);
		return entity;

	}

	@Override
	public List<NominalShareEntity> nominallist() {
		dao = new VehicleLoanDaoImpl();

		return dao.nominallist();
	}

	@Override
	public List<NominalShareEntity> getNominalShareNameFromAccount(String memberid) {
		dao = new VehicleLoanDaoImpl();
		return dao.getNominalShareNameFromAccount(memberid);

	}

	@Override
	public List<Integer> getmember() {
		dao = new VehicleLoanDaoImpl();
		return dao.vehiclemember();

	}

	@Override
	public List<RegularShareEntity> RegularList() {
		dao = new VehicleLoanDaoImpl();

		return dao.RegularList();

	}

	@Override
	public List<AshareEntity> ashareList() {
        dao=new VehicleLoanDaoImpl();
		
		return dao.ashareList();

	
	}

	@Override
	public List<RegularShareEntity> getregularname(String memberid) {
		dao = new VehicleLoanDaoImpl();
		return dao.getregularname(memberid);
		
	}

	@Override
	public List<AshareEntity> getAsharename(String memberid) {
		dao = new VehicleLoanDaoImpl();
		return dao.getAsharename(memberid);
	
	}

	@Override
	public List<VehicleLoanEntity> GetVehicleInfo(VehicleInfoDto vldto) throws ParseException {
		
		dao=new VehicleLoanDaoImpl();
		Date sDate = null;
		Date eDate = null;
		if(vldto.getFromDate() == null || vldto.getFromDate().trim().length() == 0) {
			Calendar c = Calendar.getInstance();   // this takes current date
		    c.set(Calendar.DAY_OF_MONTH, 1);
		    sDate = c.getTime();
			c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
		    eDate = new Date();
		
		} else {
			sDate = CommonUtils.parse(vldto.getFromDate());
			eDate = CommonUtils.parse(vldto.getToDate());
		}
		vldto.setFromDate(CommonUtils.dbDateFormat(sDate));
		vldto.setToDate(CommonUtils.dbDateFormat(eDate));
		List<VehicleLoanEntity> infoDtos = dao.GetVehicleInfo(vldto);
		vldto.setFromDate(CommonUtils.format(sDate));
		vldto.setToDate(CommonUtils.format(eDate));
		return infoDtos;
	}

	
}