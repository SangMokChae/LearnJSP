package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.DogDAO;

import static db.JdbcUtil.*;
import vo.Dog;

public class DogListSvc {

	public ArrayList<Dog> getDogList() {
		ArrayList<Dog> dogList = null;
		Connection con = null;
		
		try {
			con = getConnection();
			DogDAO dogDao = DogDAO.getInstance();
			dogDao.setConnection(con);
			
			dogList = dogDao.selectDogList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con);
		}
		
		return dogList;
	}
}
