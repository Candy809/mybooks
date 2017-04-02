package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import comm.ConnectionManager;
import entity.Message;

public class MessageDao extends ConnectionManager
{
    Connection con=null;
    PreparedStatement pstmt=null;
    ResultSet rs=null;
    @SuppressWarnings({ "unchecked", "rawtypes" })
	public List GetMessageByISBN(String isbn)
    {
        Message mes=null;
        List list=new ArrayList();
        String sql="select * from message where isbn=?";
        
        try
        {
            
            con=ConnectionManager.getCon();
            pstmt=con.prepareStatement(sql);
            pstmt.setString(1,isbn );
            rs=pstmt.executeQuery();
            while(rs.next())
            {
                mes=new Message();
                mes.setMessageId(rs.getInt("MessageId"));
                mes.setUsername(rs.getString("username"));
                mes.setContent(rs.getString("Content"));
                mes.setTitle(rs.getString("Title"));
                mes.setWriteDate(rs.getString("WriteDate"));
                mes.setCount(rs.getInt("Count"));
                mes.setIsbn(rs.getString("isbn"));
                list.add(mes);
            }
        }
        catch (SQLException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list;
    }
    
    public int addMessage(Message message)
    {
        int num=0;
        String sql="insert into message(username, title, content, writeDate,isbn)values(?,?,?,?,?)";
        try
        {
            con=ConnectionManager.getCon();
            pstmt=con.prepareStatement(sql);
            pstmt.setString(1,message.getUsername());
            pstmt.setString(2,message.getTitle());
            pstmt.setString(3,message.getContent());
            pstmt.setString(4,message.getWriteDate());
            pstmt.setString(5,message.getIsbn());
            num=pstmt.executeUpdate();
        }
        catch (SQLException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return num;
        
    }

    @SuppressWarnings({ "unchecked", "rawtypes" })
	public List getMessage()
    {
        Message mes=null;
        List list=new ArrayList();
        String sql="select * from message";
        
        try
        {
            
            con=ConnectionManager.getCon();
            pstmt=con.prepareStatement(sql);
            rs=pstmt.executeQuery();
            while(rs.next())
            {
                mes=new Message();
                mes.setMessageId(rs.getInt("MessageId"));
                mes.setUsername(rs.getString("username"));
                mes.setContent(rs.getString("Content"));
                mes.setTitle(rs.getString("Title"));
                mes.setWriteDate(rs.getString("WriteDate"));
                mes.setCount(rs.getInt("Count"));
                mes.setIsbn(rs.getString("isbn"));
                list.add(mes);
            }
        }
        catch (SQLException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list;
    }
    /*
     * Date date = new Date(); 
		date就是现在系统的时间 
		如果要转成某种格式输出可以这么写： 
		String st = new String(new SimpleDateFormat("yyyy-MM-dd.HH:mm:ss ").format(date)); 

     */
    public int deleteMessageByMessageID(int messageID)
    {
    	int num=0;
    	String sql="delete from message where messageID=?";
    	try {
			con=ConnectionManager.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,messageID);
			num=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}
		return num;
    }
    
}
