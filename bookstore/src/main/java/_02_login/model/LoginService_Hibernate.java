package _02_login.model;
 
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _01_register.model.MemberBean;

@Repository("loginServiceDB")
public class LoginService_Hibernate implements ILoginServiceDAO {
	
	@Autowired
	SessionFactory factory;
	
	public LoginService_Hibernate()  {
	}

	public MemberBean checkIDPassword(String userId, String password) {
		// 檢查userId與password是否正確
		MemberBean mb = null;
		String hql = "from MemberBean m WHERE m.memberId = ? and m.password = ?";
		@SuppressWarnings("unchecked")
		List<MemberBean> list = (List<MemberBean>) getSession().createQuery(hql)
				.setParameter(0, userId)
				.setParameter(1, password).getResultList();
		        
		if ( list != null && list.size() > 0){
			mb = list.get(0);
		}
		return mb;
	}

	public Session getSession(){
		return factory.openSession();
	}
}
