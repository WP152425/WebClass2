package org.dimigo.service;

import java.sql.Connection;
import java.util.List;

import org.dimigo.dao.UserDao;
import org.dimigo.vo.UserVO;

public class UserService extends AbstractService{

	public UserVO login(UserVO user) throws Exception{
		
		Connection conn = null;
		try{
			conn = getConnection();
			UserDao dao = new UserDao(conn);
			UserVO result = dao.searchUser(user);
			
			if (result == null){
				throw new Exception("Invaild username or password");
			} else return result;
		} finally {
			if (conn != null) conn.close();
		}
		
	}
	
	public List<UserVO> searchUserList() throws Exception{
		Connection conn = null;
		try{
			conn = getConnection();
			UserDao dao = new UserDao(conn);
			
			return dao.searchUserList();
			} finally {
			if (conn != null) conn.close();
		}
	}
	
	public void signup(UserVO user) throws Exception{
		
		Connection conn = null;
		try{
			conn = getConnection();
			UserDao dao = new UserDao(conn);
			
			// 사용중인 아이디인지 체크
			UserVO result = dao.searchUserById(user);
			if (result != null) {
				throw new Exception("사용중인 아이디입니다.");
			}
			
			// 회원가입 처리
			dao.insertUser(user);
		} finally {
			if (conn != null) conn.close();
		}
		
	}

}
