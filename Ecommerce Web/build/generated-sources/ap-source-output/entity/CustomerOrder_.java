package entity;

import entity.Customer;
import entity.OrderedProduct;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-12-12T14:26:08")
@StaticMetamodel(CustomerOrder.class)
public class CustomerOrder_ { 

    public static volatile SingularAttribute<CustomerOrder, OrderedProduct> orderedProduct;
    public static volatile SingularAttribute<CustomerOrder, Integer> amount;
    public static volatile SingularAttribute<CustomerOrder, Date> dateCreated;
    public static volatile SingularAttribute<CustomerOrder, Integer> confirmationNumber;
    public static volatile SingularAttribute<CustomerOrder, Integer> orderId;
    public static volatile SingularAttribute<CustomerOrder, Customer> customercustomerId;

}