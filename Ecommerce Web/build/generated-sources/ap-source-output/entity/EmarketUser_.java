package entity;

import entity.EmarketUserPK;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-12-11T23:27:21")
@StaticMetamodel(EmarketUser.class)
public class EmarketUser_ { 

    public static volatile SingularAttribute<EmarketUser, EmarketUserPK> emarketUserPK;
    public static volatile SingularAttribute<EmarketUser, String> userPassword;
    public static volatile SingularAttribute<EmarketUser, Integer> gender;
    public static volatile SingularAttribute<EmarketUser, Integer> balance;
    public static volatile SingularAttribute<EmarketUser, String> name;
    public static volatile SingularAttribute<EmarketUser, Integer> userRole;

}