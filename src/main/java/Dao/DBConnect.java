/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Product;
import java.sql.*;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class DBConnect {

    private static String jdbcURL = "jdbc:sqlserver://localhost:1433;databaseName=PaperModelsDB;encrypt=true;trustServerCertificate=true;";
    private static String jdbcUser = "sa";
    private static String jdbcPass = "sa";

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(jdbcURL, jdbcUser, jdbcPass);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
