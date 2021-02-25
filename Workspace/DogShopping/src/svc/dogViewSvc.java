package svc;

import java.sql.Connection;

import dao.DogDAO;

import static db.JdbcUtil.*;
import vo.Dog;

public class dogViewSvc {

	public static Dog getDogView(int id) {
		Dog dog = null;
		Connection con = null;
		
		try {
			con = getConnection();
			DogDAO dogDao = DogDAO.getInstance();
			dogDao.setConnection(con);
			
			int updateCount = dogDao.updateReadCount(id);
			
			if(updateCount > 0) {
				commit(con);
				dog = dogDao.selectDog(id);
			} else {
				rollback(con);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(con);
		}
		
		return dog;
	}

}
