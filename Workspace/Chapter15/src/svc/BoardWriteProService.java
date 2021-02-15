package svc;

import java.sql.Connection;
import dao.BoardDAO;
import vo.BoardBean;
import static db.JdbcUtil.*;

public class BoardWriteProService {

	public boolean registAtricle(BoardBean boardBean) {
		boolean isWriteSuccess = false;
		Connection con = null; // finally 때문에 밖에 객체 설정
		try {
			con = getConnection();
			BoardDAO boardDAO = BoardDAO.getInstance();
			boardDAO.setConnection(con); // 객체 주입 형태 /spring 에서 주로 사용
			int insertCount = boardDAO.insertArticle(boardBean);
			
			if(insertCount > 0) {
				commit(con);
				isWriteSuccess = true;
			} else {
				rollback(con);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con);			
		}
		return isWriteSuccess;
	}

}
