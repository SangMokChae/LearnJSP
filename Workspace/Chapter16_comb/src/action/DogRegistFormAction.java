package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.ActionForward;

public class DogRegistFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("dogRegistForm.jsp");
		forward.setRedirect(false);
		// controller에 바로 사용해도 된다.
		
		return forward;
	}

}
