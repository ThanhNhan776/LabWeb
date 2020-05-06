/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package service;

import dao.OrderDAO;
import entity.TblOrder;
import entity.TblUser;
import java.util.List;

/**
 *
 * @author TiTi
 */
public class OrderService {
    private OrderDAO orderDAO;

    public OrderService() {
        orderDAO = new OrderDAO();
    }
    
    public List<TblOrder> getOrders(TblUser user) {
        return orderDAO.getOrders(user);
    }
}
