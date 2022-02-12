package com.example.demo.validator;

import java.util.List;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;

import com.example.demo.Repository.categoryRepository;
import com.example.demo.model.Category;

public class CheckValidator implements ConstraintValidator<CheckID, Category> {
	@Autowired
	categoryRepository categoriesResponsitory;

	@Override
	public boolean isValid(Category category, ConstraintValidatorContext context) {
		if (categoriesResponsitory == null)
			return true;
		if (categoriesResponsitory.findById(category.getCategogyId()).isEmpty()) {
			return false;
		}
		return true;
	}
}
