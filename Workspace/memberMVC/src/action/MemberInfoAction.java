package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.LoginInfoSvc;
import vo.ActionForward;
import vo.MemberBean;

public class MemberInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		
		LoginInfoSvc loginInfoSvc = new LoginInfoSvc();
		MemberBean member = loginInfoSvc.getLoginInfo(id);
		
		if(session.getAttribute("id") == null || (!((String)session.getAttribute("id")).equals("admin"))) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("location.href='loginForm.jsp';");
			out.println("</script>");
		} else {
			if(member != null) {
			session.setAttribute("id", id);
			forward = new ActionForward();
			forward.setPath("/member/member_Info.jsp");
			forward.setRedirect(true);
			}
		}
				
		return forward;
	}

}
