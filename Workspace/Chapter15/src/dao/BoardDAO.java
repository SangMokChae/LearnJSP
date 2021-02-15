package dao; //data access object

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.sql.DataSource;

import vo.BoardBean;

public class BoardDAO {
	DataSource ds;
	Connection con;
	private static BoardDAO boardDAO;
	
	private BoardDAO() {}
	
	public static BoardDAO getInstance() {
		if(boardDAO == null) {
			boardDAO = new BoardDAO();
		}
		return boardDAO;
	}

	public void setConnection(Connection con) {
		this.con = con;		
	}
	
	//글의 개수 구하기
//	public int selectListCount() {
//		
//	}

	//글 등록
	public int insertArticle(BoardBean article) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		String sql = "";
		int insertCount = 0;
		
		try {
			pstmt = con.prepareStatement("select max(board_num) from board");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1) + 1;
			} else {
				num = 1;
			}
			
//			sql = "insert into board (board_num, board_name, board_pass, board_subject,";
//			sql += "board_content, board_file, board_re_ref," + "board_re_lev, board_re_seq, board_readcount," +"board_Date) values(?,?,?,?,?,?,?,?,?,?,now())";
			sql = "insert into board values(?,?,?,?,?,?,?,0,0,0,now())";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,  num);
			pstmt.setString(2, article.getBoard_name());
			pstmt.setString(3, article.getBoard_pass());
			pstmt.setString(4, article.getBoard_subject());
			pstmt.setString(5, article.getBoard_content());
			pstmt.setString(6, article.getBoard_file());
			pstmt.setInt(7, num);
//			pstmt.setInt(8, 0);
//			pstmt.setInt(9, 0);
//			pstmt.setInt(10, 0);
			
			insertCount = pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("boardInsert 에러 : " +ex);
		} finally {
			if(rs!=null) close(rs);
			if(pstmt != null) close(pstmt);
		}
		return insertCount;
	}

}
