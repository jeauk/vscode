<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="dbconfig.jsp" %>

<%
    response.setHeader("Access-Control-Allow-Origin", "*");

    String field = request.getParameter("field");
    String value = request.getParameter("value");

    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        con = getConnection();
        String sql = "SELECT COUNT(*) FROM joinup WHERE " + field + " = ?";
        stmt = con.prepareStatement(sql);
        stmt.setString(1, value);
        rs = stmt.executeQuery();

        boolean isDuplicate = false;
        if (rs.next() && rs.getInt(1) > 0) {
            isDuplicate = true;
        }

        out.println("{\"isDuplicate\": " + isDuplicate + "}");

    } catch (SQLException | ClassNotFoundException e) {
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        out.println("{\"isDuplicate\": false}");
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (con != null) con.close();
        } catch (SQLException ignore) {
            ignore.printStackTrace();
        }
    }
%>
