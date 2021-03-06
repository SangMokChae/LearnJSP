package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberInfoSvc;
import vo.ActionForward;
import vo.MemberBean;

public class MemberInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		
		if(session.getAttribute("id") == null || (!((String)session.getAttribute("id")).equals("admin"))) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('관리자로 로그인하세요!!');");
			out.println("location.href='loginForm.jsp';");
			out.println("</script>");
		} else {
			String id = request.getParameter("id");

			MemberInfoSvc memberInfoSvc = new MemberInfoSvc();
			MemberBean member = memberInfoSvc.getLoginInfo(id);
			
			if(member != null) {
				request.setAttribute("member", member);
				
				forward = new ActionForward();
				forward.setPath("/member/member_info.jsp");
//				forward.setRedirect(redirect); 를 하면 안에 내용을 넘기기 위해서 보내준다. 그래서 바로보내지 않기 위해 디스패쳐를 사용한다.
			} else {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				
				out.println("<script>");
				out.println("alert('회원정보가 없습니다.');");
				out.println("location.href=memberList.mem;");
				out.println("</script>");
			}
		}
				
		return forward;
	}

}
