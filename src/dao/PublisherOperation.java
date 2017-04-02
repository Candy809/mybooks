package dao;

import java.sql.*;
import java.util.*;

import comm.ConnectionManager;
import entity.Publishers;

public class PublisherOperation {
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	public List getAllPublisher(){
		List list =new ArrayList();
		Publishers p=null;
		String sql="select * from publishers";
		try {
			con=ConnectionManager.getCon();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				p=new Publishers();
				p.setPublisherId(rs.getInt(1));
				p.setPublisherName(rs.getString(2));
				list.add(p);
			}
		} catch (SQLException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}finally{
			ConnectionManager.allClose(con, pstmt, rs);
		}
		return list;
	}
}
