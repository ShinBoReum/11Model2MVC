package com.model2.mvc.web.purchase;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;

@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public PurchaseController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	@RequestMapping( value="addPurchaseView" )
	public String addPurchaseView(Model model,HttpSession session,@RequestParam("prodNo") int prodNo) throws Exception {
		System.out.println("/addPurchaseView");

		Product product =productService.getProduct(prodNo);
		
		model.addAttribute("product", product);
		
		return "forward:/purchase/addPurchaseView.jsp";
	}
	
	@RequestMapping( value="addPurchase" )
	public ModelAndView addPurchase(Model model,@ModelAttribute("purchase") Purchase purchase,
										@RequestParam("prodNo") int prodNo,
										@RequestParam("buyerId") String buyerId) throws Exception {
		System.out.println("/addPurchase");
		
		User buyer =userService.getUser(buyerId);
		
		Product purchaseProd = productService.getProduct(prodNo);
		
		purchase.setBuyer(buyer);
		purchase.setPurchaseProd(purchaseProd);
		purchaseService.insertPurchase(purchase);
		
		
		model.addAttribute("purchase",purchase);
		

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/purchase/addPurchase.jsp");
		
		//return "forward:/purchase/addPurchase.jsp";
		return modelAndView;
	}
	
	@RequestMapping( value="listPurchase" )
	public ModelAndView listPurchase( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/listPurchase");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		HttpSession session=request.getSession();
		String buyerId = ((User)session.getAttribute("user")).getUserId();
		System.out.println(buyerId);
		
		search.setBuyerId(buyerId);
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=purchaseService.getPurchaseList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("리절트페이지"+resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/purchase/listPurchase.jsp");
		
		return modelAndView;
	}

	@RequestMapping( value="getPurchase" )
	public ModelAndView getPurchase(@RequestParam("tranNo") int tranNo ) throws Exception {
		
		System.out.println("/getPurchase");
		//Business Logic
		//Product product = purchaseService.getPurchaseList(search)
		// Model 과 View 연결
		//model.addAttribute("product", product);
		
		Purchase purchase = purchaseService.findPurchase(tranNo);
		System.out.println("찍어봅니다."+purchase);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("purchase",purchase);
		modelAndView.setViewName("/purchase/getPurchase.jsp");
		
		return modelAndView;
	}
	@RequestMapping( value="updatePurchaseView" )
	public ModelAndView updatePurchaseView(@RequestParam("tranNo") int tranNo,HttpServletRequest request) throws Exception {
		
		System.out.println("/updatePurchaseView");

		Purchase purchase = purchaseService.findPurchase(tranNo);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("purchase",purchase);
		modelAndView.setViewName("/purchase/updatePurchase.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping( value="updatePurchase" )
	public ModelAndView updatePurchase(@RequestParam("tranNo") int tranNo,HttpServletRequest request) throws Exception {
		
		System.out.println("/updatePurchase");

		Purchase purchase = purchaseService.findPurchase(tranNo);
		System.out.println("나와랏"+purchase.getReceiverName());
		System.out.println("나와랏"+purchase.getReceiverPhone());
		System.out.println("나와랏"+purchase.getDivyAddr());
		System.out.println("나와랏"+purchase.getDivyRequest());
		System.out.println("나와랏"+purchase.getDivyDate());
		System.out.println("나와랏"+purchase.getTranNo());
		
		purchaseService.updatePurchase(purchase);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("purchase",purchase);
		modelAndView.setViewName("redirect:/purchase/getPurchase?tranNo="+tranNo);
		
		return modelAndView;
	}
	
	@RequestMapping( value="updateTranCodeByProd" )
	public ModelAndView updateTranCodeByProd(@ModelAttribute("purchase") Purchase purchase, @RequestParam("prodNo") int prodNo,HttpServletRequest request) throws Exception {
		
		System.out.println("/updateTranCodeByProd");
		
		HttpSession session=request.getSession();
		session.getAttribute("user");
		String role = ((User)session.getAttribute("user")).getRole();
		String page = request.getParameter("page");
		String tranCode = request.getParameter("tranCode");
		
		Product purchaseProd = productService.getProduct(prodNo);
		
		purchase.setTranCode(tranCode);
		purchase.setPurchaseProd(purchaseProd);
		
		purchaseService.updateTranCode(purchase);
		
		String url="";
		if(tranCode.equals("2")) {url="/product/listProduct?";}
		else if(tranCode.equals("3")){url="/purchase/listPurchase?";}
		else if(tranCode.equals("4")){url="/product/listProduct?";}
		
		System.out.println("유알엘은으ㅡㄴ응ㄴ"+url);
		System.out.println("최종가는곳:   "+"redirect:/purchase/"+url+"page="+page+"&menu="+role);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("purchase",purchase);
		modelAndView.setViewName("redirect:"+url+"page="+page+"&menu="+role);
		
		return modelAndView;
	}
}

