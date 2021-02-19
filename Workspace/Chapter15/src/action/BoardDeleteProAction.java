package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardDeleteProService;
import vo.ActionForward;

public class BoardDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String page = request.getParameter("page");
		String board_pass = request.getParameter("board_pass");
		
		BoardDeleteProService boardDeleteProService = new BoardDeleteProService();
		boolean isArticleWriter = boardDeleteProService.isArticleWriter(board_num, board_pass);
		
		if(!isArticleWriter) { // 작성자가 아닌 것
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제할 권한이 없습니다.');");			
			out.println("history.back();");
			out.println("</script>");
			out.close();
		} else { // 작성자가 맞는 것
			boolean isDeleteSuccess = boardDeleteProService.removeArticle(board_num);
			
			if(!isDeleteSuccess) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('삭제 실패');");			
				out.println("history.back();");
				out.println("</script>");
				out.close();
			} else {
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("boardList.bo?page=" +page);
			}
		}		
		return forward;
	}

}
	// 선생님 식 풀이
	// public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//			ActionForward forward = null;
//			String board_num = request.getParameter("board_num");
//			String page = request.getParameter("page");
			
//			return forward;
	// }
