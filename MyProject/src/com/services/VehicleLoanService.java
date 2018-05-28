package com.services;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import com.dto.VehicleInfoDto;
import com.entities.AshareEntity;
import com.entities.NominalShareEntity;
import com.entities.RegularShareEntity;
import com.entities.VehicleLoanEntity;

public interface VehicleLoanService {

	VehicleLoanEntity adduser(String memberid,String loanaccountnumber, String loannumber, String name, int age,
			String occupation, String nationality, String income, String makevehicle, String usepurpose,
			String normalpurpose, String fathersname, String accidentsoccurred, String bankrupt, String property,
			String contract, String nameandaddress, String paddress, String coobligantname, String professions,
			String securites, String permanentadd, String make, String article, String priceofchasis,
			String installment, String commencing ,Date accountdate);

	List<NominalShareEntity> nominallist();

	List<NominalShareEntity> getNominalShareNameFromAccount(String memberid);

	

	List<Integer> getmember();

	List<RegularShareEntity> RegularList();

	List<AshareEntity> ashareList();

	List<RegularShareEntity> getregularname(String memberid);

	List<AshareEntity> getAsharename(String memberid);

	List<VehicleLoanEntity> GetVehicleInfo(VehicleInfoDto vldto) throws ParseException;



	
	

	

	

}
