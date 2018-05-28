package com.dao;

import java.util.List;

import com.dto.VehicleInfoDto;
import com.entities.AshareEntity;
import com.entities.NominalShareEntity;
import com.entities.RegularShareEntity;
import com.entities.VehicleLoanEntity;

public interface VehicleLoanDao {

	void adduser(VehicleLoanEntity entity);

	List<NominalShareEntity> nominallist();

	List<NominalShareEntity> getNominalShareNameFromAccount(String memberid);

	List<Integer> vehiclemember();

	List<RegularShareEntity> RegularList();

	List<AshareEntity> ashareList();

	List<RegularShareEntity> getregularname(String memberid);

	List<AshareEntity> getAsharename(String memberid);

	List<VehicleLoanEntity> GetVehicleInfo(VehicleInfoDto vldto);



	

}
