package svc;

import java.sql.Connection;
import static db.JdbcUtil.*;
import dao.LoginDAO;
import vo.Member;

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
