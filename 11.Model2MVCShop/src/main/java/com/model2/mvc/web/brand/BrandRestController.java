package com.model2.mvc.web.brand;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


import com.model2.mvc.service.brand.BrandService;
import com.model2.mvc.service.domain.Brand;
import com.model2.mvc.service.domain.Product;



//==> 회원관리 RestController
@RestController
@RequestMapping("/brand/*")
public class BrandRestController {
	
	///Field
	@Autowired
	@Qualifier("brandServiceImpl")
	private BrandService brandService;
	//setter Method 구현 않음
		
	public BrandRestController(){
		
		System.out.println(this.getClass());
		
	}
	
	@RequestMapping( value="json/addBrand")
	public Brand addBrand(@RequestBody Brand brand) throws Exception{
		System.out.println("시작함");
		System.out.println(brand);
		//Brand brand = new Brand();
		//brandService.addBrand(brand);
		
		System.out.println("끝냄");
	
		return brand;
		
	}
	
	
	

}