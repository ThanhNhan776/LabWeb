/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.TblPromotionList;
import entities.TblUser;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import utils.DBUtils;

/**
 *
 * @author TiTi
 */
public class PromotionListDAO {

    public TblPromotionList getPromotionListByUser(TblUser user) {
        EntityManager em = DBUtils.getEntityManager();
        try {
            EntityTransaction transaction = em.getTransaction();
            transaction.begin();

            List<TblPromotionList> promotions = em.createNamedQuery("TblPromotionList.findCurrentUsername")
                    .setParameter("username", user)
                    .getResultList();

            transaction.commit();

            if (!promotions.isEmpty()) {
                return promotions.get(0);
            }
        } catch (Exception e) {
            Logger.getLogger(PromotionListDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            if (em != null) {
                em.close();
            }
        }

        return null;
    }
    
    public TblPromotionList getPromotionListById(int id) {
        EntityManager em = DBUtils.getEntityManager();
        try {
            EntityTransaction transaction = em.getTransaction();
            transaction.begin();

            List<TblPromotionList> promotions = em.createNamedQuery("TblPromotionList.findById")
                    .setParameter("id", id)
                    .getResultList();

            transaction.commit();

            if (!promotions.isEmpty()) {
                return promotions.get(0);
            }
        } catch (Exception e) {
            Logger.getLogger(PromotionListDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            if (em != null) {
                em.close();
            }
        }

        return null;
    }

    public List<TblPromotionList> getAllPromotions() {
        EntityManager em = DBUtils.getEntityManager();
        try {
            EntityTransaction transaction = em.getTransaction();
            transaction.begin();

            List<TblPromotionList> promotions = em.createNamedQuery("TblPromotionList.findAll")
                    .getResultList();

            transaction.commit();

            return promotions;
        } catch (Exception e) {
            Logger.getLogger(PromotionListDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            if (em != null) {
                em.close();
            }
        }

        return null;
    }
    
    public TblPromotionList createPromotion(TblPromotionList promotion) {
        EntityManager em = DBUtils.getEntityManager();
        try {
            EntityTransaction transaction = em.getTransaction();
            transaction.begin();

            em.persist(promotion);

            transaction.commit();

            return promotion;
        } catch (Exception e) {
            Logger.getLogger(PromotionListDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            if (em != null) {
                em.close();
            }
        }

        return null;
    }
}
