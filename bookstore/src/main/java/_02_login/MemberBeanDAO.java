package _02_login;

import java.util.List;

import org.hibernate.Session;

public interface MemberBeanDAO {

	Session getSession();

	MemberBean select(Integer id);

	MemberBean selectByEmail(String email);

	List<MemberBean> select();

}