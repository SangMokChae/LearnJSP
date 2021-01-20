package co.bob.test;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FirstServlet
 */
@WebServlet("/FirstServlet")
public class FirstServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FirstServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 여기다가 쓰면 overRide에 해당한다. 
		/* response.setContentType("text/html;charset=UTF-8"); // 서블릿이 jsp파일을 만들어 주는 것이라 이것을 붙여 주면 한글이 깨지지 않는다.
		response.setCharacterEncoding("UTF-8"); // 한글 깨진것을 막아준다. / 정상적인 한글은 나오지 않는다.
		response.getWriter().append("서블릿이다. ").append(request.getContextPath()); // 처음에 한글이 깨진다. // getWriter 브라우저에 표현되도록 하게끔 해준다. */
		
		request.setCharacterEncoding("UTF-8"); //현업에서 사용법
		String name = "홍길동";
		String passwd = "1234";
		
		request.setAttribute("name", name); //디스패처 방식으로 name이라는 변수에 name 값을 전달한다. // 돌려줄 페이지에 내려가지고 있는 name 변수값을 전달 하고자.
		request.setAttribute("passwd", passwd); // 이후 request.getAttribute를 통해 page에서 읽으면 된다. 

		RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/second.jsp"); // 
		dispatcher.forward(request, response); // forward는 request 객체를 새로 만들어 준다.
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
