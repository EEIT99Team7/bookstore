package model.dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import model.AdverBean;
import model.CategoryBean;
import model.ProductBean;

@Repository
@Transactional
public class CategoryDaoJdbc implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private DataSource dataSource;

//	CompanyService cbDao = new CompanyServiceImpl();  
	
//	int cId  = Integer.parseInt(companyID);
//	cbDao.setId(cId);
//	CompanyBean cb = cbDao.getCompanyById();
	
	private String tagName = "";
	private int selected = -1; 
		
	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	
	
	public int getSelected() {
		return selected;
	}

	public void setSelected(int selected) {
		this.selected = selected;
	}

	public CategoryBean getCategoryById(Integer bookNo) {
		
		CategoryBean bean = null;
		String sql = "SELECT bookNo,c_name FROM CATEGORY WHERE bookNo=? ";
		try (Connection connection = dataSource.getConnection(); 
			PreparedStatement ps = connection.prepareStatement(sql);) 
		{
			ps.setInt(1, bookNo);
			try (ResultSet rs = ps.executeQuery();) {
				if (rs.next()) {
					bean = new CategoryBean();
					bean.setBookNo(rs.getInt(1));
					bean.setC_name(rs.getString(2));
										
				}
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);

		}
		return bean;
	}
	
	
	public List<CategoryBean> getCategory() {
		List<CategoryBean> list = new ArrayList<>();
		String sql = "SELECT bookNo,c_name FROM CATEGORY";
		try (Connection connection = dataSource.getConnection(); 
			PreparedStatement ps = connection.prepareStatement(sql);) 
		{
			try (ResultSet rs = ps.executeQuery();) {
				while (rs.next()) {
					CategoryBean bean = new CategoryBean();
					bean.setBookNo(rs.getInt(1));
					bean.setC_name(rs.getString(2));
					list.add(bean);					
				}
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);

		}
		return list;
	}
	
	
	public String getSelectTag() {
		String ans = "";
		List<CategoryBean> cb = getCategory();
		ans += "<SELECT class='form-control' name='" + getTagName() + "'>";
		for (CategoryBean bean : cb) {
			int id = bean.getBookNo();
			String name = bean.getC_name();
			if (id == selected) {
				ans += "<option value='" + id + "' selected>" + name + "</option>";
			} else {
				ans += "<option value='" + id + "'>" + name + "</option>";
			}
		}
		ans += "</SELECT>";
		return ans;
	}
	
}
