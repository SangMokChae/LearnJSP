package svc;

import static db.JdbcUtil.*; //static이 들어가야 활성화가 된다.
import java.sql.Connection;
import java.util.ArrayList;

import dao.BoardDAO;
import vo.BoardBean;

public class BoardListService {

	public int getListCount() {
		
		int listCount = 0;
		Connection con = null;
		try {
			con = getConnection();
			BoardDAO boardDAO = BoardDAO.getInstance(); //싱글톤형태 => 없으면 생성시켜주고, 있으면 불러오고
			boardDAO.setConnection(con); // 객체주입
			listCount = boardDAO.selectListCount();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(con);
		}
		return listCount;
	}

	public ArrayList<BoardBean> getArticleList(int page, int limit) {
		ArrayList<BoardBean> list = null;	
		Connection con = null;
		try {
			con = getConnection();
			BoardDAO boardDAO = BoardDAO.getInstance();
			boardDAO.setConnection(con);
			list = boardDAO.selectArticleList(page, limit);		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con);
		}
		return list;
	}
}
