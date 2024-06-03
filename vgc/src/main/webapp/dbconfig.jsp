<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.SQLException" %>

<%! 
public Connection getConnection() throws SQLException, ClassNotFoundException {
    String jdbcUrl = "jdbc:mariadb://localhost:3306/vgc";
    String jdbcUser = "root";
    String jdbcPassword = "1234";
    
    Class.forName("org.mariadb.jdbc.Driver");
    return DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPassword);
}
%>