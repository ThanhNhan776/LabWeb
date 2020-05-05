/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package service;

import dao.ProductDAO;
import entity.TblProduct;
import java.util.List;

/**
 *
 * @author TiTi
 */
public class ProductService {
    public List<TblProduct> getProducts(String productName, float minPrice, float maxPrice) {
        ProductDAO productDAO = new ProductDAO();
        return productDAO.getProducts(productName, minPrice, maxPrice);
    }
}
