/**
 * ����Ʈ�� �����ֱ� ���� Action
 */
package com.board.action;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.beans.board;
import com.board.controller.CommandAction;
 
public class ListAction2 implements CommandAction {
	
    public String requestPro(HttpServletRequest request,
 
    HttpServletResponse response) throws Throwable {
 
    	Class.forName("com.mysql.cj.jdbc.Driver");    	    
    	Connection conn = null;
    	Statement stmt = null;
    	ResultSet rs = null;    	
    	
    	
    	String opt = request.getParameter("opt");
    	String condition = request.getParameter("condition");
    	
    	try {
    		HttpSession session = request.getSession();
    		 		    		
    		String id = (String) session.getAttribute("id");    
 
    		if(id == null){    			
    			return "loginerror.jsp";
    		}
    		
    		String jdbcDriver = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC";
    		           // +
    				
    		String dbUser = "root";
    		String dbPass = "root";
    		String query = null; 
    		
    		if(opt == null){    			
    			query =  "select * from board1  where category=2 order by num";
    		}else if(opt.equals("0")){    			
    			query = "select * from board2 where subject like '%"+condition+"%' order by num";        		
    		}else if(opt.equals("1")){    			
    			query = "select * from board2 where content like '%"+condition+"%' order by num";        		
    	   	}else if(opt.equals("2")){    			
    			query = "select * from board2 where id like '%"+condition+"%' order by num";        		
    		}
    		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
    		
    		stmt = conn.createStatement();    		
    		rs = stmt.executeQuery(query);    		
    		
    		ArrayList<board> articleList = new ArrayList<board>();    		
    		
    		while(rs.next()){
    			board article = new board();
    			article.setNum(rs.getInt("num"));
    			article.setSubject(rs.getString("subject"));
    			article.setContent(rs.getString("content"));
    			article.setId(rs.getString("id"));
    			article.setBoarddate(rs.getString("boarddate"));
    			article.setScore(rs.getString("score"));
    			article.setCategory(rs.getInt("category"));
    			articleList.add(article);
    			
    		}
    		request.setAttribute("articleList",articleList);
    		
    	} catch(SQLException ex){
    		
    	} finally{
    		if(rs != null) try{rs.close();} catch(SQLException ex){}
    		if(stmt != null) try{stmt.close();} catch(SQLException ex) {}
    		
    		if(conn != null) try{conn.close();} catch(SQLException ex) {}
    	}
 
        return "list.jsp";
 
    }
 
}