package com.example.demo;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;

import com.example.demo.interceptor.GioHangIterceptor;

@Configuration
public class IterceptorCongfig implements WebMvcConfigurer {
	@Autowired
	GioHangIterceptor gioHangIterceptor;

	@Bean("localeResolver")
	public LocaleResolver getLocaleResolver() {
		CookieLocaleResolver clr = new CookieLocaleResolver();
		clr.setDefaultLocale(new Locale("vi"));
		clr.setCookiePath("/");
		clr.setCookieMaxAge(60 * 60);
		return clr;
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(gioHangIterceptor).addPathPatterns("/chekout", "/chekout");

		// set da ngon ngu
		LocaleChangeInterceptor lci = new LocaleChangeInterceptor();
		lci.setParamName("lang");
		registry.addInterceptor(lci);
	}
}
