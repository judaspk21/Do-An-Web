package com.example.demo.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.Repository.ProductRepository;
import com.example.demo.Repository.categoryRepository;
import com.example.demo.model.Category;
import com.example.demo.model.Product;




@Controller
@RequestMapping("category")
public class CategoryController {
	// lấy đường dẫn url localhost:8090/category/insert
	@GetMapping("insert")
	public String insert(Model model) {
		// Gọi lớp category trong packge model
		Category category = new Category();		
		// ${category}
		model.addAttribute("category", category);
		// trả về đường dẫn url localhost:8090/category/insert
		return "category/insert";
	}
	
	
	// xử lý trong form insert
	@PostMapping("insert")
	// thêm dữ liệu vào ${category}
	public String insertComplete(@Valid @ModelAttribute("category") Category category
			, BindingResult result, Model model) {
		// Kiểm tra lỗi  sai 
		if (result.hasErrors()) {
			//  trả về đường dẫn localhost:8090/category/insert
			return "category/insert";
		}
		// đúng sẽ lưu vào category
		categoryRepository.save(category);
		// chuyển hướng đen url localhost:8090/redirect:listcategory
		return "redirect:listcategory";
	}
	// Sửa category
	// dùng chung 1 form insert
	// lấy đường dẫn url localhost:8090/category/insert
	@GetMapping("edit")
	// Lấy id của category 
	public String index(@RequestParam(name = "cId") int cId, Model model) {
		
		Optional<Category> categoryOption = categoryRepository.findById(cId);	
		// kiểm tra nếu không đúng id thì sẽ trả về url localhost:8090/redirect:list
		if (categoryOption.isEmpty()) return "redirect:listcategory";
		// ${category}
		model.addAttribute("category", categoryOption.get());
		// trả về đường dẫn ocalhost:8090/category/insert
		return "category/edit";
	}
	
	// xử lý form edit
	@PostMapping("edit")
	// Lấy dữ liệu từ form list 
	public String index(@Valid @ModelAttribute("category") Category category
			, BindingResult result, Model model) {
		// kiểm tra lỗi 
		if (result.hasErrors()) {
			// sai id thì sẽ trả về url category/insert
			return "category/edit";
		}
		// trong category dùng categoryRepository ( kho ) để tìm id
		Optional<Category> categoryOption = categoryRepository.findById(category.getCategogyId());
		
		// kiểm tra trống trả về url redirect:list
		if (categoryOption.isEmpty()) return "redirect:listcategory";
		Category categoryOld = categoryOption.get();
		categoryOld.setName(category.getName());
		categoryRepository.save(categoryOld);
		
		return "redirect:listcategory";
	}
	
	// Import package categoryRepository 
	@Autowired
	categoryRepository categoryRepository;
	
	// đường dẫn url //localhost:8090/category/listcategory
	@GetMapping("listcategory")
	public String index(Model model) {
		// dùng hàm list load tất cả sản phẩm lên trang url //localhost:8090/category/listcategory
		List<Category> cate = categoryRepository.findAll();
		//${item cate}
		model.addAttribute("cate", cate);
		// trả về url localhost:8090/category/listcategory
		return "category/listcategory";
	}
	
	@Autowired
	ProductRepository productRepository;
	// Xoá Cate
	@GetMapping("delete")
	public String delete(@RequestParam(name = "cId") int cId) {
		Optional<Category> categoryOption = categoryRepository.findById(cId);
		if (categoryOption.isEmpty()) return "redirect:istcategory";
		Category category = categoryOption.get();
		// Lấy danh sách product
		List<Product> products = category.getProducts();
		// Set lại danh sách category null
		for (Product product : products) {
			product.setCategory(null);
		}
		// lưu lại danh sách product
		productRepository.saveAll(products);
		// xóa category
		categoryRepository.delete(category);
		
		return "redirect:listcategory";
	}
	
}
