import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class multiFileUpload
 */
@WebServlet("/multiFileUpload")
@MultipartConfig(
		fileSizeThreshold = 0,
		location = "C:/Jsp/upload"
)
public class multiFileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public multiFileUploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String uploadFileNameList = "";
		for(Part part: request.getParts()) {
			if(part.getName().startsWith("fileName")) {
				System.out.println(part.getName());
				String contentDisposition = part.getHeader("content-disposition");
				String uploadFileName = getUploadFileName(contentDisposition);
				part.write(uploadFileName);
				uploadFileNameList +=" " +uploadFileName;
			}
		}
		out.println("올린사람 : " +name+"<br/>");
		out.println("제목 : " +subject+"<br/>");
		out.println("파일들 : " +uploadFileNameList);		
	}

	private String getUploadFileName(String contentDisposition) {
		// TODO Auto-generated method stub
		String uploadFileName = null;
		String[] contentSplitStr = contentDisposition.split(";");
		int firstQutosIndex = contentSplitStr[2].indexOf("\"");
		int lastQutosIndex = contentSplitStr[2].lastIndexOf("\"");
		uploadFileName = contentSplitStr[2].substring(firstQutosIndex + 1, lastQutosIndex);
		return uploadFileName;
	}
}
