package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.DogCartQtyDownSvc;
import vo.ActionForward;

public class DogCartQtyDownAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		String kind = request.getParameter("kind");
		DogCartQtyDownSvc dogCartQtyDownSvc = new DogCartQtyDownSvc();
		dogCartQtyDownSvc.downCartQty(kind, request);
		
		forward = new ActionForward();
		forward.setPath("dogCartList.dog");
		forward.setRedirect(true);
		
		return forward;
	}

}
