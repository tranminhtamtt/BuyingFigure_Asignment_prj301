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

    private static final String SERVER = "PaperModelsDB.mssql.somee.com";
    private static final String DB_NAME = "PaperModelsDB";
    private static final String USER = "tranminhtam10a2";
    private static final String PASS = "22102005tamZZ..";

    private static final String jdbcURL = "jdbc:sqlserver://" + SERVER + ":1433;databaseName=" + DB_NAME
            + ";encrypt=true;trustServerCertificate=true;";

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(jdbcURL, USER, PASS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
