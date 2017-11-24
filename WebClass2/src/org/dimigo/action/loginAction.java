package org.dimigo.action;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dimigo.service.UserService;
import org.dimigo.util.CommonUtil;
import org.dimigo.vo.UserVO;

public class loginAction implements IAction{

	// �Է°� ����
	private void validate(String id, String pwd) throws Exception{
		if (CommonUtil.isEmpty(id)){
			throw new Exception("���̵� �Է��ϼ���");
		}
		if (CommonUtil.isEmpty(pwd)){
			throw new Exception("��й�ȣ�� �Է��ϼ���");
		}
	}
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try{
			request.setCharacterEncoding("utf-8");
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			System.out.printf("id : %s, pwd : %s\n", id ,pwd);
			
			// �Է°� ����
			validate(id, pwd);
			
			response.setContentType("text/html;charset=utf-8");
			
			// id,pwd ��Ȯ�� üũ
			UserService service = new UserService();
			UserVO vo = new UserVO();
			vo.setId(id);
			vo.setPwd(pwd);
			
			UserVO result = service.login(vo);
			
			if (result != null){
				// ���ǿ� ����� ���� ����
				HttpSession session = request.getSession();
				session.setAttribute("user", result);
				
				RequestDispatcher rd = request.getRequestDispatcher("jsp/home.jsp");
				rd.forward(request, response);
			} else {
				throw new Exception("Invalid username or password");
			}
		} catch(Exception e){
			e.printStackTrace();
//			request.setAttribute("msg", "error");
			request.setAttribute("error", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("jsp/login.jsp");
			rd.forward(request, response);
		}
	}

}
