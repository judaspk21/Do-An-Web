package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.Repository.CustomerRepository;
import com.example.demo.model.Customer;

@Service
public class CustomerServiceImpl  implements CustomerService {
	@Autowired
	CustomerRepository customerRepository;

	@Autowired
	CustomerSession customerSession;

	@Override
	public Customer getCustomer() {
		return customerSession.getCustomer();
	}
	@Override
	public boolean Register(Customer customer) {
		Customer customerSave = customerRepository.save(customer);

		if (customerSave != null) {
			customerSession.setCustomer(customerSave);
			return true;
		}
		return false;
	}

	@Override
	public boolean Logout(int customer_id) {
		customerSession.setCustomer(null);
		return true;
	}

	@Override
	public boolean Login(String phone, String password) {
		Customer customer = customerRepository.login(phone, password);
		if(customer != null) {
			customerSession.setCustomer(customer);
			return true;
		}
		return false;
	}
	
	@Override
	public boolean isCustomerLogin() {
		return customerSession.getCustomer() != null;
	}
}
