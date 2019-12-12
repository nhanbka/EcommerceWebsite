/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sessionbean;

import java.util.List;
import javax.persistence.EntityManager;

public abstract class AbstractSessionBean<T> {

    private Class<T> entityClass;

    public AbstractSessionBean(Class<T> entityClass) {
        this.entityClass = entityClass;
    }

    protected abstract EntityManager getEntityManager();

    public void create(T entity) {
        getEntityManager().persist(entity);
    }

    public void edit(T entity) {
        getEntityManager().merge(entity);
    }

    public void remove(T entity) {
        getEntityManager().remove(getEntityManager().merge(entity));
    }

    public T find(Object id) {
        return getEntityManager().find(entityClass, id);
    }

    public List<T> findAll() {
        javax.persistence.criteria.CriteriaQuery cq
                = getEntityManager().getCriteriaBuilder().createQuery();
        cq.select(cq.from(entityClass));
        return getEntityManager().createQuery(cq).getResultList();
    }

    public List<T> findRange(int[] range) {
        javax.persistence.criteria.CriteriaQuery cq
                = getEntityManager().getCriteriaBuilder().createQuery();
        cq.select(cq.from(entityClass));
        javax.persistence.Query q = getEntityManager().createQuery(cq);
        q.setMaxResults(range[1] - range[0]);
        q.setFirstResult(range[0]);
        return q.getResultList();
    }

    public int count() {
        javax.persistence.criteria.CriteriaQuery cq
                = getEntityManager().getCriteriaBuilder().createQuery();
        javax.persistence.criteria.Root<T> rt = cq.from(entityClass);
        cq.select(getEntityManager().getCriteriaBuilder().count(rt));
        javax.persistence.Query q = getEntityManager().createQuery(cq);
        return ((Long) q.getSingleResult()).intValue();
    }
    
//        public static <T> findById(int productId){
//        Product product = new Product();
//        String query = "SELECT * FROM product"
//                + " WHERE [product_id]='" + productId + "'";
//        Connection conn = null;
//        try {
//            Context initContext = new InitialContext();
//            Context envContext = (Context) initContext.lookup("java:comp/env");
//            DataSource ds = (DataSource) envContext.lookup("jdbc/eMarket");
//            try {
//                conn = ds.getConnection();
//                Statement statement = conn.createStatement();
//                ResultSet rs = statement.executeQuery(query);
//                if (rs.next()) {
//                    product.setProductId(productId);
//                    product.setName(rs.getNString("name"));
//                    product.setPrice(rs.getFloat("price"));
//                    product.setDescription(rs.getString("description"));
//                    product.setDescriptionDetail(rs.getString("description_detail"));
//                    product.setImage(rs.getString("image"));
//                    product.setThumbImage(rs.getString("thumb_image"));
//                    product.setLastUpdate(rs.getDate("last_update"));
//                    product.setCategorycategoryId(rs.getInt("categorycategory_id"));
//                    product.setProductDetailproductId(rs.getInt("product_detailproduct_id"));
//                }
//            } catch (SQLException s) {
//                System.err.println(s);
//            } finally {
//                conn.close();
//            }
//        } catch (NamingException n) {
//            System.err.print(n);
//        } catch (SQLException s) {
//            System.err.println(s);
//        }
//        return product;
//    }

}
