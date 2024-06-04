<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	response.setHeader("Access-Control-Allow-Origin","*");

	String location = request.getParameter("regionSelector");
	String hall = request.getParameter("hall2");
	String spot = request.getParameter("cinemaSelector");
	String date = request.getParameter("dateElement");
	String stime = request.getParameter("timeSlotsContainer");
	String etime = request.getParameter("timeSlotsContainer2");
	System.out.println(location);
	System.out.println(spot);
	System.out.println(hall);
	System.out.println(date);
	System.out.println(stime);
	System.out.println(etime);

	String DRIVER_CLASS_NAME = "org.mariadb.jdbc.Driver";
	String URL = "jdbc:mariadb://localhost:3306/vgc";
	String USERNAME = "root";
	String PASSWORD = "1234";

	Class.forName(DRIVER_CLASS_NAME);
	Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);

	String sql = "insert into reservation (reservationId, location, hall, spot, date, starttime, endtime) values (null, ?, ?, ?, ?, ?, ?)";


	PreparedStatement stmt = con.prepareStatement(sql);
	stmt.setString(1, location);
	stmt.setString(2, hall);
	stmt.setString(3, spot);
	stmt.setString(4, date);
	stmt.setString(5, stime);
	stmt.setString(6, etime);
	int result = stmt.executeUpdate();
	
	stmt.close();
	con.close();
	
	
	
%>
















