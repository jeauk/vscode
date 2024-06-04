<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%
response.setHeader("Access-Control-Allow-Origin","*");
    // 데이터베이스 연결 정보
    String DRIVER_CLASS_NAME = "org.mariadb.jdbc.Driver";
    String URL = "jdbc:mariadb://localhost:3306/vgc";
    String USERNAME = "root";
    String PASSWORD = "1234";

    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        // 데이터베이스 연결
        Class.forName(DRIVER_CLASS_NAME);
        con = DriverManager.getConnection(URL, USERNAME, PASSWORD);

        // SQL 쿼리 실행하여 좌석 정보 조회
        String sql = "SELECT seat FROM ticketing";
        stmt = con.createStatement();
        rs = stmt.executeQuery(sql);

        // 조회된 좌석을 담을 리스트 생성
        List<String> seatList = new ArrayList<>();

        // 조회된 좌석 정보를 리스트에 추가
        while (rs.next()) {
            String seats = rs.getString("seat");
            // 쉼표(,)를 기준으로 좌석 정보를 분할하여 리스트에 추가
            String[] seatsArray = seats.split(", ");
            for (String seat : seatsArray) {
                seatList.add(seat.trim()); // 좌석 정보 앞뒤 공백 제거 후 추가
            }
        	System.out.println(seats);
        	System.out.println(seatsArray);
        }

        // 조회된 좌석 정보를 JSON 형식으로 반환
        ObjectMapper om = new ObjectMapper();
        out.println(om.writeValueAsString(seatList));

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // 연결 및 자원 해제
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>