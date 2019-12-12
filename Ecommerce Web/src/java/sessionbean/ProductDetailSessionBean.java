/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sessionbean;

import entity.Category;
import entity.ProductDetail;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author ADMIN
 */
@Stateless
public class ProductDetailSessionBean extends AbstractSessionBean<ProductDetail> {

    @PersistenceContext(unitName = "Ecommerce_WebPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ProductDetailSessionBean() {
        super(ProductDetail.class);
    }
}
