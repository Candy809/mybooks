package servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.jspsmart.upload.SmartUpload;
public class UpLoadBookImageServlet extends HttpServlet {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		 
				HttpSession session=request.getSession();
		        //1.上传图片到服务器
				SmartUpload  su=new SmartUpload();
				//2.上传初始化
				su.initialize(this.getServletConfig(), request, response);
				//设定上传限制，限制每个上传文件的最大长度
				su.setMaxFileSize(100000);
				//限制总上传数据的长度
				su.setTotalMaxFileSize(100000);

				//3.设定允许上传的文件（通过扩展名限制），仅仅允许jpg ,gif,bmp文件
				su.setAllowedFilesList("jpg,gif,bmp");
				String picPath;
				try {
					//设定禁止上传的文件（通过扩展名限制）
					su.setDeniedFilesList("exe,bat,jsp,html,htm");
					//上传文件
					su.upload();
					//将上传文件全部保存到指定目录
					String filepath="E:/apache-tomcat-7.0.69-windows-x64/apache-tomcat-7.0.69/webapps/mybooks/images";
					int count=su.save(filepath,SmartUpload.SAVE_VIRTUAL);
					String fn=su.getFiles().getFile(0).getFileName();
					picPath=filepath+fn;
				    session.setAttribute("fn", picPath);
				} catch (Exception e) {
					// TODO: handle exception
				}
				 request.getRequestDispatcher("addbook.jsp").forward(request, response);
				


	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
