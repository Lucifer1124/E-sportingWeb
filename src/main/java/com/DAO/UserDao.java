
package com.DAO;

import com.entity.User;


public interface UserDao {
    public boolean userRegister(User us);

    /**
     *
     * @param email
     * @param password
     * @return
     */
    public User Login(String email,String password);
    public boolean checkInfo(String email);
}
