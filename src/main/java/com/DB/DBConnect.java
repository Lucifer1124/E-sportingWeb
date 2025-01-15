
package com.DB;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



public class DBConnect {
    private static Connection conn;
    public  static Connection getConn()
    {
        try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/SPORTS?zeroDateTimeBehavior=CONVERT_TO_NULL","root","nigganigga123@");
        
        
        }catch(ClassNotFoundException | SQLException e){
        }
        return conn;
        
        
        
        
    }
    
    
}
