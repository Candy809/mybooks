package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import comm.ConnectionManager;

import entity.UserLogin;


public class CheckLogin extends ConnectionManager{
	public UserLogin validate(String user,String pass){
		UserLogin userInfo=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from userinfo where loginName=?";
		try{
			con=ConnectionManager.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,user);
			rs=pstmt.executeQuery();
			if(rs.next()&&rs.getString("password").equals(pass)){
				userInfo=new UserLogin();
				userInfo.setUserId(rs.getInt(1));
				userInfo.setLoginName(rs.getString(2));
				userInfo.setPassword(rs.getString(3));
				userInfo.setUserRoleId(rs.getInt(4));
			}else{
				System.out.println("µÇÂ¼Ê§°Ü£¡");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnectionManager.allClose(con, pstmt, rs);
		}
		return userInfo;
	}
	

}
