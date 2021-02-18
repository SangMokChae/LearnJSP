package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardModifyFormSvc;
import vo.ActionForward;
import vo.BoardBean;

public class BoardReplyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward(); 
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String page = request.getParameter("page");
		
		BoardModifyFormSvc boardModifyFormSvc = new BoardModifyFormSvc(); 
		// 답글 다는데 조회수가 올라가는 것을 방지 하기 위해서 BoardDetailService대신 BoardModifyFormSvc를 생성해준다.
		BoardBean article = boardModifyFormSvc.getArticle(board_num);
		request.setAttribute("article", article);
		request.setAttribute("page", page);
		forward.setPath("/board/qna_board_reply.jsp");
		
		return forward;
	}

}
