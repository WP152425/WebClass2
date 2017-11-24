package org.dimigo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.dimigo.vo.UserVO;

public class UserDao {
	
	private Connection conn = null;
	
	public UserDao(Connection conn){
		this.conn = conn;
	}
	
	public UserVO searchUser(UserVO vo) throws Exception{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM USER WHERE ID = ? AND PWD = ?";
				
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPwd());
			
			rs = pstmt.executeQuery();
			
			UserVO result = null;
			if(rs.next()){
				result = new UserVO();
				result.setId(rs.getString(1));
				result.setName(rs.getString(3));
				result.setNickname(rs.getString(4));
			}
			
			System.out.println(result);
			return result;
			
		} catch(Exception e){
			e.printStackTrace();
			throw new Exception("����� ��ȸ�� ������ �߻��߽��ϴ�.");
		} finally {
			if(rs != null) rs.close();
			if (pstmt!= null) pstmt.close();
		}
	}

	public UserVO searchUserById(UserVO vo) throws Exception{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM USER WHERE ID = ?";
				
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			
			rs = pstmt.executeQuery();
			
			UserVO result = null;
			if(rs.next()){
				result = new UserVO();
				result.setId(rs.getString(1));
				result.setName(rs.getString(3));
				result.setNickname(rs.getString(4));
			}
			
			System.out.println(result);
			return result;
			
		} catch(Exception e){
			e.printStackTrace();
			throw new Exception("����� ��ȸ�� ������ �߻��߽��ϴ�.");
		} finally {
			if(rs != null) rs.close();
			if (pstmt!= null) pstmt.close();
		}
	}

	public void insertUser(UserVO vo) throws Exception{
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO USER VALUES(?,?,?,?)";
				
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getNickname());
			
			int count = pstmt.executeUpdate();
			
			if (count == 0) throw new Exception("ȸ�����Կ� �����Ͽ����ϴ�.");
			
			
		} catch(Exception e){
			e.printStackTrace();
			throw new Exception("����� ȸ�����Խ� ������ �߻��߽��ϴ�.");
		} finally {
			if (pstmt!= null) pstmt.close();
		}
	}

	public List<UserVO> searchUserList() throws Exception{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT ID, NAME, NICKNAME FROM USER";
				
		try{
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			UserVO result = null;
			List<UserVO> list = new ArrayList<>();
			
			while(rs.next()){
				result = new UserVO();
				result.setId(rs.getString(1));
				result.setName(rs.getString(2));
				result.setNickname(rs.getString(3));
				list.add(result);
			}
			
			System.out.println(list);
			return list;
			
		} catch(Exception e){
			e.printStackTrace();
			throw new Exception("����� ��� ��ȸ�� ������ �߻��߽��ϴ�.");
		} finally {
			if(rs != null) rs.close();
			if (pstmt!= null) pstmt.close();
		}
	}
}
