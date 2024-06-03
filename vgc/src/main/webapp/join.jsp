<%@page import="java.security.MessageDigest"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	response.setHeader("Access-Control-Allow-Origin","*");

	String userEmail = request.getParameter("useremail");
	String userId = request.getParameter("userId");
	String userPassword = request.getParameter("userPassword");
	String userName = request.getParameter("userName");
	String userCallname = request.getParameter("userName");
	System.out.println(userEmail);
	System.out.println(userId);
	System.out.println(userPassword);
	System.out.println(userName);
	System.out.println(userCallname);
	
	MessageDigest md = null;
	md = MessageDigest.getInstance("sha256");
	md.update(userPassword.getBytes());
	byte[] pwd = md.digest();
	String result2 = "";
	for(byte p : pwd) {
	  // 10진수 숫자를 16진수로 변환
	  result2 += String.format("%02x", p);
	}
	System.out.println(result2);

	String DRIVER_CLASS_NAME = "org.mariadb.jdbc.Driver";
	String URL = "jdbc:mariadb://localhost:3306/vgc";
	String USERNAME = "root";
	String PASSWORD = "1234";

	Class.forName(DRIVER_CLASS_NAME);
	Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);

	String sql = "insert into joinup (id, userEmail, userId, userPassword, userName, userCallname) values (null, ?, ?, ?, ?, ?)";

	PreparedStatement stmt = con.prepareStatement(sql);;
	stmt.setString(1, userEmail);
	stmt.setString(2, userId);
	stmt.setString(3, result2.toString());
	stmt.setString(4, userName);
	stmt.setString(5, userCallname);
	int result = stmt.executeUpdate();
	
	stmt.close();
	con.close();
	
	
	out.println("{\"msg\": \"가입완료\", \"code\": 200}");
%>
















