package com.model2.mvc.service.brand;

import java.util.List;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Brand;
import com.model2.mvc.service.domain.Product;



public interface BrandDAO {

	public void addBrand(Brand brand) throws Exception;
	
	public List<Brand> getBrandList() throws Exception;
	
	public List<Brand> compareCar(String national) throws Exception;
	
	public List<Brand> compareCar2(int brand_ids) throws Exception;

	
}