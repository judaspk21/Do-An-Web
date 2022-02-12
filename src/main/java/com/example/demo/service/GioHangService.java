package com.example.demo.service;

import com.example.demo.model.GioHang;

public interface GioHangService {
	public GioHang getGioHang();
	public void themSanPham(int productId);
	public void truSanPham(int productId);
	public void xoaSanPham(int productId);
	
	

}
