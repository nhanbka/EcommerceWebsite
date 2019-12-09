/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sessionbean;

import entity.Category;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import sessionbean.AbstractSessionBean;

/**
 *
 * @author ADMIN
 */
@Stateless
public class CategorySessionBean extends AbstractSessionBean<Category> {

    @PersistenceContext(unitName = "Ecommerce_WebPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CategorySessionBean() {
        super(Category.class);
    }
}
