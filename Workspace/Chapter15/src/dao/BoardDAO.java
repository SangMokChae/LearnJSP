package dao; //data access object

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
	
	// 글 수정
	public int updateArticle(BoardBean article) {
		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql = "update board set board_subject = ?, board_content = ? where board_num = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getBoard_subject());
			pstmt.setString(2, article.getBoard_content());
			pstmt.setInt(3, article.getBoard_num());
			updateCount = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("boardModify 에러 : " +e);
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return updateCount;
	}
	
	// 글 개수 구하기
	public int selectListCount() {
		int listCount = 0;
		PreparedStatement pstmt = null; // db의 값을 호출하기 위해
		ResultSet rs = null;
		
		try {
			pstmt = con.prepareStatement("select count(*) from board");
			rs = pstmt.executeQuery();
			
			if(rs.next()) { // db에서 불러온 값이 있으면 -> 값은 1개 밖에 존재하지 않는다.
				listCount = rs.getInt(1); // 1은 열 1을 의미한다.
			}
		} catch(Exception e) {
			System.out.println("getListCount 에러 : " +e);
			e.printStackTrace(); // 에러 났을때 에러가 어디서 났는지 확실히 알려준다.
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return listCount;
	}
	
	// 글 목록 보기
	public ArrayList<BoardBean> selectArticleList(int page, int limit) {
		ArrayList<BoardBean> list = new ArrayList<BoardBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String board_list_sql = "select * from board order by board_re_ref desc, board_re_seq asc limit ?, ?"; // 각 글에서 / 관련글
		//처음 시작하는 글위치 /읽기 시작할 row 번호
		int startrow = (page - 1) * limit;
	
		try {
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardBean boardBean = new BoardBean(); //생성은 반복문 안에서 해야한다 / 하나 하나의 개별적 값을 넣기 위해서
				boardBean.setBoard_num(rs.getInt("board_num"));
				boardBean.setBoard_name(rs.getString("board_name"));
				boardBean.setBoard_subject(rs.getString("board_subject"));
				boardBean.setBoard_content(rs.getString("board_content"));
				boardBean.setBoard_file(rs.getString("board_file"));
				boardBean.setBoard_re_ref(rs.getInt("board_re_ref"));
				boardBean.setBoard_re_lev(rs.getInt("board_re_lev"));
				boardBean.setBoard_re_seq(rs.getInt("board_re_seq"));
				boardBean.setBoard_readcount(rs.getInt("board_readcount"));
				boardBean.setBoard_date(rs.getDate("board_date"));
				list.add(boardBean);
			}
		} catch(Exception e) {
			System.out.println("getBoardList 에러" +e);
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
			
		return list;
	}

	// 조회수 업데이트
	public int updateReadCount(int board_num) {		
		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql = "update board set board_readcount = board_readcount+1 where board_num = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			updateCount = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return updateCount;
	}

	// 글 내용 보기
	public BoardBean selectArticle(int board_num) {
		BoardBean article = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from board where board_num = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				article = new BoardBean();
				article.setBoard_num(rs.getInt("board_num"));
				article.setBoard_name(rs.getString("board_name"));
				article.setBoard_subject(rs.getString("board_subject"));
				article.setBoard_content(rs.getString("board_content"));
				article.setBoard_file(rs.getString("board_file"));
				article.setBoard_re_ref(rs.getInt("board_re_ref"));
				article.setBoard_re_lev(rs.getInt("board_re_lev"));
				article.setBoard_re_seq(rs.getInt("board_re_seq"));
				article.setBoard_readcount(rs.getInt("board_readcount"));
				article.setBoard_date(rs.getDate("board_date"));
			}
		} catch (Exception e) {
			System.out.println("getDetail 에러 : " +e);
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return article;
	}
	
	// 글쓴이 인지 확인
	public boolean isArticleBoardWriter(int board_num, String pass) {
		boolean isWriter = false;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from board where board_num = ? and board_pass = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				isWriter = true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return isWriter;
	}
	
	// 글 답변(글등록과 유사)
	public int insertReplyArticle(BoardBean article) {
		int insertCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// 관련글 seq 업데이터
			String sql = "update board set board_re_seq = board_re_seq+1 where board_re_ref = ? and board_re_seq > ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, article.getBoard_re_ref());
			pstmt.setInt(2, article.getBoard_re_seq());
			pstmt.executeUpdate();
			
			// 입력할 글 번호 생성
			int num = 1;
			pstmt = con.prepareStatement("select max(board_num) from board");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				num = rs.getInt(1) + 1;
			}
			
			// 답글 입력
			sql = "insert into board values(?,?,?,?,?,'',?,?,?,0,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getBoard_name());
			pstmt.setString(3, article.getBoard_pass());
			pstmt.setString(4, article.getBoard_subject());
			pstmt.setString(5, article.getBoard_content());
			pstmt.setInt(6, article.getBoard_re_ref());
			pstmt.setInt(7, article.getBoard_re_lev() + 1); //현재 글보다 하나 밑에 존재
			pstmt.setInt(8, article.getBoard_re_seq() + 1); //현재 글보다 하나 밑에 존재
			insertCount = pstmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.println("boardReply 에러 : " +e);
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return insertCount;
	}
	
	// 글 삭제
	public int deleteArticle(int board_num) {
		int deleteCount = 0;
		PreparedStatement pstmt = null;
		String sql = "delete from board where board_num = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			deleteCount = pstmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.println("boardDelete 에러 :" +e);
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return deleteCount;
	}

}
