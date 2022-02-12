package com.example.demo.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.Customer;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface CustomerRepository extends JpaRepository<Customer, Integer> {
//	Search theo category
	@Query(value = "select * from customer where customer.phone = :phone and customer.password = :password", nativeQuery = true)
	Customer login(@Param(value = "phone") String phone, @Param(value = "password") String password);
}
