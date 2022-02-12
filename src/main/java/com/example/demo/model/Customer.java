package com.example.demo.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Entity(name="customer")
public class Customer {
	@Id
	@GeneratedValue	
	private int customerId;
	
	@NotNull 
	@NotBlank(message = "Tên khách hàng không được để trống!")
	@Size(max = 50, message = "Tên khách hàng không được nhiều hơn 50 ký tự!")
	private String name;
	
	@NotNull
	@NotBlank(message = "Số điện thoại không được để trống")
	@Size(max = 10, message = "Số điện thoại không được quá 10 ký tự!")
	private String phone;
	
	@NotNull
	@NotNull(message = "Email không được để trống!")
	/*
	 * @Pattern(regexp = "^([\\w-\\.]+){1,64}@([\\w&&[^_]]+){2,255}.[a-z]{2,}$",
	 * message = "Sai định dạng email!")
	 */
	private String email;
	
	@NotNull	
	@NotBlank(message = "Địa chỉ nhận hàng không được để trống!")
	private String address;
	
	@NotNull	
	@NotBlank(message = "Địa chỉ nhận hàng không được để trống!")
	private String note;

	@Size(min = 6, message = "Mật khẩu phải trên 5 ký tự!")
	private String password;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "customer", cascade = CascadeType.ALL)
	private List<Order> order;

	public Customer(int customerId,
			@NotNull @NotBlank(message = "Tên khách hàng không được để trống!") @Size(max = 50, message = "Tên khách hàng không được nhiều hơn 50 ký tự!") String name,
			@NotNull @NotBlank(message = "Số điện thoại không được để trống") @Size(max = 10, message = "Số điện thoại không được quá 10 ký tự!") String phone,
			@NotNull @NotNull(message = "Email không được để trống!") String email,
			@NotNull @NotBlank(message = "Địa chỉ nhận hàng không được để trống!") String address,
			@NotNull @NotBlank(message = "Địa chỉ nhận hàng không được để trống!") String note,
			@Size(min = 6, message = "Mật khẩu phải trên 5 ký tự!") String password, List<Order> order) {
		super();
		this.customerId = customerId;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.note = note;
		this.password = password;
		this.order = order;
	}

	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public List<Order> getOrder() {
		return order;
	}

	public void setOrder(List<Order> order) {
		this.order = order;
	}
	
	
	
	
	
	

	
	
	
	
	
	
}
