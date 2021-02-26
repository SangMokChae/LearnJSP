package svc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import dao.DogDAO;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import vo.Cart;
import vo.Dog;


public class DogCartAddSvc {

	public Dog getCartDog(int id) {
		Dog dog = null;
		Connection con = null;
		
		try {
			con = getConnection();
			DogDAO dogDao = DogDAO.getInstance();
			dogDao.setConnection(con);
			
			dog = dogDao.selectDog(id);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(con);
		}
		
		return dog;
	}

	public void addCart(HttpServletRequest request, Dog cartDog) { //DogCartAddAction 안에 구현해도 된다. request의 영향이 service에 넘어옴
		HttpSession session = request.getSession();
		ArrayList<Cart> cartList = (ArrayList<Cart>)session.getAttribute("cartList");
		
		if(cartList == null) {
			cartList = new ArrayList<Cart>();
			session.setAttribute("cartList", cartList);
		}
		
		boolean isNewCart = true;
		// 지금 장바구니에 담는 항목이 새로 추가되는지 항목인지를 저장할 변수
		for (int i = 0; i < cartList.size(); i++) {
			if(cartDog.getKind().equals(cartList.get(i).getKind())) {
				isNewCart = false;
				cartList.get(i).setQty(cartList.get(i).getQty() + 1);
				break;
			}
		}
		
		if(isNewCart) {
			Cart cart = new Cart();
			cart.setImage(cartDog.getImage());
			cart.setKind(cartDog.getKind());
			cart.setPrice(cartDog.getPrice());
			cart.setQty(1);
			cartList.add(cart);
		}
	}
}

	// cartList속성 1. session, 2. request(default)
