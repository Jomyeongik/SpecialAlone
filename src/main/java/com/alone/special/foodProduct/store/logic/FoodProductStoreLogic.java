package com.alone.special.foodProduct.store.logic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.alone.special.foodProduct.domain.FoodProduct;
import com.alone.special.foodProduct.domain.FoodProductFile;
import com.alone.special.foodProduct.store.FoodProductStore;

@Repository
public class FoodProductStoreLogic implements FoodProductStore{

	@Override
	public int insertProductInfo(FoodProduct fProduct, SqlSession session) {
		int result = session.insert("FoodProductMapper.insertProductInfo",fProduct);
		return result;
	}

	@Override
	public int insertProductFiles(List<FoodProductFile> fList, SqlSession session) {
		Map<String,Object> params = new HashMap<>();
		params.put("list", fList);
		int result = session.insert("FoodProductMapper.insertProductFiles", params);
		return result;
	}

	@Override
	public int getNextProductId(SqlSession session) {
		int nextProductId = 0; // 실제 시퀀스 값을 가져오는 코드가 필요합니다.
        return nextProductId;
	}





}
