package com.example.demo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.example.demo.model.GioHang;
@Component
public class GioHangIterceptor implements HandlerInterceptor {

	@Autowired
	private GioHang gioHang;

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response,
			Object handler)
	throws Exception {
		// nếu giỏ hàng trống thì chuyển về trang chủ
		if (gioHang.getChiTietGioHang().size() == 0) {
			response.sendRedirect("index");
			return false;
		}
		return true;
	}
	
}
