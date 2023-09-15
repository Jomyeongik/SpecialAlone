package com.alone.special.product.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alone.special.product.domain.Product;
import com.alone.special.product.domain.ProductPageInfo;
import com.alone.special.product.service.ProductService;
import com.alone.special.product.store.ProductStore;

@Service
public class ProductServiceImpl implements ProductService{
@Autowired
private ProductStore store;
@Autowired
private SqlSession session;
@Override
public int insertProduct(Product product) {
	int result = store.insertProduct(session,product);
	return result;
}
@Override
public int getListCount() {
	int result = store.selectListCount(session);
	return result;
}
@Override
public List<Product> selectProductLust(ProductPageInfo pInfo) {
	List<Product> pList = store.selectProductList(session,pInfo);
	return pList;
}
@Override
public Product selectProductById(Integer sProductId) {
	Product productOne = store.selectOne(session,sProductId);
	return productOne;
}
@Override
public String[] recentProducts(String[] productIdArray) {
	String[] productsel =  store.productsel(session,productIdArray);
	return productsel;
}
@Override
public int updateProduct(Product product) {
	int result = store.updateproduct(session,product);
	return result;
	
}

}
