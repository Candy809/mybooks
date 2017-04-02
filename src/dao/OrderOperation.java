package dao;

import java.sql.*;

import entity.BookOrder;

import comm.ConnectionManager;

public class OrderOperation extends ConnectionManager{
	public int getBookOrder(BookOrder bookOrder) {
		int num=0;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=ConnectionManager.getCon();
			String sql="insert into bookorder(username, zipcode, phone, creditcard, total) values(?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,bookOrder.getUserName());
			pstmt.setString(2, bookOrder.getZipcCode());
			pstmt.setString(3,bookOrder.getPhone());
			pstmt.setString(4, bookOrder.getCreditCard());
			pstmt.setDouble(5,bookOrder.getTotal());
			num=pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnectionManager.allClose(con, pstmt, rs);
		}
		return num ;
		
	}
	/*
	public int saveOrder(BookOrder bookOrder){
		int result=0;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=this.getCon();
			String sql="insert into bookorder(username, zipcode, phone, creditcard, total) values(?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,bookOrder.getUserName());
			pstmt.setString(2, bookOrder.getZipcCode());
			pstmt.setString(3,bookOrder.getPhone());
			pstmt.setString(4, bookOrder.getCreditCard());
			pstmt.setDouble(5,bookOrder.getTotal());
			result=pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			this.allClose(con, pstmt, rs);
		}
		return result;
		
	}
	*/
	
}
