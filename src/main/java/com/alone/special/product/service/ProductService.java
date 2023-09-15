package com.alone.special.product.service;

import java.util.List;

import com.alone.special.product.domain.Product;
import com.alone.special.product.domain.ProductPageInfo;

public interface ProductService {

	int insertProduct(Product product);

	int getListCount();

	List<Product> selectProductLust(ProductPageInfo pInfo);

	Product selectProductById(Integer sProductId);

	String[] recentProducts(String[] productIdArray);

	int updateProduct(Product product);




}
