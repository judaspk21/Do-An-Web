package com.example.demo.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.Repository.ProductRepository;
import com.example.demo.model.GioHang;
import com.example.demo.model.Product;




@Service
public class CategoryServiceImpl implements GioHangService {
	
	@Autowired
	private GioHang gioHang;
	
	public GioHang getGioHang() {
		return gioHang;
	}

	@Autowired
	ProductRepository productRepository;

	@Override
	public void themSanPham(int productId) {
		Product product = productRepository.findById(productId).get();
		if (gioHang.getChiTietGioHang().containsKey(product)) {
			int count = gioHang.getChiTietGioHang().get(product);
			gioHang.getChiTietGioHang().replace(product, count + 1);
		} else {
			gioHang.getChiTietGioHang().put(product, 1);
		}
	}
	
	
	@Override
	public void truSanPham(int productId) {
		Product product = productRepository.findById(productId).get();
		if (gioHang.getChiTietGioHang().containsKey(product)) {
			int count = gioHang.getChiTietGioHang().get(product);
			gioHang.getChiTietGioHang().replace(product, count - 1);
		}
	}
	
	@Override
	public void xoaSanPham(int productId) {
		Product product = productRepository.findById(productId).get();
		if (gioHang.getChiTietGioHang().containsKey(product)) {
			gioHang.getChiTietGioHang().remove(product);
		}
	}
}
