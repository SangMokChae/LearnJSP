package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.DogCartSearchSvc;
import vo.ActionForward;
import vo.Cart;

public class DogCartSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		DogCartSearchSvc dogCartSearchSvc = new DogCartSearchSvc();
		
		int startMoney = Integer.parseInt(request.getParameter("startMoney"));
		int endMoney = Integer.parseInt(request.getParameter("endMoney"));
		
		ArrayList<Cart> cartList = dogCartSearchSvc.getCartSearchList(startMoney, endMoney, request); //응답하면 사라짐 / session의 값을 받아와서 request에 할당
		request.setAttribute("cartList", cartList); // 둘다 같은 이름의 cartList로 설정해서 가져온다. (searchSvc 참조)
		request.setAttribute("startMoney", startMoney);
		request.setAttribute("endMoney", endMoney);

		int totalMoney = 0;
		int money = 0;
		
		for(int i = 0; i < cartList.size(); i++) {
			money = cartList.get(i).getPrice()*cartList.get(i).getQty();
			totalMoney += money;
		}
		
		request.setAttribute("totalMoney", totalMoney);
		ActionForward forward = new ActionForward();
		forward.setPath("dogCartList.jsp");
		
		return forward;
	}

}
