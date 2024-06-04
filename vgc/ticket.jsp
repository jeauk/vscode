<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="org.json.JSONObject" %>

<%
    // 데이터베이스 연결 정보 설정
    String DRIVER_CLASS_NAME = "org.mariadb.jdbc.Driver";
    String URL = "jdbc:mariadb://localhost:3306/vgc";
    String USERNAME = "root";
    String PASSWORD = "1234";
    
    // 데이터베이스 연결 관련 객체 초기화
    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    
    // JSON 객체 생성
    JSONObject lastReservation = new JSONObject();

    try {
        // JDBC 드라이버 로드 및 데이터베이스 연결
        Class.forName(DRIVER_CLASS_NAME);
        con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        
        // SQL 쿼리 작성
        String sql = "SELECT reservationId, location, hall, spot, date, starttime, endtime FROM reservation ORDER BY reservationId DESC LIMIT 1";
        
        // PreparedStatement 생성
        stmt = con.prepareStatement(sql);
        
        // SQL 쿼리 실행 및 결과셋 처리
        rs = stmt.executeQuery();
        
        if (rs.next()) {								
            lastReservation.put("reservationId", rs.getInt("reservationId"));
            lastReservation.put("location", rs.getString("location"));
            lastReservation.put("hall", rs.getString("hall"));
            lastReservation.put("spot", rs.getString("spot"));
            lastReservation.put("date", rs.getString("date"));
            lastReservation.put("starttime", rs.getString("starttime"));
            lastReservation.put("endtime", rs.getString("endtime"));
        }
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        // 자원 해제
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    // 마지막 예약 정보를 JSON 형식으로 출력
    response.setContentType("application/json"); // JSON 형식임을 명시
    response.setHeader("Access-Control-Allow-Origin", "*"); // CORS 정책 해결
    out.print(lastReservation.toString());
%>