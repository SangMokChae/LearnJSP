package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardModifyProService;
import vo.ActionForward;
import vo.BoardBean;

public class BoardModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String pass = request.getParameter("board_pass");
		String board_subject = request.getParameter("board_subject");
		String board_content = request.getParameter("board_content");
		String page = request.getParameter("page");
		
		BoardModifyProService boardModifyProService = new BoardModifyProService();
		// 사용자 수정 권한 존재 확인, 수정 작업
		boolean isRightUser = boardModifyProService.isArticleWriter(board_num, pass);
		
		if(!isRightUser) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정할 권한이 없습니다.');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			BoardBean article = new BoardBean();
			article.setBoard_num(board_num);
			article.setBoard_subject(board_subject);
			article.setBoard_content(board_content);
			boolean isModifySuccess =  boardModifyProService.modifyArticle(article);
			
			if(!isModifySuccess) { // 수정 안됬을 경우
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('수정 실패');");
				out.println("history.back();");
				out.println("</script>");
			} else {
				forward = new ActionForward(); // nullpoint err 방지
				forward.setRedirect(true);
				forward.setPath("boardDetail.bo?board_num=" +board_num +"&page=" +page);
			}
		}
		return forward;
	}
}
