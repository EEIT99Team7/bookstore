package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "likeStatus")
public class LikeBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer likeId;
	private Integer reviewId;
	private boolean memlike;
	private Integer memID;


	@Override
	public String toString() {
		return "LikeBean [likeId=" + likeId + ", reviewId=" + reviewId + ", memlike=" + memlike + ", memID=" + memID
				+ "]";
	}
	
	
	public Integer getLikeId() {
		return likeId;
	}
	public void setLikeId(Integer likeId) {
		this.likeId = likeId;
	}
	public Integer getReviewId() {
		return reviewId;
	}
	public void setReviewId(Integer reviewId) {
		this.reviewId = reviewId;
	}
	public boolean isMemlike() {
		return memlike;
	}
	public void setMemlike(boolean memlike) {
		this.memlike = memlike;
	}
	public Integer getMemID() {
		return memID;
	}
	public void setMemID(Integer memID) {
		this.memID = memID;
	}
	
	
}
