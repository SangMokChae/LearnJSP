package action;

import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.DogListSvc;
import vo.ActionForward;
import vo.Dog;

public class DogListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		ArrayList<String> todayImageList = new ArrayList<String>();
		Cookie[] cookieArray = request.getCookies();
		
		if(cookieArray != null) {
			for (int i = 0;  i < cookieArray.length; i++) {
				if(cookieArray[i].getName().startsWith("today")) {
					todayImageList.add(cookieArray[i].getValue());
				}
			}
		}
		
		DogListSvc dogListSvc = new DogListSvc();
		ArrayList<Dog> dogList = dogListSvc.getDogList();
		request.setAttribute("dogList", dogList);
		request.setAttribute("todayImageList", todayImageList);
		
//		forward = new ActionForward();
//		forward.setPath("dogList.jsp");
//		forward.setRedirect(false);
		
		forward = new ActionForward("dogList.jsp", false);
		
		return forward;
	}

}
