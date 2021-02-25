package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.DogCartQtyUpSvc;
import vo.ActionForward;

public class DogCartQtyUpAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		String kind = request.getParameter("kind");
		DogCartQtyUpSvc dogCartQtyUpSvc = new DogCartQtyUpSvc();
		dogCartQtyUpSvc.upCartQty(kind, request);
		
		forward = new ActionForward();
		forward.setPath("dogCartList");
		forward.setRedirect(true);
		
		return forward;
	}

}
