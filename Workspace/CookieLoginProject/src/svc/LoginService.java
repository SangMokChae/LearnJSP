package svc;

import dao.LoginDAO;
import vo.Member;
import static db.JdbcUtil.*;

import java.sql.Connection;
public class LoginService {

	public Member getLoginMember(String id, String passwd) {
		Member loginMember = null;
		LoginDAO loginDao = LoginDAO.getInstance();
		Connection con = null;
		
		try {
			con = getConnection();
			loginDao.setConnection(con);
			loginMember = loginDao.selectLoginMember(id, passwd);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(con);
		}
		
		return loginMember;
	}

}
