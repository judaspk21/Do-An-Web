package com.example.demo.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.OrderItems;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
public interface OrderItemsRepository extends JpaRepository<OrderItems, Integer> {
	@Query(value = "select * from order_items where order_id = :order_id", nativeQuery = true)
	List<OrderItems> findOrderItems(@Param(value = "order_id") int orderID);
}
