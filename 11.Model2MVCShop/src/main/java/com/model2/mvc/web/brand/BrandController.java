package com.model2.mvc.web.brand;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.brand.BrandService;
import com.model2.mvc.service.domain.Brand;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.sun.org.apache.xpath.internal.operations.Mod;

@Controller
@RequestMapping("/brand/*")
public class BrandController {
	
	@Autowired
	@Qualifier("brandServiceImpl")
	private BrandService brandService;
	
	public BrandController() {
		System.out.println(this.getClass());
	}
	
	//@Value("#{commonProperties['pageUnit']}")
	@Value("#{commonProperties['pageUnit'] ?: 5}")
	int pageUnit;
	
	//@Value("#{commonProperties['pageSize']}")
	@Value("#{commonProperties['pageSize'] ?: 8}")
	int pageSize;
	
	@RequestMapping( value="addBrand" )
	public String addBrand(@ModelAttribute("brand") Brand brand,
							Model model) throws Exception {
		//,@ModelAttribute("brand") Brand brand
		//@RequestParam("brandName") String brandName
		System.out.println("/addProduct.do");
		//Brand brand = new Brand();
		
		System.out.println(brand);
		
		//brandService.addBrand(brand);
		
		model.addAttribute("brand","a");
		
		
		return "forward:/history.jsp";
	}
	
	@RequestMapping( value="compareCar" )
	public String compareCar(Model model) throws Exception {
		
		System.out.println("연결하겠음");
		
		//Map<String , Object> map=brandService.getBrandList();
		
		//System.out.println(map);
		
		//model.addAttribute("list", map.get("list"));
		
		
		return "forward:/brand/compare.jsp";
		
	}
	/*
	@RequestMapping( value="listProduct" )
	public String listProduct( @ModelAttribute("search") Search search , Model model , 
											HttpServletRequest request,
											HttpSession session) throws Exception{
		
		System.out.println("/listProduct");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		System.out.println(session.getAttribute("user"));
		//String role = ((User)session.getAttribute("user")).getRole();
		String role ="";
		if((session.getAttribute("user"))==null) {
			role = "user";
		}else {
			role = ((User)session.getAttribute("user")).getRole();
		}
		
		// Business logic 수행
		Map<String , Object> map=productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("리절트페이지"+resultPage);
		
		System.out.println("맵내용 :"+map.get("list"));
		
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("role",role);
		
		return "forward:/product/listProduct.jsp";
		
	}
	
	
	@RequestMapping( value="getProduct", method=RequestMethod.GET )
	public String getProduct( @RequestParam("prodNo") int prodNo , Model model,
						HttpSession session, HttpServletRequest request, 
						HttpServletResponse response) throws Exception {
		
		System.out.println("/getProduct.do");
		
		//String role = ((User)session.getAttribute("user")).getRole();
		String role ="";
		if((session.getAttribute("user"))==null) {
			role = "search";
		}else {
			role = ((User)session.getAttribute("user")).getRole();
		}
		Cookie[] cookies = request.getCookies();
		
		String history = "null";
		if (cookies != null && cookies.length >= 1) { 
			for (Cookie c : cookies) { 
				if(c.getName().equals("history")) {
					history = c.getValue();
				}
			} 
		} 

		Cookie c = new Cookie("history", history + ", " + prodNo) ;
		c.setPath("/");
		response.addCookie(c);
		request.setAttribute("role", role );
		
		//Business Logic
		Product product = productService.getProduct(prodNo);
		
		// Model 과 View 연결
		model.addAttribute("product", product);
		model.addAttribute("role",role);
		model.addAttribute("Cookie",c);
		
		return "forward:/product/getProduct.jsp";
	}
	
	@RequestMapping( value="updateProductView" )
	public String updateProductView( @RequestParam("prodNo") int prodNo , Model model) throws Exception{

		System.out.println("/updateProductView.do");
		
		
		//Business Logic
		Product product = productService.getProduct(prodNo);
		// Model 과 View 연결
		model.addAttribute("product", product);
		
		return "forward:/product/updateProduct.jsp";
		
	}
	

	@RequestMapping( value="updateProduct" )
	public String updateProduct( @ModelAttribute("product") Product product , 
										Model model , HttpSession session,
										@RequestParam("brand_id") int brand_id) throws Exception{

		System.out.println("/updateProduct.do");
		
		Brand bran= new Brand();
		bran.setBrand_id(brand_id);
		product.setBrandId(bran);
		
		//Business Logic
		productService.updateProduct(product);
		
		System.out.println("끝!!");
		
		return "redirect:/product/getProduct?prodNo="+product.getProdNo()+"&menu=admin";
	}
*/
}
