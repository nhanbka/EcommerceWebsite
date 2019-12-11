package entity;

import entity.CustomerOrder;
import entity.OrderedProductPK;
import entity.ProductDetail;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-12-11T23:27:21")
@StaticMetamodel(OrderedProduct.class)
public class OrderedProduct_ { 

    public static volatile SingularAttribute<OrderedProduct, OrderedProductPK> orderedProductPK;
    public static volatile CollectionAttribute<OrderedProduct, CustomerOrder> customerOrderCollection;
    public static volatile SingularAttribute<OrderedProduct, Integer> quantity;
    public static volatile CollectionAttribute<OrderedProduct, ProductDetail> productDetailCollection;

}