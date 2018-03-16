package model;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Review")
public class ReviewBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer reviewId;
	private Integer bookId;
	private Integer memID;
	private java.util.Date make;
	private String content;
	private Integer score;
	private Integer goodlike;
	private boolean statusNo;
	
	@Override
	public String toString() {
		return "ReviewBean [reviewId=" + reviewId + ", bookId=" + bookId + ", memID=" + memID + ", make=" + make
				+ ", content=" + content + ", score=" + score + ", goodlike=" + goodlike + ", statusNo=" + statusNo
				+ "]";
	}

	public Integer getReviewId() {
		return reviewId;
	}

	public void setReviewId(Integer reviewId) {
		this.reviewId = reviewId;
	}

	public Integer getBookId() {
		return bookId;
	}

	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}

	public Integer getMemID() {
		return memID;
	}

	public void setMemID(Integer memID) {
		this.memID = memID;
	}

	public java.util.Date getMake() {
		return make;
	}
	
	public void setMake(java.util.Date make) {
		this.make = make;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public Integer getGoodlike() {
		return goodlike;
	}

	public void setGoodlike(Integer goodlike) {
		this.goodlike = goodlike;
	}

	public boolean isStatusNo() {
		return statusNo;
	}

	public void setStatusNo(boolean statusNo) {
		this.statusNo = statusNo;
	}

	

}
