<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
    response.setHeader("Access-Control-Allow-Origin", "*");

    // 선택된 좌석 정보와 총 가격을 요청에서 가져옴             selectedSeatInfo
    String selectedSeatInfo = request.getParameter("selectedSeatInfo");
    System.out.println(selectedSeatInfo);
    String totalPrice = request.getParameter("totalPrice");

    // 실제 환경에 맞게 데이터베이스 연결 정보 수정
    String DRIVER_CLASS_NAME = "org.mariadb.jdbc.Driver";
    String URL = "jdbc:mariadb://localhost:3306/vgc";
    String USERNAME = "root";
    String PASSWORD = "1234";

    // 데이터베이스 연결
    Class.forName(DRIVER_CLASS_NAME);
    Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);

    // SQL 쿼리 준비 및 실행
    String sql = "INSERT INTO ticketing (ticketingId, seat, price) VALUES (null, ?, ?)";
    PreparedStatement stmt = con.prepareStatement(sql);
    stmt.setString(1, selectedSeatInfo);
    stmt.setString(2, totalPrice);
    int result = stmt.executeUpdate();

    // 연결 및 자원 해제
    stmt.close();
    con.close();

    // 성공 응답을 위한 데이터 맵 구성
    Map<String, Object> map = new HashMap<>();
    map.put("code", 200);
    map.put("msg", "성공");

    // JSON 형식으로 응답
    ObjectMapper om = new ObjectMapper();
    out.println(om.writeValueAsString(map));
%>