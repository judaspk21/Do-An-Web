package com.example.demo.model;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity(name = "order_items")
public class OrderItems {
	@Id
	@GeneratedValue
	private int id;

	@ManyToOne
	@JoinColumn(name = "products_id", nullable = false, foreignKey = @ForeignKey(name = "products_orderitems"))
	Product product;

	// khong lien quan den product hien tai, thong tin rieng cua orderItem
	int amount;
	double total;
	String name;
	double price;

	@ManyToOne
	@JoinColumn(name = "order_id", nullable = false, foreignKey = @ForeignKey(name = "order_orderitems"))
	Order order;

	public OrderItems(int id, Product product, int amount, double total, String name, double price, Order order) {
		super();
		this.id = id;
		this.product = product;
		this.amount = amount;
		this.total = total;
		this.name = name;
		this.price = price;
		this.order = order;
	}

	public OrderItems() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}
	
	
}
