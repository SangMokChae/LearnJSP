package svc;

import java.sql.Connection;

import dao.MemberDAO;

import static db.JdbcUtil.*;
import vo.MemberBean;

public class JoinProSvc {

	public boolean joinMember(MemberBean member) {
		boolean isJoinSuccess = false;
		Connection con = null;
		
		try {
			con = getConnection();
			MemberDAO memberDad = MemberDAO.getInstance();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(con);
		}
		return isJoinSuccess;
	}

}
