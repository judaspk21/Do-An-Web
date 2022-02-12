package com.example.demo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.validation.Valid;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/*import com.example.demo.model.SearchForm;*/
import com.example.demo.Repository.ProductRepository;
import com.example.demo.Repository.categoryRepository;
import com.example.demo.model.Category;
import com.example.demo.model.Product;
import com.example.demo.model.SearchForm;

@Controller
@RequestMapping("product")
public class ProductController {

	@Autowired
	ProductRepository productResponsitory;

	// lấy danh sách category truyển cho trang insert
	@Autowired
	categoryRepository categoryRepository;

	@ModelAttribute("categories")
	public List<Category> getCategories() {
		List<Category> categories = categoryRepository.findAll();
		return categories;
	}

	/*
	 * @GetMapping("listproduct") public String index(@RequestParam(name = "order",
	 * // cài đặt giá trị mặc định để tránh lỗi defaultValue = "productId") String
	 * orderFeild, Model model) { List<Product> product =
	 * productResponsitory.findAll( // Direction có 2 loại // ASC tăng dần // DESC
	 * là giảm dần Sort.by(Direction.ASC, orderFeild));
	 * model.addAttribute("product", product); return "product/listproduct"; }
	 */

	// Thêm sản Phẩm
	@GetMapping("insert")
	public String insert(Model model) {
		Product product = new Product();
		model.addAttribute("product", product);
		return "product/insert";
	}

	@PostMapping("insert")
	public String insertComplete(@Valid @ModelAttribute("product") Product product, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "product/insert";
		}
		productResponsitory.save(product);
		return "redirect:listproduct";
	}

	// Sửa SẢn Phẩm
	@GetMapping("edit")
	public String edit(@RequestParam(name = "cId") int cId, Model model) {
		Optional<Product> productOption = productResponsitory.findById(cId);
		if (productOption.isEmpty())
			return "redirect:listproduct";
		model.addAttribute("product", productOption.get());
		return "product/edit";
	}

	@PostMapping("edit")
	public String edit(@Valid @ModelAttribute("product") Product product, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "product/edit";
		}

		Optional<Product> productOption = productResponsitory.findById(product.getProductId());
		if (productOption.isEmpty())
			return "redirect:listproduct";

		Product productOld = productOption.get();
		productOld.setName(product.getName());
		productOld.setImage(product.getImage());
		productOld.setDescription(product.getDescription());
		productOld.setCategory(product.getCategory());
		productOld.setPrice(product.getPrice());
		productResponsitory.save(productOld);

		return "redirect:listproduct";
	}

	// Xoá Sản Phẩm
	@GetMapping("delete")
	public String delete(@RequestParam(name = "cId") int cId) {
		Optional<Product> productOption = productResponsitory.findById(cId);
		if (productOption.isEmpty())
			return "redirect:listproduct";
		productResponsitory.delete(productOption.get());
		return "redirect:listproduct";
	}
	
	@ModelAttribute("orders")
	public List<timkem> tiemkiem() {
		List<timkem> orderList = new ArrayList<ProductController.timkem>();
		orderList.add(new timkem("productId", "ID"));
		orderList.add(new timkem("name", "Tên Sản Phẩm"));
		orderList.add(new timkem("price", "Giá Sản Phẩm"));
		
		return orderList;
	}
	
	public class timkem {
		private String key;
		private String value;
		public timkem(String key, String value) {
			super();
			this.key = key;
			this.value = value;
		}
		public String getKey() {
			return key;
		}
		public void setKey(String key) {
			this.key = key;
		}
		public String getValue() {
			return value;
		}
		public void setValue(String value) {
			this.value = value;
		}
	}

	// cài đặt tối đa 5 sản phẩm trên 1 trang
	private static final int TOI_DA_SAN_PHAM = 5;	
	@GetMapping("listproduct")
	public String search(@ModelAttribute(name = "searchForm") SearchForm sf, Model model) {

		Pageable phanTrang = PageRequest.of(sf.getTrang(), TOI_DA_SAN_PHAM,
				sf.getThuTu() ? Direction.ASC : Direction.DESC, sf.getXepTheo());
		// lấy sản phẩm
		Page<Product> productPage = productResponsitory.findByNameContainingIgnoreCase(sf.getTen(), phanTrang);

		model.addAttribute("product", productPage.getContent());
		model.addAttribute("maxPage", productPage.getTotalPages());

		return "product/listproduct";
	}

}
