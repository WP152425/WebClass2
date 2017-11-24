package org.dimigo.action;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class sessionAction implements IAction{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		// session에 사용자 정보가 없으면 login.jsp로 포워딩
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null){
			RequestDispatcher rd = request.getRequestDispatcher("jsp/login.jsp");
			rd.forward(request, response);
		}
		// session이 있으면 jsp/sessionInfo.jsp로 포워딩
		// sessionInfo.jsp : id, name, nickname을 그대로 출력
		else {
			RequestDispatcher rd = request.getRequestDispatcher("jsp/sessionInfo.jsp");
			rd.forward(request, response);
		}
	}
	
}
