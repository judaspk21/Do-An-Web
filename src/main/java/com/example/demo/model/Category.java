package com.example.demo.model;

import java.util.List;

import javax.annotation.Generated;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Entity(name="category")
public class Category {
	@Id
	@GeneratedValue
	@Column(name ="c_id")
	private int categogyId;
	
	
	@NotNull
	@NotBlank (message = "Tên danh mục không được để trống !!!")
	@Column(name = "c_name")
	private String name;

	@OneToMany(fetch = FetchType.LAZY
			, mappedBy = "category",
			cascade = CascadeType.ALL)
	private List<Product> product;
	
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Category(int categogyId, String name) {
		super();
		this.categogyId = categogyId;
		this.name = name;
	}

	public int getCategogyId() {
		return categogyId;
	}

	public void setCategogyId(int categogyId) {
		this.categogyId = categogyId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public List<Product> getProducts() {
		return product;
	}

	public void setProducts(List<Product> product) {
		this.product = product;
	}
	
	
}
