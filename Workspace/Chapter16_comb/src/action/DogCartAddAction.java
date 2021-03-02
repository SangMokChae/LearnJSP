package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.DogCartAddSvc;
import vo.ActionForward;
import vo.Dog;

public class DogCartAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		DogCartAddSvc dogCartAddSvc = new DogCartAddSvc();
		int id = Integer.parseInt(request.getParameter("id"));
		Dog cartDog = dogCartAddSvc.getCartDog(id);
		dogCartAddSvc.addCart(request, cartDog);
		
		forward = new ActionForward();
		forward.setPath("dogCartList.dog");
		forward.setRedirect(true);
		
		return forward;
	}

}
