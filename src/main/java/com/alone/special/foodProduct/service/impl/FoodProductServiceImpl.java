package com.alone.special.foodProduct.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alone.special.foodProduct.domain.FoodProduct;
import com.alone.special.foodProduct.domain.FoodProductFile;
import com.alone.special.foodProduct.service.FoodProductService;
import com.alone.special.foodProduct.store.FoodProductStore;

@Service
public class FoodProductServiceImpl implements FoodProductService{

	@Autowired
	private SqlSession session;
	
	@Autowired
	private FoodProductStore FPStore;

	@Override
	public int insertProductInfo(FoodProduct fProduct) {
		int generatedProductId = FPStore.getNextProductId(session);
        fProduct.setfProductId(generatedProductId);
		
		int result = FPStore.insertProductInfo(fProduct,session);
		return result;
	}

	@Override
	public int insertProductFiles(List<FoodProductFile> fList) {
		int result = FPStore.insertProductFiles(fList,session);
		return result;
	}


	


}
