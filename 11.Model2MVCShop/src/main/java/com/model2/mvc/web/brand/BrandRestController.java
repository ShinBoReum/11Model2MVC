package com.model2.mvc.web.brand;



import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		brandService.addBrand(brand);
		
		System.out.println("끝냄");
	
		return brand;
		
	}
	
	@RequestMapping( value="json/compare")
	public Map<String , Object>  compare(@RequestParam("nation") String nation) throws Exception{
		System.out.println("컴패얼시작함");
		//System.out.println(brand);
		//brand.setNational(brand.getNational());
		Map<String , Object> map=brandService.compareCar(nation);
		
		System.out.println(map);
		
		
		System.out.println("끝냄");
	
		return map;
		
	}
	
	@RequestMapping( value="json/compare2")
	public Map<String , Object>  compare2(@RequestParam("brand_ids") int brand_ids) throws Exception{
		System.out.println("컴패얼2시작함");
		System.out.println(brand_ids);
		//System.out.println(brand);
		//brand.setNational(brand.getNational());
		Map<String , Object> map=brandService.compareCar2(brand_ids);
		
		System.out.println(map);
		
		
		System.out.println("끝냄");
	
		return map;
		//return null;
		
	}
	
	
	

}