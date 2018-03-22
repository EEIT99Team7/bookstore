package model.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import model.ReviewBean;

@Repository
@Transactional
public class ReviewDAOHibernate {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	// 全部書評
	public List<ReviewBean> select() {
		return this.getSession().createQuery("From ReviewBean", ReviewBean.class).list();
	}

	// 單一書評
	public ReviewBean select(Integer reviewId) {
		return this.getSession().get(ReviewBean.class, reviewId);
	}

	// 單一書評(memID, bookId)
	public ReviewBean select(Integer memID, Integer bookId) {
		return this.getSession().createQuery("From ReviewBean where bookId ='" + bookId + "' and memID='" + memID + "'",
				ReviewBean.class).uniqueResult();
	}

	// 會員評過書評
	public List<Object[]> selectByMemId(Integer memID) {
		return (List<Object[]>) (this.getSession().createQuery(
				"select p.title,r.content,r.make,r.score,r.reviewId,r.statusNo From ReviewBean r JOIN ProductBean p ON r.bookId =p.bookId where r.statusNo = true and r.memID ='"
						+ memID + "'",
				Object[].class).list());
	}

	// 書的所有評論
	public List<Object[]> selectByBookId(Integer bookId) {
		return (List<Object[]>) (this.getSession().createQuery(
				"SELECT m.nickName,r.content,r.make,r.score,r.reviewId,m.memId From ReviewBean r JOIN MemberBean m ON r.memID =m.memId  where r.statusNo = true and r.bookId ='"
						+ bookId + "'",
				Object[].class).list());
	}

	// 新增書評
	public ReviewBean insert(ReviewBean bean) {
		if (bean != null) {
			ReviewBean temp = this.getSession()
					.createQuery("From ReviewBean where bookId =? and memId=?", ReviewBean.class)
					.setParameter(0, bean.getBookId()).setParameter(1, bean.getMemID()).uniqueResult();
			if (temp == null) {
				this.getSession().save(bean);
				return bean;
			} else {
				System.out.println("不能重複評論書評");
			}
		}
		return null;
	}

	// 刪除書評
	public boolean delete(Integer reviewId) {
		ReviewBean result = this.getSession().get(ReviewBean.class, reviewId);
		if (result != null) {
			this.getSession().delete(result);
			System.out.println("deleted.");
			return true;
		}
		return false;
	}

	// 修改書評
	public ReviewBean update(Integer reviewId, String content) {
		ReviewBean result = this.getSession().get(ReviewBean.class, reviewId);
		if (result != null) {
			result.setContent(content);
			result.setMake(new Date());
		}
		return result;
	}

	// 切換書評狀態
	public ReviewBean changeStatus(Integer reviewId) {
		ReviewBean result = this.getSession()
				.createQuery("From ReviewBean where	reviewId='" + reviewId + "'", ReviewBean.class).uniqueResult();
		if (result.isStatusNo() == true) {
			result.setStatusNo(false);
			return result;
		} else if (result.isStatusNo() == false) {
			result.setStatusNo(true);
			return result;
		}
		return result;
	}

	// // 切換書評狀態
	// public boolean changeStatus(Integer reviewId) {
	// Boolean result = this.getSession()
	// .createQuery("Select statusNo From ReviewBean where reviewId ='" + reviewId +
	// "'", Boolean.class)
	// .uniqueResult();
	// if (result == true) {
	// return false;
	// } else {
	// return true;
	// }
	// }

	// // 計算平均星星數
	// public Double avgScore(Integer bookId) {
	// return this.getSession()
	// .createQuery("Select avg(cast(score as double)) From ReviewBean where bookId
	// ='" + bookId + "'",
	// Double.class)
	// .uniqueResult();
	// }
	//
	// // 加總按讚數
	// public Long sumLike(Integer bookId) {
	// return this.getSession()
	// .createQuery("Select sum(goodlike) From ReviewBean where bookId ='" + bookId
	// + "'", Long.class)
	// .uniqueResult();
	// }

}
