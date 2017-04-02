package dao;

import java.sql.*;
import java.util.*;

import comm.ConnectionManager;

import entity.UserLogin;

public class UserOperation {
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	public int getAddUsers(UserLogin ui){
		int num=0;
		String sql="insert into userInfo(loginname,password,userRoleId) values(?,?,?)";
		try {
			con=ConnectionManager.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,ui.getLoginName());
			pstmt.setString(2,ui.getPassword());
			pstmt.setInt(3,ui.getUserRoleId());
			num=pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			ConnectionManager.allClose(con, pstmt, rs);
		}
		return num;
		
	}
	@SuppressWarnings("unchecked")
	public List getShowUsers(){
		List list=new ArrayList();
		UserLogin ui=null;
		String sql="select * from userInfo ";
		try {
			con=ConnectionManager.getCon();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				ui=new UserLogin();
				ui.setUserId(rs.getInt("userId"));
				ui.setLoginName(rs.getString("loginName"));
				ui.setPassword(rs.getString("password"));
				ui.setUserRoleId(rs.getInt("userRoleId"));
				list.add(ui);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			ConnectionManager.allClose(con, pstmt, rs);
		}
		return list;
	}
	public int getDeleteUser(int userId){
		int num=0;
		String sql="delete from userInfo where userId=?";
		try {
			con=ConnectionManager.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, userId);
			num=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}finally{
			ConnectionManager.allClose(con, pstmt, rs);
		}
		return num;
	}
}
