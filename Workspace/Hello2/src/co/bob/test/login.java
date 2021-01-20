package co.bob.test;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class login
 */
@WebServlet("/login.do")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8"); //한글 깨짐 방지를 위해서
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String msg = null;
		
		if(id.equals("park") && pw.equals("1234")) {
			msg = id + "님 환영합니다.";
		} else {
			msg = id + "님 존재하지 않는 아이디 입니다.";			
		}
		
		request.setAttribute("msg", msg); // 돌려줄 객체에 (메세지를 담는다.)msg 속성을 부여한다.
		RequestDispatcher dispatecer = request.getRequestDispatcher("jsp/loginResult2.jsp"); // 돌려 보낼 페이지를 지정한다.
		dispatecer.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
