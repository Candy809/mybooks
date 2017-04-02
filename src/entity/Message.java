package entity;

import java.io.Serializable;

public class Message implements Serializable
{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//messageID, userId, title, content, writeDate, count   
    private int messageId;
    private String username;
    private String title;
    private String content;
    private String writeDate;
    private int count;
    private String isbn;
    public String getIsbn()
    {
        return isbn;
    }
    public void setIsbn(String isbn)
    {
        this.isbn = isbn;
    }
    public int getMessageId()
    {
        return messageId;
    }
    public void setMessageId(int messageId)
    {
        this.messageId = messageId;
    }
   
    public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTitle()
    {
        return title;
    }
    public void setTitle(String title)
    {
        this.title = title;
    }
    public String getContent()
    {
        return content;
    }
    public void setContent(String content)
    {
        this.content = content;
    }
    public String getWriteDate()
    {
        return writeDate;
    }
    public void setWriteDate(String writeDate)
    {
        this.writeDate = writeDate;
    }
    public int getCount()
    {
        return count;
    }
    public void setCount(int count)
    {
        this.count = count;
    }
}
