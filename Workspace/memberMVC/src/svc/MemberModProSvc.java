package svc;

import java.sql.Connection;

import dao.MemberDAO;

import static db.JdbcUtil.*;
import vo.MemberBean;

public class MemberModProSvc {

	public boolean modifyMember(MemberBean member) {
		boolean isModifySuccess = false;
		Connection con = null;
		
		try {
			con = getConnection();
			MemberDAO memberDao = MemberDAO.getInstance();
			memberDao.setConnection(con);
			
			int updateCount = memberDao.updateMember(member);
			if(updateCount > 0) { // select 이 외에서는 사용할 것
				commit(con);
				isModifySuccess = true;
			} else {
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
