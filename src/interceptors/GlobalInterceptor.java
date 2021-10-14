package interceptors;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class GlobalInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	ServletContext application;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("Global Interceptor preHandler()");
		
		// DEFAULT PAGE LINKS
		application.setAttribute("dashboardPage", "admin/dashboard.html");
		application.setAttribute("loginInPage", "admin/log-in.html");
		application.setAttribute("registerPage", "admin/register.html");
		application.setAttribute("resetPasswordPage", "admin/reset-password.html");
		application.setAttribute("forgotPasswordPage", "admin/forgot-password.html");
		application.setAttribute("productPage", "admin/product.html");	
		application.setAttribute("productDetailPage", "product-detail.html");
		application.setAttribute("signInPage", "sign-in.html");
		application.setAttribute("signUpPage", "sign-up.html");
		application.setAttribute("shoppingCartPage", "shopping-cart.html");
		return true;
		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("Global Interceptor postHandler()");
		HttpSession session = request.getSession();
		session.setAttribute("title", "Lab 7");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("Global Interceptor afterCompletion()");
	}
}