package com.dao;

import java.util.List;

import com.dto.RegularInfoDto;
import com.entities.RegularShareEntity;


public interface RegularShareDao {
	void addUser(RegularShareEntity entity);

	/*List<RegularShareEntity> listRegularShare() ;*/
	
	List<RegularShareEntity> getRegularInfo(RegularInfoDto reqDto);

	void update(int slno, RegularShareEntity entity);

	void deleteregularshares(int slno, Class<RegularShareEntity> class1);

	List<Integer> membershare();
}














/*package com.dao;

import java.util.List;

import com.dto.RegularInfoDto;
import com.entities.RegularShareEntity;


public interface RegularShareDao {
	void addUser(RegularShareEntity entity);

	List<RegularShareEntity> listRegularShare() ;
	
	List<RegularShareEntity> getRegularInfo(RegularInfoDto reqDto);

	void update(int slno, RegularShareEntity entity);

	void deleteregularshares(int slno, Class<RegularShareEntity> class1);

	List<Integer> membershare();
}
*/