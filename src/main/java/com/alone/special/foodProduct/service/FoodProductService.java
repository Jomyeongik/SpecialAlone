package com.alone.special.foodProduct.service;

import java.util.List;

import com.alone.special.foodProduct.domain.FoodProduct;
import com.alone.special.foodProduct.domain.FoodProductFile;

public interface FoodProductService {

	int insertProductInfo(FoodProduct fProduct);

	int insertProductFiles(List<FoodProductFile> fList);

	

	

}
