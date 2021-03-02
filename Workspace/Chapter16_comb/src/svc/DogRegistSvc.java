package svc;

import java.sql.Connection;
import static db.JdbcUtil.*;
import dao.DogDAO;
import vo.Dog;

public class DogRegistSvc {

	public boolean registDog(Dog dog) {
		boolean isRegistSuccess = false;
		Connection con = null;

		try {
			con = getConnection();
			DogDAO dogDao =  DogDAO.getInstance();
			dogDao.setConnection(con);
			
			int insertCount = dogDao.insertDog(dog);
			
			if(insertCount > 0) {
				commit(con);
				isRegistSuccess = true;
			} else {
				rollback(con);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(con);
		}
		
		return isRegistSuccess;
	}

}
