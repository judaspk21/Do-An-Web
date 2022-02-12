package com.example.demo.model;


import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import com.example.demo.validator.CheckID;

import javax.validation.constraints.*;

@Entity(name="product")
public class Product {
	@Id
	@GeneratedValue	
	private int productId;
	
	@NotNull 
	@NotBlank (message = "Tên sản phẩm không được bỏ trống....")	
	@Size(min = 3, max = 50, message = "Bắt đầu bằng 3 và tối đa là 50 kí tự")
	private String name;
	
	@NotNull
	@Size(min = 3, max = 300, message = "")
	@NotBlank (message = " Url hình ảnh không được bỏ trống....")	
	/*
	 * @Pattern(regexp = "(http(s?):)([/|.|\\w|\\s|-])*\\.(?:jpg|gif|png)" , message
	 * = "Không đúng định dạnh ảnh (.jpg.png....)")
	 */
	private String image;
	
	@NotNull
	@NotBlank (message = " Mô tả không được để trống..")	
	private String description;
	
	
	
	@NotNull
	@Min(value = 1000, message = " Giá thấp nhất là 1.000 vnđ !!!!")
	@Max(value = 2000000, message = "Giá cao nhất là 2000000 vnđ !!!")
	private  long price;
	@CheckID
	@ManyToOne
	@JoinColumn(
			name = "category_id",
			nullable = true,
			foreignKey = @ForeignKey(name = "category_products"))
	private Category category;

	
	
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Product(int productId, @NotNull @Size(min = 3, max = 30) String name,
			@NotNull @Size(min = 3, max = 300) String image, @NotNull @Size(min = 3, max = 300) String description,
			@NotNull @Min(1000) @Max(1000000) long price, Category category) {
		super();
		this.productId = productId;
		this.name = name;
		this.image = image;
		this.description = description;
		this.price = price;
		this.category = category;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public long getPrice() {
		return price;
	}

	public void setPrice(long price) {
		this.price = price;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Product) {
			Product cProduct = (Product)obj;
			return this.productId == cProduct.getProductId();
		}
		return false;
	}
	 
	@Override
	public int hashCode() {
		return productId;
	}
	
	
	
}
