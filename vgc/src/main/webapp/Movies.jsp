<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<%@ page import="org.json.JSONArray, org.json.JSONObject" %>
<%@ page contentType="application/json;charset=UTF-8" language="java" %>
<%
    // CORS 헤더 추가
    response.setHeader("Access-Control-Allow-Origin", "*");
    response.setHeader("Access-Control-Allow-Methods", "GET, POST, OPTIONS");
    response.setHeader("Access-Control-Allow-Headers", "Content-Type");

    String DRIVER_CLASS_NAME = "org.mariadb.jdbc.Driver";
    String URL = "jdbc:mariadb://127.0.0.1:3306/vgc";
    String USERNAME = "root";
    String PASSWORD = "1234";

    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    JSONArray moviesArray = new JSONArray();

    try {
        Class.forName(DRIVER_CLASS_NAME);
        con = DriverManager.getConnection(URL, USERNAME, PASSWORD);

        String sql = "SELECT movie_id, title, description, release_date, genre, rating, poster_url FROM movies";
        stmt = con.prepareStatement(sql);
        rs = stmt.executeQuery();

        while (rs.next()) {
            JSONObject movie = new JSONObject();
            movie.put("movie_id", rs.getInt("movie_id"));
            movie.put("title", rs.getString("title"));
            movie.put("description", rs.getString("description"));
            movie.put("release_date", rs.getString("release_date"));
            movie.put("genre", rs.getString("genre"));
            movie.put("rating", rs.getDouble("rating"));
            movie.put("poster_url", rs.getString("poster_url"));

            moviesArray.put(movie);
        }
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    out.print(moviesArray.toString());
%>
