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
		        //1.�ϴ�ͼƬ��������
				SmartUpload  su=new SmartUpload();
				//2.�ϴ���ʼ��
				su.initialize(this.getServletConfig(), request, response);
				//�趨�ϴ����ƣ�����ÿ���ϴ��ļ�����󳤶�
				su.setMaxFileSize(100000);
				//�������ϴ����ݵĳ���
				su.setTotalMaxFileSize(100000);

				//3.�趨�����ϴ����ļ���ͨ����չ�����ƣ�����������jpg ,gif,bmp�ļ�
				su.setAllowedFilesList("jpg,gif,bmp");
				String picPath;
				try {
					//�趨��ֹ�ϴ����ļ���ͨ����չ�����ƣ�
					su.setDeniedFilesList("exe,bat,jsp,html,htm");
					//�ϴ��ļ�
					su.upload();
					//���ϴ��ļ�ȫ�����浽ָ��Ŀ¼
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
