/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import entities.TblUserGroup;
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
public class UserGroupDAO {
    public TblUserGroup getGroupByName(String name) {
        EntityManager em = DBUtils.getEntityManager();
        try {
            EntityTransaction transaction = em.getTransaction();
            transaction.begin();

            List<TblUserGroup> users = em.createNamedQuery("TblUserGroup.findByName")
                    .setParameter("name", name)
                    .getResultList();

            transaction.commit();

            if (!users.isEmpty()) {
                return users.get(0);
            }
        } catch (Exception e) {
            Logger.getLogger(UserGroupDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            if (em != null) {
                em.close();
            }
        }

        return null;
    }
}
