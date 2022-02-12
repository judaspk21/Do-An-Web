package com.example.demo.service;

import com.example.demo.model.Customer;

public interface CustomerService {
	Customer getCustomer();
	boolean Register(Customer customer);
	boolean Logout(int customer_id);
	boolean Login(String phone, String password);
	boolean isCustomerLogin();
}
