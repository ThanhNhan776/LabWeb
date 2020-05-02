/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.UserDAO;
import dao.UserGroupDAO;
import entities.TblUser;
import entities.TblUserGroup;
import java.util.List;
import javax.servlet.http.HttpSession;
import utils.PasswordEncrypter;

/**
 *
 * @author TiTi
 */
public class UserService {

    private HttpSession session;

    public UserService() {
    }

    public UserService(HttpSession session) {
        this.session = session;
    }

    public List<TblUser> getAllUsers(String searchName) {
        UserDAO userDAO = new UserDAO();
        return userDAO.getAllActiveUsers(searchName);
    }

    public List<TblUser> getAllUsers(TblUserGroup group) {
        UserDAO userDAO = new UserDAO();
        return userDAO.getAllActiveUsers(group);
    }
    
    public List<TblUserGroup> getAllGroups() {
        UserGroupDAO userGroupDAO = new UserGroupDAO();
        return userGroupDAO.getAllGroups();
    }

    public TblUser getCurrentUser() {
        if (session == null) {
            return null;
        }
        return (TblUser) session.getAttribute("USER");
    }

    public boolean setCurrentUser(TblUser user) {
        if (session == null) {
            return false;
        }

        session.setAttribute("USER", user);
        return true;
    }

    public TblUser login(String username, String password) {
        UserDAO userDAO = new UserDAO();
        TblUser user = userDAO.getUserByUsername(username);

        if (user == null) {
            return null;
        }

        String sha256Password = PasswordEncrypter.encrypt(password);
        if (user.getPassword().equals(sha256Password)) {
            return user;
        }
        return null;
    }

    public void logout() {
        this.setCurrentUser(null);
    }
}
