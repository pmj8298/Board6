package com.board.intercepter;

import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginCheckIntercepter implements HandlerInterceptor{

	@Override
	public boolean preHandle(
			HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler)
			throws Exception {
		
		// 1. 세션에서 회원정보를 검색
		HttpSession session  = request.getSession();
		//UserVo userVo = session.getAttribute("login"); -부모를 자식에게 넘겨 줄 수 없음
		Object obj = session.getAttribute("login");
		
		// 요청한 주소정보 확인
		String requestUrl = request.getRequestURL().toString();
		// /login 페이지는 체크에서 제외한다
		if(requestUrl.contains("/login")) {
			return true;
		}
		
		//---------------------------------------------------
		if(obj == null) {
			// 로그인되어 있지 않다면 /loginForm 으로 이동
			response.sendRedirect("/loginForm");
			return false;
		}
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}

}
