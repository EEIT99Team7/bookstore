package model.spring;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class DispatcherServletRegister extends AbstractAnnotationConfigDispatcherServletInitializer {
	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] {model.spring.SpringMVCJavaConfiguration.class};
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] {"*.controller","/aioCheckOutOneTime","/resetpassword"};
	}
	
	@Override
	protected Class<?>[] getRootConfigClasses() {
		return null;
	}
	
	//過濾器：所有httpRequest都變成UTF-8編碼
//	@Override
//	protected Filter[] getServletFilters() {
//		return new Filter[]{new EncodingFilter()};
//	}
	
}
