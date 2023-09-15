package com.alone.special.product.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.alone.special.product.domain.Product;
import com.alone.special.product.domain.ProductPageInfo;

public interface ProductStore {

	int insertProduct(SqlSession session, Product product);

	int selectListCount(SqlSession session);

	List<Product> selectProductList(SqlSession session, ProductPageInfo pInfo);

	Product selectOne(SqlSession session, Integer sProductId);

	String[] productsel(SqlSession session, String[] productIdArray);

	int updateproduct(SqlSession session, Product product);
	
}
