package entity;

import entity.OrderedProduct;
import entity.Product;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-12-03T17:26:57")
@StaticMetamodel(ProductDetail.class)
public class ProductDetail_ { 

    public static volatile SingularAttribute<ProductDetail, String> image5;
    public static volatile SingularAttribute<ProductDetail, OrderedProduct> orderedProduct;
    public static volatile SingularAttribute<ProductDetail, String> image3;
    public static volatile SingularAttribute<ProductDetail, String> image4;
    public static volatile SingularAttribute<ProductDetail, Integer> productId;
    public static volatile CollectionAttribute<ProductDetail, Product> productCollection;
    public static volatile SingularAttribute<ProductDetail, String> accessories;
    public static volatile SingularAttribute<ProductDetail, String> information;
    public static volatile SingularAttribute<ProductDetail, String> image1;
    public static volatile SingularAttribute<ProductDetail, String> image2;
    public static volatile SingularAttribute<ProductDetail, String> guaranty;

}