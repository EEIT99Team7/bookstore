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
import model.ProductBean;

@Repository
@Transactional
public class AdverDaoJdbc implements Serializable {

	private static final long serialVersionUID = 1L;

	@Autowired
	private DataSource dataSource;

	public long getRecordCounts() {
		long count = 0; // 必須使用 long 型態
		String sql = "select count(*) from ADVERTISEMENT WHERE status=?";
		try (Connection connection = dataSource.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(sql);){
			pstmt.setBoolean(1, true);
			try(ResultSet rs = pstmt.executeQuery();){
				if (rs.next()) {
					count = rs.getLong(1);
				}
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return count;
	}

	public AdverBean queryAdById(Integer Id) {
		
		AdverBean bean = null;
		String sql = "SELECT id,imgName,adverImage,status FROM ADVERTISEMENT WHERE Id=? ";
		try (Connection connection = dataSource.getConnection(); 
			PreparedStatement ps = connection.prepareStatement(sql);) 
		{
			ps.setInt(1, Id);
			try (ResultSet rs = ps.executeQuery();) {
				if (rs.next()) {
					bean = new AdverBean();
					bean.setId(rs.getInt(1));
					bean.setImgName(rs.getString(2));
					bean.setAdverImage(rs.getBlob(3));					
					bean.setStatus(rs.getBoolean(4));
				}
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);

		}
		return bean;
	}
	
	public List<AdverBean> getAdvertisements() {
		List<AdverBean> list = new ArrayList<AdverBean>();
		String sql = "SELECT id,imgName,adverImage,status FROM ADVERTISEMENT WHERE status=?";
		//

		try (Connection connection = dataSource.getConnection();
				PreparedStatement ps = connection.prepareStatement(sql);) {
			ps.setBoolean(1, true);
			try (ResultSet rs = ps.executeQuery();) {
				// 只要還有紀錄未取出，rs.next()會傳回true
				while (rs.next()) {
					AdverBean bean = new AdverBean(); // 準備一個新的BookBean
					bean.setId(rs.getInt(1));
					bean.setImgName(rs.getString(2));
					bean.setAdverImage(rs.getBlob(3));
					bean.setStatus(rs.getBoolean(4));
					// 最後將BookBean物件放入大的容器內
					list.add(bean);
				}
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);

		}
		return list;
	}
	
	public List<AdverBean> getAdvertisementsAll() {
		List<AdverBean> list = new ArrayList<AdverBean>();
		String sql = "SELECT id,imgName,adverImage,status FROM ADVERTISEMENT";
		
		try (Connection connection = dataSource.getConnection();
				PreparedStatement ps = connection.prepareStatement(sql);) {
			try (ResultSet rs = ps.executeQuery();) {
				// 只要還有紀錄未取出，rs.next()會傳回true
				while (rs.next()) {
					AdverBean bean = new AdverBean(); // 準備一個新的BookBean
					bean.setId(rs.getInt(1));
					bean.setImgName(rs.getString(2));
					bean.setAdverImage(rs.getBlob(3));
					bean.setStatus(rs.getBoolean(4));
					// 最後將BookBean物件放入大的容器內
					list.add(bean);
				}
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);

		}
		return list;
	}

	public int updateAdver(AdverBean bean, long sizeInBytes) {
		int n = 0;
		String sql = "UPDATE ADVERTISEMENT SET imgName = ?,  adverImage = ?,  status = ? WHERE Id = ?";
		if (sizeInBytes == -1) { // 不修改圖片
			n = updateAdver(bean);
			return n;
		}
		try (Connection connection = dataSource.getConnection();
				PreparedStatement ps = connection.prepareStatement(sql);) {
			ps.setString(1, bean.getImgName());
			ps.setBlob(2, bean.getAdverImage());
			ps.setBoolean(3, bean.getStatus());
			ps.setInt(4, bean.getId());
			n = ps.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return n;
	}
	
	public int updateAdver(AdverBean bean) {
		int n = 0;
		String sql = "UPDATE ADVERTISEMENT SET imgName = ?,status = ? WHERE Id = ?";

		try (Connection connection = dataSource.getConnection();
				PreparedStatement ps = connection.prepareStatement(sql);) {
			ps.clearParameters();
			ps.setString(1, bean.getImgName());
			ps.setBoolean(2, bean.getStatus());
			ps.setInt(3, bean.getId());
			n = ps.executeUpdate();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return n;
	}
	
	public int insertAdv(AdverBean bean) {
		int n = 0;		
		String sql = "INSERT INTO ADVERTISEMENT (imgName, adverImage, status) VALUES (?, ?, ?)";
		try (
			Connection connection = dataSource.getConnection();
			PreparedStatement pStmt = connection.prepareStatement(sql);
		) {
			pStmt.setString(1, bean.getImgName());
			pStmt.setBlob(2, bean.getAdverImage());
			pStmt.setBoolean(3, bean.getStatus());
			n = pStmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return n;
	}
	
	
	// 依AdverID來刪除單筆記錄
	public int deleteAdver(int no) {
		int n = 0;
		String sql = "DELETE FROM ADVERTISEMENT WHERE Id = ?";
		try (
			Connection connection = dataSource.getConnection(); 
			PreparedStatement pStmt = connection.prepareStatement(sql);
		) {
			pStmt.setInt(1, no);
			n = pStmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return n;
	}

	
}
