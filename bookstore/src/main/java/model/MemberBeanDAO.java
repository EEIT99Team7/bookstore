package model;

import java.util.List;

import org.hibernate.Session;

import model.MemberBean;

public interface MemberBeanDAO {

	Session getSession();

	MemberBean select(Integer id);

	MemberBean selectByEmail(String email);

	List<MemberBean> select();

}