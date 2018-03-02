package model;

import java.sql.Blob;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ADVERTISEMENT")
public class AdverBean {
//首頁廣告
	@Id
	private Integer id;
	private String imgName;
	private Blob adverImage;
	private Boolean status;
	
	
	public AdverBean() {
	
	}
	public AdverBean(Integer id, String imgName, Blob adverImage, Boolean status) {
		super();
		this.id = id;
		this.imgName = imgName;
		this.adverImage = adverImage;
		this.status = status;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getImgName() {		
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public Blob getAdverImage() {
		return adverImage;
	}
	public void setAdverImage(Blob adverImage) {
		this.adverImage = adverImage;
	}
	
	public Boolean getStatus() {
		return status;
	}
	public void setStatus(Boolean status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "AdverBean [id=" + id + ", imgName=" + imgName + "]";
	}
	
	
	
}
