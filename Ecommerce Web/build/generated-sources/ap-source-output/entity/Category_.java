package entity;

import entity.Product;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-12-11T23:27:21")
@StaticMetamodel(Category.class)
public class Category_ { 

    public static volatile SingularAttribute<Category, String> image;
    public static volatile CollectionAttribute<Category, Product> productCollection;
    public static volatile SingularAttribute<Category, String> name;
    public static volatile SingularAttribute<Category, Integer> categoryId;

}