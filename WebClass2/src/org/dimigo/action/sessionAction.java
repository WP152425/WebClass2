package org.dimigo.action;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class sessionAction implements IAction{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		// session�� ����� ������ ������ login.jsp�� ������
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null){
			RequestDispatcher rd = request.getRequestDispatcher("jsp/login.jsp");
			rd.forward(request, response);
		}
		// session�� ������ jsp/sessionInfo.jsp�� ������
		// sessionInfo.jsp : id, name, nickname�� �״�� ���
		else {
			RequestDispatcher rd = request.getRequestDispatcher("jsp/sessionInfo.jsp");
			rd.forward(request, response);
		}
	}
	
}
