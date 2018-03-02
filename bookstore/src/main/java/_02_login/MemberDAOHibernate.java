package _02_login;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Repository;

import model.spring.SpringJavaConfiguration;

@Repository
public class MemberDAOHibernate implements MemberBeanDAO {
	
	public static void main(String[] args) {
		
		ApplicationContext context =
				new AnnotationConfigApplicationContext(SpringJavaConfiguration.class);

		MemberDAOHibernate dao = (MemberDAOHibernate) context.getBean("memberDAOHibernate");
	   System.out.println(dao.select(1));
		
		((ConfigurableApplicationContext) context).close();
	}
	
	
	
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public MemberBean select(Integer id) {
		return this.getSession().get(MemberBean.class, id);
	}
	
	@Override
	public MemberBean selectByEmail(String email){
		Query<MemberBean> query =this.getSession().createQuery("From MemberBean Where email=?", MemberBean.class);
		query.setParameter(0, email);
		//uniqueReslut回傳值根據select參數的型別，如果只有單一個參數以該參數型別為準.
		//select id from MemberBean where email=? 會回傳integer
		
		return query.uniqueResult();
		
	}
	
	@Override
	public List<MemberBean> select(){
	
//		this.getSession().createQuery("select id From MemberBean Where email=?", MemberBean.class);
//		query.setParameter(0, email);
//		System.out.println(query.uniqueResult());
		return this.getSession().createQuery(
				"From MemberBean", MemberBean.class).list();
		
	}
	
}
