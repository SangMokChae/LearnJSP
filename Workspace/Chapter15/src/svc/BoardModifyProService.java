package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;

import dao.BoardDAO;
import vo.BoardBean;

public class BoardModifyProService {

	public boolean isArticleWriter(int board_num, String pass) {
		boolean isArticleWriter = false;
		Connection con = null;
		
		try {
			con = getConnection();
			BoardDAO boardDAO = BoardDAO.getInstance();
			boardDAO.setConnection(con);
			isArticleWriter = boardDAO.isArticleBoardWriter(board_num, pass);
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(con);
		}
		
		return isArticleWriter;
	}

	public boolean modifyArticle(BoardBean article) {
		boolean isModifySuccess = false;
		Connection con = null;
		
		try {
			con = getConnection();
			BoardDAO boardDAO = BoardDAO.getInstance();
			boardDAO.setConnection(con);
			
			int updateCount = boardDAO.updateArticle(article);
			
			if(updateCount > 0) { // 정상 수정
				commit(con);
				isModifySuccess = true;
			} else { // 수정 저장 불가
				rollback(con);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(con);
		}
		
		return isModifySuccess;
	}


}
