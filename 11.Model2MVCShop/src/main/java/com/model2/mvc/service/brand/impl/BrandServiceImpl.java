package com.model2.mvc.service.brand.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.brand.BrandDAO;
import com.model2.mvc.service.brand.BrandService;
import com.model2.mvc.service.domain.Brand;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductDAO;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.user.UserDao;

@Service("brandServiceImpl")
public class BrandServiceImpl implements BrandService{
	
	@Autowired
	@Qualifier("brandDaoImpl")
	private BrandDAO brandDao;
	public void setBrandDao(BrandDAO brandDao) {
		this.brandDao = brandDao;
	}
	
	public BrandServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addBrand(Brand brand) throws Exception {
		brandDao.addBrand(brand);
		
	}

	@Override
	public Map<String, Object> getBrandList() throws Exception {
		List<Brand> list= brandDao.getBrandList();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		return map;
	}

	
	

}
