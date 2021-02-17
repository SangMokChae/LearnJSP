package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;

import dao.BoardDAO;
import vo.BoardBean;

public class BoardDetailService {

	public BoardBean getArticle(int board_num) {
		// TODO Auto-generated method stub
		
		BoardBean article = null;
		Connection con = null;
		
		try {
			con = getConnection();
			BoardDAO boardDAO = BoardDAO.getInstance(); // 싱글톤
			boardDAO.setConnection(con);
			
			// 조회수 업데이트
			int updateCount = boardDAO.updateReadCount(board_num);
			
			if(updateCount > 0) {
				commit(con);
				article = boardDAO.selectArticle(board_num);
			} else {
				rollback(con);
			}

		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(con);
		}
		
		return article;
	}

}


//		https://sas-study.tistory.com/117 getConnection-참조 사이트