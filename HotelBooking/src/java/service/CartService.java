/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import entities.TblBooking;
import entities.TblBookingDetails;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;

/**
 *
 * @author NhanTT
 */
public class CartService {
    private HttpSession session;
    
    public CartService(HttpSession session) {
        this.session = session;
    }
    
    public boolean addRoomToCart(TblBookingDetails detail) {
        if (!this.ensureCartExist()) {
            return false; 
        }
        
        TblBooking cart = this.getCart();
        cart.getTblBookingDetailsCollection().add(detail);
        return true;
    }
    
    public TblBooking getCart() {
        if (session == null) {
            return null;
        }
        TblBooking cart = (TblBooking) session.getAttribute("CART");
        return cart;
    }
    
    public boolean ensureCartExist() {
        if (session == null) {
            return false;
        }
        TblBooking cart = this.getCart();
        if (cart == null) {
            cart = new TblBooking();
            cart.setTblBookingDetailsCollection(new ArrayList<>());
            session.setAttribute("CART", cart);
        }
        return true;
    }
}
