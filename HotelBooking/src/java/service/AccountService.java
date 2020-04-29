/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.AccountDAO;
import entities.TblAccount;

/**
 *
 * @author NhanTT
 */
public class AccountService {
    public TblAccount login(String email, String password) {
        AccountDAO accountDAO = new AccountDAO();
        TblAccount account = accountDAO.getAccountByEmail(email);
        
        if (account.getPassword().equals(password)) {
            return account;
        }
        return null;
    }
}
