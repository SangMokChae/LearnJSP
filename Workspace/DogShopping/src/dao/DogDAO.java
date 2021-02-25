package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import static db.JdbcUtil.*;

import vo.Dog;

public class DogDAO {
	Connection con;
	private static DogDAO dogDao;
	
	private DogDAO() {}
	
	public static DogDAO getInstance() {
		if(dogDao == null) {
			dogDao = new DogDAO();
		}
		
		return dogDao;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	public ArrayList<Dog> selectDogList() {
		ArrayList<Dog> dogList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from dog";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dogList = new ArrayList<Dog>();
				
				do {
					dogList.add(new Dog(rs.getInt("id")
							,rs.getString("kind")
							,rs.getInt("price")
							,rs.getString("image")
							,rs.getString("country")
							,rs.getInt("height")
							,rs.getInt("weight")
							,rs.getString("content")
							,rs.getInt("readcount")));
				} while (rs.next());
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return dogList;
	}

	public int insertDog(Dog dog) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateReadCount(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	public Dog selectDog(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}
