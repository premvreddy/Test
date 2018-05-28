package com.dao;

import java.util.List;

import com.dto.AshareInfoDto;
import com.entities.AshareEntity;


public interface AshareDao{
	void addUser(AshareEntity entity);

	/*List<RegularShareEntity> listRegularShare() ;*/
	
	List<AshareEntity> getAshareInfo(AshareInfoDto asDto);

	void update(int slno, AshareEntity entity);

	void deleteashares(int slno, Class<AshareEntity> class1);

	List<Integer> membershare();
}










/*package com.dao;

import com.entities.AshareEntity;


public interface AshareDao {
	void addUser(AshareEntity entity);

}*/
