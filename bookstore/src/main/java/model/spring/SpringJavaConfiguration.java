package model.spring;

import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import _04_ShoppingCart.model.OrderBean;
import _04_ShoppingCart.model.OrderItemBean;
<<<<<<< HEAD
import model.BookcaseBean;
import model.BookstatusBean;
import model.CollectionBean;
import model.LikeBean;
=======
import model.CustomerServiceBean;
>>>>>>> branch 'master' of https://github.com/EEIT99Team7/bookstore.git
import model.MemberBean;
import model.ProductBean;
import model.ReviewBean;

@Configuration
@ComponentScan(basePackages = {"model","_04_ShoppingCart.model"})
@EnableTransactionManagement
public class SpringJavaConfiguration {
	@Bean
	public DataSource dataSource() {
		try {
			Context ctx = new InitialContext();
			return (DataSource) ctx.lookup("java:comp/env/jdbc/xxx");
		} catch (NamingException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Bean
	public SessionFactory sessionFactory() {
		LocalSessionFactoryBuilder builder = new LocalSessionFactoryBuilder(dataSource());
		Properties props = new Properties();
		props.setProperty("hibernate.dialect", "org.hibernate.dialect.SQLServerDialect");
		props.setProperty("hibernate.show_sql", "true");
//		props.setProperty("hibernate.current_session_context_class", "thread");
		builder.addProperties(props);

		builder.addAnnotatedClasses(MemberBean.class,ProductBean.class,OrderBean.class,OrderItemBean.class,BookcaseBean.class,CollectionBean.class,BookstatusBean.class,ReviewBean.class,LikeBean.class,CustomerServiceBean.class);

		builder.addAnnotatedClasses(MemberBean.class,ProductBean.class,OrderBean.class,OrderItemBean.class);
		
		return builder.buildSessionFactory();
	}
	
	@Bean
	public HibernateTransactionManager transactionManager() {
		System.out.println("HibernateTransactionManager");
		return new HibernateTransactionManager(sessionFactory());
	}
	
	//Spring檔案上傳元件
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setDefaultEncoding("utf-8");
		resolver.setMaxUploadSize(1024*1024*500);
		return resolver;
	}
	
}
