package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.DogCartListSvc;
import vo.ActionForward;
import vo.Cart;

public class DogCartListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		DogCartListSvc dogCartListSvc = new DogCartListSvc();
		ArrayList<Cart> cartList = dogCartListSvc.getCartList(request);
		//총금액 계산

		int totalMoney = 0;
		int money = 0;
		
		for(int i = 0; i < cartList.size(); i++) {
			money = cartList.get(i).getPrice()*cartList.get(i).getQty();
			totalMoney += money;
		}
		
		request.setAttribute("totalMoney", totalMoney);
		request.setAttribute("cartList", cartList);
		
		forward = new ActionForward();
		forward.setPath("dogCartList.jsp");
		
		return forward;
	}

}