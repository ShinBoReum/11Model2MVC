package com.model2.mvc.web.product;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.user.UserService;


//==> 회원관리 RestController
@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method 구현 않음
		
	public ProductRestController(){
		
		System.out.println(this.getClass());
		
	}
	
	@RequestMapping( value="json/getProduct/{prodNo}", method=RequestMethod.GET )
	public Product getProduct( @PathVariable int prodNo ) throws Exception{
		System.out.println("시작함");
		System.out.println("/product/json/getProduct : GET 레스컨트롤러");
		System.out.println("끝냄");
		//Business Logic
		return productService.getProduct(prodNo);
		
	}
	
	@RequestMapping( value="json/addProduct", method=RequestMethod.POST)
	public Product addProduct(@RequestBody Product product)throws Exception{
		System.out.println("시작함");
		productService.addProduct(product);
		System.out.println("끝냄");
		
		return product;
	}
	
	@RequestMapping( value="json/updateProduct", method=RequestMethod.POST)
	public Product updateProduct(@RequestBody Product product)throws Exception{
		System.out.println("업데이트시작함");
		System.out.println(product.getProdNo());
		System.out.println(product.getProdName());
		System.out.println(product.getProdDetail());
		
		productService.updateProduct(product);
		System.out.println("업데이트끝냄");
		
		return product;
	}
	
	@RequestMapping( value="json/listProduct",method=RequestMethod.POST)
	public Map<String , Object> listProduct(@RequestBody Search search) throws Exception{
		System.out.println("리스트시작함");
		int CurrentPage = search.getCurrentPage();
		int PageSize = search.getPageSize();
		
		
		Map<String , Object> map=productService.getProductList(search);
	    Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),PageSize, 8);
		System.out.println("리절트페이지"+resultPage);
		
		System.out.println("리스트끝냄");
		
		return map;
		
	}
	
	@RequestMapping( value="json/listProduct",method=RequestMethod.GET)
	public Map<String , Object> listProduct(@RequestParam("startNo") int startNo) throws Exception{
		System.out.println("리스트시작함");
		//System.out.println(request.getAttribute("startNo"));
		System.out.println(startNo);
		//int CurrentPage = search.getCurrentPage();
		//int PageSize = search.getPageSize();
		int currentPage = (startNo/4)+1;
		
		Search search = new Search();
		int pageSize = 4;
		search.setPageSize(pageSize);
		System.out.println(pageSize);
		search.setCurrentPage(currentPage);
		Map<String , Object> map=productService.getProductList(search);
	    Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),5, pageSize);
		System.out.println("리절트페이지"+resultPage);
		
		System.out.println("리스트끝냄");
		
		return map;
		
	}
	

}