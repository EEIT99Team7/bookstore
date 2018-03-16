package model.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import model.LikeBean;

@Repository
@Transactional
public class LikeDAOHibernate {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	// 檢查
	public Long checkmemlike(Integer reviewId, Integer memID) {
		return this.getSession()
				.createQuery("Select count(memlike) From LikeBean where reviewId ='" + reviewId + "' and memID='" + memID + "'",
						Long.class)
				.uniqueResult();
	}

	// 按讚
	public LikeBean check(LikeBean bean) {
		if (bean != null) {
			LikeBean temp = this.getSession().createQuery("From LikeBean where reviewId =? and memID=?", LikeBean.class)
					.setParameter(0, bean.getReviewId()).setParameter(1, bean.getMemID()).uniqueResult();
			if (temp == null) {
				bean.setMemlike(true);
				this.getSession().save(bean);
				return bean;
			} else {
				System.out.println("不能重複按讚");
			}
		}
		return null;
	}

	// 取消讚
	public boolean delete(LikeBean bean) {
		LikeBean temp = this.getSession().createQuery("From LikeBean where reviewId =? and memID=?", LikeBean.class)
				.setParameter(0, bean.getReviewId()).setParameter(1, bean.getMemID()).uniqueResult();
		if (temp != null) {
			this.getSession().delete(temp);
			System.out.println("無資料");
			return true;
		}
		return false;
	}

	// 加總按讚數
	public Long sumLike(Integer reviewId) {
		return this.getSession()
				.createQuery("Select count(*) From LikeBean where reviewId ='" + reviewId + "'", Long.class)
				.uniqueResult();
	}
}
