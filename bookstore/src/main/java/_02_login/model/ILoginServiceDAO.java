package _02_login.model;

import _01_register.model.MemberBean;

public interface ILoginServiceDAO {
	public MemberBean checkIDPassword(String userId, String password) ;
}
