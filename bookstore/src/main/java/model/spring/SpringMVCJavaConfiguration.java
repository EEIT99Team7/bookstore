package model.spring;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.support.ServletContextResource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.XmlViewResolver;

@Configuration
@ComponentScan(basePackages = { "controller" })
@EnableWebMvc
public class SpringMVCJavaConfiguration implements WebMvcConfigurer {
	// @Bean
	// public MessageSource messageSource() {
	// ResourceBundleMessageSource rbms = new ResourceBundleMessageSource();
	// rbms.setBasename("i18n.message");
	// return rbms;
	// }
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// registry.addInterceptor(
		// new DemoHandlerInterceptor()).addPathPatterns("/secure/*");
	}

	@Autowired
	private ServletContext applicaton;

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		ServletContextResource resource = new ServletContextResource(applicaton, "/WEB-INF/views.xml");
		
		//開啟 xmlViewResolver,並給定views.xml位置
		XmlViewResolver viewResolver = new XmlViewResolver();
		// location 需要使用resource型別資料傳入
		viewResolver.setLocation(resource);
		//設定優先順序
		viewResolver.setOrder(10);
		//註冊 xmlViewResolver
		registry.viewResolver(viewResolver);
	}
	

}
