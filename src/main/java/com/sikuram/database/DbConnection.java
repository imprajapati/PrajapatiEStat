package com.sikuram.database;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {

    private final static String connectionStr ="jdbc:postgresql://localhost/pestate";
    private final static String userName="postgres";
    private final static String password="test";
    static Connection con;

    private final static String driverClass="org.postgresql.Driver"; // Correct driver class for PostgreSQL

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName(driverClass);  
        con=DriverManager.getConnection(connectionStr, userName, password);
     
        return con;
    }   
    public static void main(String[] args) {
        try {
            // Get the database connection
            Connection con = DbConnection.getConnection();

            // Check if the connection is successful
            if (con != null) {
                System.out.println("Connection established successfully!");
                // You can proceed with your database operations here
            } else {
                System.out.println("Failed to establish connection!");
            }

            // Remember to close the connection when done
            if (con != null) {
                con.close();
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Handle any exceptions that occur during connection
            e.printStackTrace();
        }
    }
}
