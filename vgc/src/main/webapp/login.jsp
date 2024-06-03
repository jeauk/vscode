<%@page import="java.security.MessageDigest"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%

response.setHeader("Access-Control-Allow-Origin","*");

String userId = request.getParameter("id");
String userPassword = request.getParameter("pw");
System.out.println(userId);
System.out.println(userPassword);

MessageDigest md = null;
md = MessageDigest.getInstance("sha256");
md.update(userPassword.getBytes());
byte[] pwd = md.digest();
String result = "";
for(byte p : pwd) {
  // 10진수 숫자를 16진수로 변환
  result += String.format("%02x", p);
}
System.out.println(result);


String DRIVER_CLASS_NAME = "org.mariadb.jdbc.Driver";
String URL = "jdbc:mariadb://localhost:3306/vgc";
String USERNAME = "root";
String PASSWORD = "1234";

Class.forName(DRIVER_CLASS_NAME);
Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);


String sql = "select userPassword from joinup where userId = ?";
PreparedStatement stmt = con.prepareStatement(sql);
stmt.setString(1, userId);
ResultSet rs = stmt.executeQuery();

Map<String, Object> map = new HashMap<>();
int code = 0;
String msg = "";

if(rs.next()) {
	// 아이디는 존재하는 경우
	String dbPw = rs.getString("userPassword");
	if(result.equals(dbPw)) {
		// 비밀번호가 일치하는 경우
		code = 0;
		msg = "로그인 되었습니다!";
	} else  {
		// 비밀번호가 일치하지 않는 경우
		code = 1;
		msg = "비밀번호를 확인해주세요.";
	}
} else {
	// 아이디가 존재하지 않는 경우
	code = 2;
	msg = "아이디를 확인해주세요.";
}
ObjectMapper om = new ObjectMapper();
map.put("code", code);
map.put("msg", msg);

rs.close();
stmt.close();
con.close();


out.println(om.writeValueAsString(map));

%>