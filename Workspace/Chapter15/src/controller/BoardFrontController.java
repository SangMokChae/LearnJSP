package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.BoardDetailAction;
import action.BoardListAction;
import action.BoardModifyFormAction;
import action.BoardModifyProAction;
import action.BoardReplyFormAction;
import action.BoardReplyProAction;
import action.BoardWriteProAction;
import vo.ActionForward;

/**
 * Servlet implementation class BoardFrontController
 */
@WebServlet("*.bo")
public class BoardFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			doProcess(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			doProcess(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8"); // 한글처리 미리 해놓기
		String RequestURI = request.getRequestURI(); // http://~~~ /uri
		String contextPath = request.getContextPath(); // ~~~ -> 서버 위치
		String command = RequestURI.substring(contextPath.length()); // substring이 특정 위치에서 시작(http://~~~/ 여기서 부터 시작 uri가 남음) 그래서 uri의 위치가 나옴
		ActionForward forward = null;
		Action action = null;
		System.out.println(command); //값이 정확한가 확인을 위해서
		
		if(command.equals("/boardWriteForm.bo")) {
			forward = new ActionForward();
			forward.setPath("/board/qna_board_write.jsp"); // direct로 넘김 /dispatcher 방식으로 넘김
		} else if (command.equals("/boardWritePro.bo")) {
			action = new BoardWriteProAction(); // 인터페이스로 하는 이유 -> 관리하기 편해서 but 굳이 안해도 된다.
			try {
				forward = action.execute(request, response);				
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/boardList.bo")) {
			action = new BoardListAction();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/boardDetail.bo")) {
			action = new BoardDetailAction();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}  else if (command.equals("/boardModifyForm.bo")) {
			action = new BoardModifyFormAction();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/boardModifyPro.bo")) {
			action = new BoardModifyProAction();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/boardReplyForm.bo")) {
			action = new BoardReplyFormAction();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/boardReplyPro.bo")) {
			action = new BoardReplyProAction();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} 
			
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath()); // getPath에 경로가 존재
			} else { // direct가 아닌경우 dicpatcher로 넘기기 위해 객체 생성
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}
}
