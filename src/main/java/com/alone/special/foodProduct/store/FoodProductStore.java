package com.alone.special.foodProduct.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.alone.special.foodProduct.domain.FoodProduct;
import com.alone.special.foodProduct.domain.FoodProductFile;


public interface FoodProductStore {

	int insertProductInfo(FoodProduct fProduct, SqlSession session);

	int insertProductFiles(List<FoodProductFile> fList, SqlSession session);

	int getNextProductId(SqlSession session);






}
