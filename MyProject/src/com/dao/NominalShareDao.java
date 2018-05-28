package com.dao;

import java.util.List;

import com.dto.NominalInfoDto;
import com.entities.NominalShareEntity;


public interface NominalShareDao {
	void addUser(NominalShareEntity entity);

	/*List<NominalShareEntity> listNominalShare() ;*/
	
	List<NominalShareEntity> getNominalInfo(NominalInfoDto reqDto);

	void update(int slno, NominalShareEntity entity);

	void deletenominalshares(int slno, Class<NominalShareEntity> class1);

	List<Integer> membershare();
}









/*package com.dao;

import com.entities.NominalShareEntity;

public interface NominalShareDao {
	
		void addUser(NominalShareEntity entity);
}
*/