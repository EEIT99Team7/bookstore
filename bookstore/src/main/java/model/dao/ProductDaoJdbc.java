package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.ProductBean;

@Repository
public class ProductDaoJdbc {

	@Autowired
	private DataSource dataSource;

	private int bookId = 0;

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public List<ProductBean> selectAll() {
		List<ProductBean> list = new ArrayList<ProductBean>();
//		String sql = "SELECT bookId,title,[content],author,press,price,stock,bookNo,coverImage FROM PRODUCT";
		String sql = "SELECT p.bookId,p.title,p.[content],p.author,p.press,p.price,p.stock,p.bookNo,p.coverImage,c.[c_name] FROM PRODUCT p JOIN CATEGORY c on p.bookNo = c.bookNo";
//		FROM Book b JOIN BookCompany bc ON  b.companyID = bc.id
		try (Connection connection = dataSource.getConnection();
				PreparedStatement ps = connection.prepareStatement(sql);) {
			try (ResultSet rs = ps.executeQuery();) {
				// 只要還有紀錄未取出，rs.next()會傳回true
				while (rs.next()) {
					ProductBean bean = new ProductBean(); // 準備一個新的BookBean
					bean.setBookId(rs.getInt(1));
					bean.setTitle(rs.getString(2));
					bean.setContent(rs.getString(3));
					bean.setAuthor(rs.getString(4));
					bean.setPress(rs.getString(5));
					bean.setPrice(rs.getDouble(6));
					bean.setStock(rs.getInt(7));
//					bean.setSells(rs.getInt(8));
					bean.setBookNo(rs.getInt(8));
					bean.setCoverImage(rs.getBlob(9));
					bean.setCategoryName(rs.getString(10));

					// 最後將ProductBean物件放入大的容器內
					list.add(bean);
				}
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);

		}
		return list;

	}

	public ProductBean queryBookById(Integer Id) throws SQLException {

		ProductBean bean = null;
//		String sql = "SELECT * FROM PRODUCT WHERE bookId=? ";
		String sql = "SELECT p.bookId,p.title,p.[content],p.author,p.press,p.price,p.stock,p.bookNo,p.coverImage,c.[c_name] FROM PRODUCT p JOIN CATEGORY c on p.bookNo = c.bookNo where p.bookId=?";
		try (Connection connection = dataSource.getConnection();
				PreparedStatement ps = connection.prepareStatement(sql);) {
			ps.setInt(1, Id);
			try (ResultSet rs = ps.executeQuery();) {
				if (rs.next()) {
					bean = new ProductBean();
					bean.setBookId(rs.getInt(1));
					bean.setTitle(rs.getString(2));
					bean.setContent(rs.getString(3));
					bean.setAuthor(rs.getString(4));
					bean.setPress(rs.getString(5));
					bean.setPrice(rs.getDouble(6));
					bean.setStock(rs.getInt(7));
//					bean.setSells(rs.getInt(8));
					bean.setBookNo(rs.getInt(8));
					bean.setCoverImage(rs.getBlob(9));
					bean.setCategoryName(rs.getString(10));
				}
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);

		}
		return bean;
	}

	public ProductBean getBook() throws SQLException {
		ProductBean bean = queryBookById(this.bookId);
		return bean;
	}

	public int updateBook(ProductBean bean, long sizeInBytes) {
		int n = 0;
		String sql = "UPDATE PRODUCT SET " + " title = ?,  author = ?,  price = ?, press = ?, stock = ?, "
				+ "bookNo = ?, coverImage = ?,content = ? WHERE bookId = ?";
		if (sizeInBytes == -1) { // 不修改圖片
			n = updateBook(bean);
			return n;
		}
		try (Connection connection = dataSource.getConnection();
				PreparedStatement ps = connection.prepareStatement(sql);) {
			ps.setString(1, bean.getTitle());
			ps.setString(2, bean.getAuthor());
			ps.setDouble(3, bean.getPrice());
			ps.setString(4, bean.getPress());
			ps.setInt(5, bean.getStock());
//			ps.setInt(6, bean.getSells());
			ps.setInt(6, bean.getBookNo());
			ps.setBlob(7, bean.getCoverImage());
			ps.setString(8, bean.getContent());
			ps.setInt(9, bean.getBookId());
			n = ps.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return n;
	}

	// 修改一筆書籍資料，不改圖片
	public int updateBook(ProductBean bean) {
		int n = 0;
		String sql = "UPDATE PRODUCT SET " + " title = ?,  author = ?,  price = ?, press = ?, stock = ?, "
				+ "bookNo = ?,content = ? WHERE bookId = ?";

		try (Connection connection = dataSource.getConnection();
				PreparedStatement ps = connection.prepareStatement(sql);) {
			ps.clearParameters();
			ps.setString(1, bean.getTitle());
			ps.setString(2, bean.getAuthor());
			ps.setDouble(3, bean.getPrice());
			ps.setString(4, bean.getPress());
			ps.setInt(5, bean.getStock());
//			ps.setInt(6, bean.getSells());
			ps.setInt(6, bean.getBookNo());
			ps.setString(7, bean.getContent());
			ps.setInt(8, bean.getBookId());
			n = ps.executeUpdate();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return n;
	}
	
	// 依bookID來刪除單筆記錄
	public int deleteBook(int no) {
		int n = 0;
		String sql = "DELETE FROM PRODUCT WHERE bookId = ?";
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
	
	public int saveBook(ProductBean bean) {
		int n = 0;
		
		String sql = "INSERT INTO Product " 
				+ " (title,  author,  price, press, "
				+ " stock, bookNo, content, coverImage) " 
				+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

		try (
			Connection connection = dataSource.getConnection();
			PreparedStatement pStmt = connection.prepareStatement(sql);
		) {
			pStmt.setString(1, bean.getTitle());
			pStmt.setString(2, bean.getAuthor());
			pStmt.setDouble(3, bean.getPrice());
			pStmt.setString(4, bean.getPress());
			pStmt.setInt(5, bean.getStock());
//			pStmt.setInt(6, bean.getSells());
			pStmt.setInt(6, bean.getBookNo());
			pStmt.setString(7, bean.getContent());
			pStmt.setBlob(8, bean.getCoverImage());
			n = pStmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return n;
	}
	

}
