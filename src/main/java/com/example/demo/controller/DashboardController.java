package com.example.demo.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("admin")
public class DashboardController {
	
	@GetMapping("dashboard")
	public String showindex() {
		return "admin/dashboard";
	}
	
	@GetMapping("menu")
	public String showmeu() {
		return "admin/menu";
	}
	
}
