
package com.DAO;

import com.entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class UserDaoimpl implements UserDao{
    private final Connection conn;
    public UserDaoimpl(Connection conn)
    {
        super();
        this.conn=conn;
    }
    @Override
    public boolean userRegister(User us)
    {
        boolean f=false;
        try{
           String sql="insert into user_data(name,email,phno,password) values(?,?,?,?)";
           PreparedStatement ps=conn.prepareStatement(sql);
           ps.setString(1,us.getName());
           ps.setString(2,us.getEmail());
           ps.setString(3,us.getPhno());
           ps.setString(4,us.getPassword());
           int i=ps.executeUpdate();
           if(i==1)
           {
           f=true;
           }
           
        
        
        }catch(Exception e){
        }
        return f;
    }
    
    
    
    
    
    @Override
    public boolean checkInfo(String email)
    {
        boolean f=false;
        try{
            String sql="select*from user_data where email=?";
           PreparedStatement ps=conn.prepareStatement(sql);
           ps.setString(1, email);
            ResultSet i=ps.executeQuery();
           if(i.next())
           {
               f=true;
               
           }
        }catch(Exception e){
        
        }
        return f;
        
    }
    @Override
    public User Login(String email,String password)
    {
        User us=null;
        try{
           String sql="select*from user_data where email=? and password=?";
           PreparedStatement ps=conn.prepareStatement(sql);
           ps.setString(1, email);
           ps.setString(2, password);
           ResultSet rs;
            rs = ps.executeQuery();
           while(rs.next())
           {
                     us=new User();
                     us.setId(rs.getInt(1));
                     us.setName(rs.getString(2));
                     us.setEmail(rs.getString(3));
                     us.setPhno(rs.getString(4));
                     us.setPassword(rs.getString(5));
                     us.setAddress(rs.getString(6));
                     us.setLandmark(rs.getString(7));
                     us.setCity(rs.getString(8));
                      us.setState(rs.getString(9));
                     us.setPincode(rs.getString(10));

           }

        
        }catch(Exception e){}
    
        return us;
    
    
    }
    
}
