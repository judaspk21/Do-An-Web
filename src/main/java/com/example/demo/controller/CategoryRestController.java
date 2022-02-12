package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.example.demo.model.Category;
import com.example.demo.Repository.categoryRepository;

@RestController
public class CategoryRestController {
	@Autowired
	categoryRepository categoryRepository;

	@GetMapping("/api/category")
	public List<Category> list() {
		return categoryRepository.findAll();
	}

	@GetMapping("/api/category/{id}")
	public Category getById(@PathVariable("id") int id) {
		return categoryRepository.findById(id).orElse(null);
	}

	@DeleteMapping("/api/category/{id}")
	public void delete(@PathVariable("id") int id) {
		 categoryRepository.deleteById(id);
	}

	@PostMapping("/api/category")
	public Category insert(@RequestBody Category category) {
		return categoryRepository.save(category);
	}

	@PutMapping("/api/category")
	public Category update(@RequestBody Category category) {
		return categoryRepository.save(category);
	}
}
