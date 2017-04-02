package dao;

import java.sql.*;

import comm.ConnectionManager;
import entity.BookBean;



public class BookManage extends ConnectionManager{
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;

	//删除图书表中的图书数据
	public int getDelete(String isbn){
		int num=0;
		String sql="delete from titles where isbn=?";
		try{
			con=ConnectionManager.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, isbn);
			num=pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			ConnectionManager.allClose(con, pstmt, null);
		}
		return num;
	}
	
	//根据isbn显示
	public BookBean getTitle(String isbn){
		BookBean bookBean=new BookBean();
		String sql="select * from titles where isbn=?";
		try {
			con=ConnectionManager.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, isbn);
			rs=pstmt.executeQuery();
			while(rs.next()){
				bookBean.setAuthor(rs.getString("author"));
				bookBean.setCopyright(rs.getString("copyright"));
				bookBean.setDescription(rs.getString("description"));
				bookBean.setImageFile(rs.getString("imageFile"));
				bookBean.setPrice(rs.getDouble("price"));
				bookBean.setPublisherID(rs.getInt("publisherID"));
				bookBean.setIsbn(rs.getString("isbn"));
				bookBean.setTitle(rs.getString("title"));
			}
		} catch (SQLException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}finally{
			ConnectionManager.allClose(con, pstmt, rs);
		}
		return bookBean;
	}
	
	
	
	//修改图书根据isbn
	public int getUpdate(BookBean bookBean,String isbn){
		int num=0;
		String sql="update titles set isbn=?, title=?, copyright=?, price=?, author=?, description=?  where isbn=?";
		try{
			con=ConnectionManager.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, bookBean.getIsbn());
			pstmt.setString(2, bookBean.getTitle());
			pstmt.setString(3, bookBean.getCopyright());
			pstmt.setDouble(4, bookBean.getPrice());
			pstmt.setString(5, bookBean.getAuthor());
			pstmt.setString(6, bookBean.getDescription());
			pstmt.setString(7, isbn);
			num=pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			ConnectionManager.allClose(con, pstmt, null);
		}
		return num;
	}
	public int getAddBookManage(BookBean bb){
		int num=0;
		String sql="insert into titles(isbn, title, copyright, publisherID, imageFile, price, author, description) values(?,?,?,?,?,?,?,?)";
		try{
			con=ConnectionManager.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, bb.getIsbn());
			pstmt.setString(2, bb.getTitle());
			pstmt.setString(3, bb.getCopyright());
			pstmt.setInt(4, bb.getPublisherID());
			pstmt.setString(5,bb.getImageFile());
			pstmt.setDouble(6, bb.getPrice());
			pstmt.setString(7, bb.getAuthor());
			pstmt.setString(8, bb.getDescription());
			num=pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			ConnectionManager.allClose(con, pstmt, null);
		}
		return num;
	}
}
