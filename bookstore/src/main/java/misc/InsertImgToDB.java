package misc;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//用JDBC測試圖檔上傳至資料庫。
public class InsertImgToDB {
	private String ImgPath;

	public String getImgPath() {
		return ImgPath;
	}

	public void setImgPath(String imgPath) {
		ImgPath = imgPath;
	}
	public static void main(String[] args) {
		Connection conn = null;
		PreparedStatement stmt =null;
		FileInputStream fis =null;
		ResultSet rs = null;
		try {
			String inFile = "C:\\Users\\Niar\\Desktop\\java專題\\書本圖檔\\booktest.jpg";
			int bookid = 6;
			File f = new File(inFile);
			fis = new FileInputStream(f);
			String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=projtest";
			conn = DriverManager.getConnection(connUrl, "sa", "sa123456");
			String insertStmt = "UPDATE  product SET coverImage=? where bookId=?";		
			stmt = conn.prepareStatement(insertStmt);
			stmt.setBinaryStream(1, fis);
			stmt.setInt(2,bookid);
			stmt.executeUpdate();
			System.out.println("Insert blob is successful!");
			
			String qryStmt = "SELECT coverImage FROM product WHERE bookId = ?";
			stmt = conn.prepareStatement(qryStmt);
			stmt.setInt(1, bookid);
			rs = stmt.executeQuery();
			
			if (rs.next()) {
				FileOutputStream fos = new FileOutputStream("C:\\Users\\Niar\\Desktop\\java專題\\圖檔抓取測試\\123123123.jpg");
				Blob b = rs.getBlob("coverImage");
				byte[] data = b.getBytes(1, (int)b.length());
				fos.write(data, 0, (int)b.length());
				fos.close();
				System.out.println("File output is successful!");
			} // end of if (rs.next()) 
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if (conn != null)
				try {
					
					conn.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
		}
		
	}
	




}
	

