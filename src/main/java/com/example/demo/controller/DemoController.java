package com.example.demo.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.Repository.OrderItemsRepository;
import com.example.demo.Repository.OrderRepository;
import com.example.demo.Repository.ProductRepository;
import com.example.demo.Repository.categoryRepository;
import com.example.demo.controller.ProductController.timkem;
import com.example.demo.model.Category;
import com.example.demo.model.Customer;
import com.example.demo.model.Login;
import com.example.demo.model.Order;
import com.example.demo.model.OrderItems;
import com.example.demo.model.Product;
import com.example.demo.model.SearchForm;
import com.example.demo.service.CustomerService;
import com.example.demo.service.GioHangService;
import com.example.demo.service.MailService;

@Controller
@RequestMapping("/")
public class DemoController {

	@Autowired
	ProductRepository productResponsitory;

	@Autowired
	categoryRepository categoryRepository;

	@Autowired
	HttpServletRequest request;

	
	// cài đặt tối đa 5 sản phẩm trên 1 trang
		private static final int TOI_DA_SAN_PHAM = 5;	
		@GetMapping("product")
		public String search(@ModelAttribute(name = "searchForm") SearchForm sf, Model model) {
			List<Category> category = categoryRepository.findAll();
			model.addAttribute("category", category);
			Pageable phanTrang = PageRequest.of(sf.getTrang(), TOI_DA_SAN_PHAM,
					sf.getThuTu() ? Direction.ASC : Direction.DESC, sf.getXepTheo());
			// lấy sản phẩm
			Page<Product> productPage = productResponsitory.findByNameContainingIgnoreCase(sf.getTen(), phanTrang);

			model.addAttribute("product", productPage.getContent());
			model.addAttribute("maxPage", productPage.getTotalPages());

			return "demo/product";
		}

	@GetMapping("index")
	public String showindex1(Model model) {
		List<Product> product = productResponsitory.findAll();
		List<Category> category = categoryRepository.findAll();

		model.addAttribute("product", product);
		model.addAttribute("category", category);

		Locale locale = request.getLocale();
		System.out.print(locale);
		model.addAttribute("lang", locale.getLanguage());

		return "/demo/index";
	}

	@GetMapping("ctsp")
	public String edit(@RequestParam(name = "cId") int cId, Model model) {
		List<Category> category = categoryRepository.findAll();
		Optional<Product> productOption = productResponsitory.findById(cId);
		if (productOption.isEmpty())
			return "redirect:listproduct";
		model.addAttribute("product", productOption.get());
		model.addAttribute("category", category);

		return "/demo/ctsp";
	}

	@Autowired
	GioHangService gioHangService;

	@GetMapping("giohang")
	public void gioHang1(Model model) {
		model.addAttribute("gioHang", gioHangService.getGioHang());
	}

	@GetMapping("them-vao-gio/{idSanPham}")
	public String addGioHang(@PathVariable("idSanPham") int idSanPham) {
		gioHangService.themSanPham(idSanPham);
		return "redirect:/giohang";
	}

	@GetMapping("tru-san-pham/{idSanPham}")
	public String truSanPham(@PathVariable("idSanPham") int idSanPham) {
		gioHangService.truSanPham(idSanPham);
		return "redirect:/giohang";
	}

	@GetMapping("xoa-san-pham/{idSanPham}")
	public String xoaSanPham(@PathVariable("idSanPham") int idSanPham) {
		gioHangService.xoaSanPham(idSanPham);
		return "redirect:/giohang";
	}

	@GetMapping("hoan-thanh-dat-hang")
	public String hoanthanhgio() {
		return "hoanthanh";
	}

	@Autowired
	MailService mailService;

	@PostMapping("hoan-thanh")
	public String hoanthanhgio(@RequestParam("email") String email) {
		mailService.pushMail(email);
		return "redirect:/index";
	}

	@Autowired
	OrderRepository orderRepository;

	@Autowired
	OrderItemsRepository orderItemsRepository;

	@Autowired
	CustomerService customerService;
	
	

	// dang nhap
	@GetMapping("login")
	public String login(@RequestParam(value = "cartStatus", defaultValue = "0") int cartStatus, Model model) {
		model.addAttribute("cartStatus", cartStatus);
		model.addAttribute("login", new Login());
		return "login";
	}

