package com.example.demo.model;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Transient;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity(name = "orders")
public class Order {
	@Id
	@GeneratedValue
	private int id;

	@NotNull
	private Date created = new Date((new java.util.Date()).getTime());
	@ManyToOne
	@JoinColumn(name = "customer_id", nullable = false, foreignKey = @ForeignKey(name = "id"))
	Customer customer;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "order", cascade = CascadeType.ALL)
	private List<OrderItems> order_items;

	@NotNull
	@NotBlank(message = "Địa chỉ nhận hàng không được để trống!")
	private String address;

	@NotNull
	@NotBlank(message = "Số điện thoại không được để trống")
	@Size(max = 10, message = "Số điện thoại không được quá 10 ký tự!")
	private String phone;

	@NotBlank(message = "Tên khách hàng không được để trống!")
	@Size(max = 50, message = "Tên khách hàng không được nhiều hơn 50 ký tự!")
	private String name;
	
	
	private String email;


	public Order(int id, @NotNull Date created, Customer customer, List<OrderItems> order_items,
			@NotNull @NotBlank(message = "Địa chỉ nhận hàng không được để trống!") String address,
			@NotNull @NotBlank(message = "Số điện thoại không được để trống") @Size(max = 10, message = "Số điện thoại không được quá 10 ký tự!") String phone,
			@NotBlank(message = "Tên khách hàng không được để trống!") @Size(max = 50, message = "Tên khách hàng không được nhiều hơn 50 ký tự!") String name,
			String email) {
		super();
		this.id = id;
		this.created = created;
		this.customer = customer;
		this.order_items = order_items;
		this.address = address;
		this.phone = phone;
		this.name = name;
		this.email = email;
	}


	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	@Transient
	float total;

	public float getTotal(List<OrderItems> orderItems) {
		float total = 0;
		int size = orderItems.size();
		for (int i = 0; i < size; i++) {
			OrderItems orderItem = orderItems.get(i);
			total += (orderItem.getPrice() * orderItem.getAmount());
		}
		return total;
	}

	public float getTotal() {
		float total = 0;
		int size = this.order_items.size();
		for (int i = 0; i < size; i++) {
			OrderItems orderItem = order_items.get(i);
			total += (orderItem.getPrice() * orderItem.getAmount());
		}
		return total;
	}
	
	public void setTotal(float total) {
		this.total = total;
	}
	


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public Date getCreated() {
		return created;
	}


	public void setCreated(Date created) {
		this.created = created;
	}


	public Customer getCustomer() {
		return customer;
	}


	public void setCustomer(Customer customer) {
		this.customer = customer;
	}


	public List<OrderItems> getOrder_items() {
		return order_items;
	}


	public void setOrder_items(List<OrderItems> order_items) {
		this.order_items = order_items;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}

	
	
	
	

}
