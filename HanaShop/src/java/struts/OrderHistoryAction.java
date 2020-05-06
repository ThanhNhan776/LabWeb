/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package struts;

import com.opensymphony.xwork2.ActionContext;
import entity.TblOrder;
import entity.TblUser;
import java.util.Date;
import java.util.List;
import java.util.Map;
import service.OrderService;
import service.UserService;

/**
 *
 * @author NhanTT
 */
public class OrderHistoryAction {
    
    private final String SUCCESS = "success";
    
    private List<TblOrder> orders;
    private String productName;
    private Date createdDate;
    
    public OrderHistoryAction() {
    }
    
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        UserService userService = new UserService(session);
        TblUser user = userService.getCurrentUser();
        
        OrderService orderService = new OrderService();
        orders = orderService.getOrders(user);
        
        return SUCCESS;
    }

    /**
     * @return the orders
     */
    public List<TblOrder> getOrders() {
        return orders;
    }

    /**
     * @param orders the orders to set
     */
    public void setOrders(List<TblOrder> orders) {
        this.orders = orders;
    }

    /**
     * @return the productName
     */
    public String getProductName() {
        return productName;
    }

    /**
     * @param productName the productName to set
     */
    public void setProductName(String productName) {
        this.productName = productName;
    }

    /**
     * @return the createdDate
     */
    public Date getCreatedDate() {
        return createdDate;
    }

    /**
     * @param createdDate the createdDate to set
     */
    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }
    
}
