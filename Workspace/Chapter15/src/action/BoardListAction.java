package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardListService;
import vo.ActionForward;
import vo.BoardBean;
import vo.PageInfo;

public class BoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		BoardListService boardListService = new BoardListService();
		int page = 1;
		int limit = 10;
		int limitPage = 10; // 글 갯수를 조절하기 위해서
		// page수를 정의 해주기 위해서 / limit는 1page에 보이는 목록(글)의 갯수를 의미한다.
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int listCount = boardListService.getListCount();
		// 총 페이지 수
		int maxPage = (int)((double)listCount / limit + 0.95);
		// 현재 페이지에 보여줄 시작페이지수(1, 11, 21등..)
		int startPage = ((int) ((double)page / limitPage + 0.9) - 1) * limitPage + 1;
		// 현재 페이지에 보여줄 마지막 페이지수 (10,20,30 등..)
		int endPage = startPage + limitPage - 1;
		
		if(endPage > maxPage) endPage = maxPage; //endPage넘어 가는 값을 막아 주기 위해서 
		
		PageInfo pageInfo = new PageInfo();
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		
		ArrayList<BoardBean> articleList = new ArrayList<>(); // page를 나누기 위해
		articleList = boardListService.getArticleList(page, limit);
		
		 request.setAttribute("pageInfo", pageInfo);
		 request.setAttribute("articleList", articleList);
		 
		 ActionForward forward = new ActionForward();
		 forward.setPath("/board/qna_board_list.jsp"); //dispatcher로 연결
		
		 return forward;
	}

}
