package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.DogCartRemoveSvc;
import vo.ActionForward;


public class DogCartRemoveAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;

		String[] kindArray = request.getParameterValues("remove");
		DogCartRemoveSvc dogCartRemoveSvc = new DogCartRemoveSvc();
		dogCartRemoveSvc.cartRemove(request, kindArray);
		
		forward = new ActionForward();
		forward.setPath("dogCartList.dog");
		forward.setRedirect(true);
				
		return forward;
	}

}
