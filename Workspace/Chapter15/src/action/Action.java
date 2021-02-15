package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vo.ActionForword;


public interface Action {
	ActionForword execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
