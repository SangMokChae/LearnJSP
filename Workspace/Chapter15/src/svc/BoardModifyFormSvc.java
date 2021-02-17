package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.BoardDAO;
import vo.BoardBean;

public class BoardModifyFormSvc {

	public BoardBean getArticle(int board_num) {
		// TODO Auto-generated method stub
		
		BoardBean article = null;
		Connection con = null;
		
		try {
			con = getConnection();
			BoardDAO boardDAO = BoardDAO.getInstance(); // 싱글톤
			boardDAO.setConnection(con);

		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(con);
		}
		
		// BoardDetailService.java에 update부분을 빼고 나머지를 넣어주면 된다.
		// update(조회수) 부분을 빼고 나머지는 같다.
		return article;
	}
}
