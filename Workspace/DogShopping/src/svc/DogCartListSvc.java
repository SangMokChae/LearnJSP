package svc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import vo.Cart;

public class DogCartListSvc {

	public ArrayList<Cart> getCartList(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ArrayList<Cart> cartList = (ArrayList<Cart>)session.getAttribute("cartList");
		return cartList;
	}
}

//public ArrayList<Cart> getCartList(HttpServletRequest request) {
//	ArrayList<Cart> cartList = null;
//	Connection con = null;
//	
//	try {
//		con = getConnection();
//		DogDAO dogDao = DogDAO.getInstance();
//		dogDao.setConnection(con);
//		HttpSession session = request.getSession();
//		
//		cartList = (ArrayList<Cart>)session.getAttribute("cartList");
//	} catch(Exception e) {
//		e.printStackTrace();
//	} finally {
//		close(con);
//	}
//	
//	return cartList;
//}

