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
 * Servlet implementation class PartUploadPro1Servlet
 */
@WebServlet("/partUploadPro1")
@MultipartConfig(
		fileSizeThreshold = 0,
		location = "C:/Jsp/upload"
)
public class PartUploadPro1Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PartUploadPro1Servlet() {
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
		String writer = request.getParameter("writer");
		String browser = getBrowser(request); //브라우저 구분
		Part part = request.getPart("partFile1"); //type file 부분을 받아옴
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String contentDisposition = part.getHeader("content-disposition"); //content-disposition -> form-data: filename="*.jpg" name="partFile1"
		System.out.println(contentDisposition);
		String uploadFileName = getUploadFileName(contentDisposition, browser);
		part.write(uploadFileName);
		out.println("작성자 " +writer +"님이 " +uploadFileName +" 파일을 업로드 하였습니다.");
	}

	
	private String getUploadFileName(String contentDisposition, String browser) {
		// TODO Auto-generated method stub
		String uploadFileName = null;
		String[] contentSplitStr = contentDisposition.split(";"); // 0, 1, 2 -> 2만 사용
		int firstQutosIndex = contentSplitStr[2].indexOf("\""); // \는 문자로 인식
		int lastPathSeparatorIndex;
		if (browser.trim() == "MSIE") { //크롬이 아닐 경우
			lastPathSeparatorIndex = contentSplitStr[2].lastIndexOf("\\");
		} else {//크롬일 경우
			lastPathSeparatorIndex = contentSplitStr[2].indexOf("\"");			
		}
		int lastQutosIndex = contentSplitStr[2].lastIndexOf("\"");
		uploadFileName = contentSplitStr[2].substring(firstQutosIndex + 1, lastQutosIndex);
		return uploadFileName;
	}
	
	private String getBrowser(HttpServletRequest request) {
		String header = request.getHeader("User-Agent");
		if(header != null) {
			if(header.indexOf("Trident") > -1) {
				return "MSIE";
			} else if (header.indexOf("Chrome") > -1){
				return "Chrome";
			} else if (header.indexOf("Opera") > -1) {
				return "Opera";
			} else if (header.indexOf("iPhone") > - 1 && header.indexOf("Mobile") > - 1) {
				return "iPhone";
			} else if (header.indexOf("Android") > -1 && header.indexOf("Mobile") > -1) {
				return "Android";
			}
		}
		return "Filefox";
	}
}
