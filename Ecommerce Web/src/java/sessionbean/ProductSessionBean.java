package sessionbean;


import entity.Product;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import sessionbean.AbstractSessionBean;

/**
 *
 * @author ThanDieu
 */
@Stateless
public class ProductSessionBean extends AbstractSessionBean<Product> {

    @PersistenceContext(unitName = "Ecommerce_WebPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ProductSessionBean() {
        super(Product.class);
    }
}
