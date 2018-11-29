package com.model2.mvc.service.brand;

import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Brand;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;

public interface BrandService {
	
	public void addBrand(Brand brand) throws Exception;
	
	public Map<String , Object> getBrandList() throws Exception;

	

}
