package action;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.dogViewSvc;
import vo.ActionForward;
import vo.Dog;

public class DogViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		int id = Integer.parseInt(request.getParameter("id"));
		Dog dog = dogViewSvc.getDogView(id);
		request.setAttribute("dog", dog);
		Cookie todayImageCookie = new Cookie("today"+id, dog.getImage());
		
		todayImageCookie.setMaxAge(60*60*24);
		response.addCookie(todayImageCookie);

		forward = new ActionForward();
		forward.setPath("dogView.jsp");
		
		return forward;
	}

}
