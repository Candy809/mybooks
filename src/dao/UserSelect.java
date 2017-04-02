package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import comm.ConnectionManager;

public class UserSelect {//判断用户名是否重复
	public boolean userLogin(String username,String password){
			
		
		
		
		
		
		
		
		
		
		
				    boolean tag = false;
		    Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
		
	  try {
		   
			String sql = "select * from userinfo where username = ? ";
			con=ConnectionManager.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, username);
			 
			rs = pstmt.executeQuery();
			if (rs!=null) {
				tag = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if(rs != null){
					rs.close();
				}
				if(pstmt != null){
					pstmt.close();
				}
				if(con !=null){
					con.close();
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			
		}
		
		
		return tag;
 	}

}
