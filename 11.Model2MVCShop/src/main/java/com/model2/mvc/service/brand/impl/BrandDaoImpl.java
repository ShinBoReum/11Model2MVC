package com.model2.mvc.service.brand.impl;

import java.io.FileOutputStream;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.brand.BrandDAO;
import com.model2.mvc.service.domain.Brand;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductDAO;


@Repository("brandDaoImpl")
public class BrandDaoImpl implements BrandDAO{

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public BrandDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addBrand(Brand brand) throws Exception {
		sqlSession.insert("BrandMapper.addBrand", brand);
		
	}

	@Override
	public List<Brand> getBrandList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("BrandMapper.getBrandList");
	}


}