	@PostMapping("login")
	public String loginPost(@RequestParam(value = "cartStatus", defaultValue = "0") int cartStatus,
			@Valid @ModelAttribute("login") Login login, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (customerService.Login(login.getPhone(), login.getPassWord())) {
			model.addAttribute("cart", gioHangService.getGioHang());
			model.addAttribute("order", new Order());
			model.addAttribute("name", customerService.getCustomer().getName());
			model.addAttribute("phone", customerService.getCustomer().getPhone());
			model.addAttribute("address", customerService.getCustomer().getAddress());
			model.addAttribute("email", customerService.getCustomer().getEmail());
			session.setAttribute("username", customerService.getCustomer().getName());
			session.setAttribute("currentUser", customerService.getCustomer());
			return cartStatus == 1 ? "/demo/checkout" : "redirect:/product";
		} else {
			model.addAttribute("cartStatus", cartStatus);
			model.addAttribute("login", login);
			session.setAttribute("message", "Tài khoản hoặc mật khẩu không chính xác!");
			return "login";
		}

	}

	// dang kí
		@PostMapping("register")
		public String register(@RequestParam(value = "cartStatus", defaultValue = "0") int cartStatus,
				@Valid @ModelAttribute("customer") Customer customer, BindingResult result, Model model,
				HttpServletRequest request) {
			// valid data
			if (result.hasErrors()) {
				return "register";
			}
			HttpSession session = request.getSession();
			// check dang ki
			if (customerService.Register(customer)) {
				model.addAttribute("cart", gioHangService.getGioHang());
				model.addAttribute("order", new Order());
				model.addAttribute("name", customerService.getCustomer().getName());
				model.addAttribute("phoneNumber", customerService.getCustomer().getPhone());
				model.addAttribute("address", customerService.getCustomer().getAddress());
				session.setAttribute("username", customerService.getCustomer().getName());
				session.setAttribute("currentUser", customerService.getCustomer());
				return cartStatus == 1 ? "checkout" : "redirect:/products";

			} else {
				model.addAttribute("cartStatus", cartStatus);
				return "register";
			}

		}

		@GetMapping("register")
		public String registerGet(@RequestParam(value = "cartStatus", defaultValue = "0") int cartStatus, Model model) {
			model.addAttribute("cartStatus", cartStatus);
			model.addAttribute("customer", new Customer());
			return "register";
		}
	
	@PostMapping("logout")
	public String logOut(@RequestParam(value = "cartStatus", defaultValue = "0") int cartStatus, Model model,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (customerService.Logout(customerService.getCustomer().getCustomerId())) {
			session.removeAttribute("username");
			session.removeAttribute("currentUser");
			// lam moi lai gio hang
			gioHangService.getGioHang().getChiTietGioHang().clear();
		}
		return "redirect:/index";
	}

	/// XU LY GIO HANG

	// trang gio hang
	@GetMapping("your-cart")
	public void gioHang(Model model) {
		model.addAttribute("cart", gioHangService.getGioHang());
	}

	// kiem tra dang nhap truoc khi tiep tuc thanh toan
	@GetMapping("check-out")
	public String checkout(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (customerService.isCustomerLogin()) {
			session.setAttribute("cart", gioHangService.getGioHang());
			model.addAttribute("order", new Order());
			model.addAttribute("name", customerService.getCustomer().getName());
			model.addAttribute("phone", customerService.getCustomer().getPhone());
			model.addAttribute("email", customerService.getCustomer().getEmail());
			model.addAttribute("address", customerService.getCustomer().getAddress());
			model.addAttribute("cartStatus", 0);
			return "/demo/checkout";
		} else {
			model.addAttribute("cartStatus", 1);
			model.addAttribute("login", new Login());
			return "login";
		}
	}

	// trang xac nhan don hang
	@RequestMapping("check-out")
	public String hoanthanhgio(@Valid @ModelAttribute("order") Order order, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "checkout";
		}
		// luu order
		order.setCustomer(customerService.getCustomer());
		Order orderSave = orderRepository.save(order);

		// luu orderItems
		Map<Product, Integer> listItems = gioHangService.getGioHang().getChiTietGioHang();

		for (Product product : listItems.keySet()) {

			OrderItems orderItem = new OrderItems();
			int amount = listItems.get(product);
			orderItem.setProduct(product);
			orderItem.setOrder(orderSave);
			orderItem.setAmount(amount);
			orderItem.setName(product.getName());
			orderItem.setPrice(product.getPrice());
			orderItem.setTotal((product.getPrice()) * amount);
			orderItemsRepository.save(orderItem);
		}

		// lam moi lai gio hang
		gioHangService.getGioHang().getChiTietGioHang().clear();

		// gui mail
		mailService.sendMailWithOrderId(order.getId());
		return "redirect:/product";
	}

}
