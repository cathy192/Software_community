/**
 * db와 연결하기위해 커넥션 객체 생성하는데, 미리 connection 객체만들고 가져다 쓰는것. 다쓰고 반환
 */
package com.board.action;
 
import java.sql.*;
import java.util.ArrayList;
 


import javax.servlet.http.HttpServletRequest;
 
import javax.servlet.http.HttpServletResponse;
 
import javax.servlet.http.HttpSession;

import com.board.beans.board;
import com.board.beans.comment;
import com.board.controller.CommandAction;
 
public class ContentAction implements CommandAction {
	
    public String requestPro(HttpServletRequest request,
 
    HttpServletResponse response) throws Throwable {
 
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	
    	int num = Integer.parseInt(request.getParameter("num"));
    	Connection conn = null;
    	Statement stmt = null;    	
    	ResultSet rs = null;
    	ResultSet rs1 = null;
    	int score = 0;
    	try {
    		
    		HttpSession session = request.getSession();
    		String id = (String) session.getAttribute("id");
    		if(id == null){    			
    			return "loginerror.jsp";
    		}
    		
    		String jdbcDriver = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC";
    		
    			//	+
    			//				"useUnicode=true&characterEncoding = euc-kr";
    		String dbUser = "root";
    		String dbPass = "root";
    		
    		String query = "select * from board1 where num = "+num;
    		String query1 = "select distinct comment1.num,comment1.id,comment1.boarddate,comment1.content from comment1 join board1 on comment1.num="+num;
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
    			article.setCategory(rs.getInt("category"));
    			score = Integer.parseInt(rs.getString("score")) + 1;
    			article.setScore(String.valueOf(score));
    			//article.setEmail(rs.getString("email"));
    			articleList.add(article);
    		}
    		request.setAttribute("articleList",articleList);
    		
    		
    		rs1 = stmt.executeQuery(query1);
    		
			ArrayList<comment> commentList = new ArrayList<comment>();
    		
    		while(rs1.next()){
    			comment comments = new comment();
    			comments.setNum(rs1.getInt("num"));    		
    			comments.setId(rs1.getString("id"));
    			comments.setContent(rs1.getString("content"));
    			comments.setBoarddate(rs1.getString("boarddate"));
    			commentList.add(comments);
    		}
    		request.setAttribute("commentList",commentList);
    		String query2 =  "UPDATE board1 SET score='" + score +    						
					"' WHERE num=" + num;
    		stmt.executeUpdate(query2);
    		
    	} catch(SQLException ex){
    		
    	} finally{
    		if(rs != null) try{rs.close();} catch(SQLException ex){}
    		if(stmt != null) try{stmt.close();} catch(SQLException ex) {}
    		
    		if(conn != null) try{conn.close();} catch(SQLException ex) {}
    	}
 
        return "content.jsp";
 
    }
 
}