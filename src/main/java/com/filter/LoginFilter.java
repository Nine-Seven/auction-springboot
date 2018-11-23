package com.filter;

import com.entity.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName ="Login",urlPatterns="/private/*")
public class LoginFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig){

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpSession session =((HttpServletRequest)request).getSession();
        User user = (User) session.getAttribute("login");
		if (user != null) {
			chain.doFilter(request, response);
		} else {
			String contextPath = ((HttpServletRequest) request).getContextPath();
			((HttpServletResponse)response).sendRedirect(contextPath+"/login.jsp");
		}
	}

	@Override
	public void destroy() {

	}

}
