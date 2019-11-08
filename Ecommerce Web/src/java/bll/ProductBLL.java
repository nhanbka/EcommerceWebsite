package bll;

import entity.Product;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class ProductBLL {
    public List<Product> getNewProducts (int number) {
        try{
            Context initContext = new InitialContext();
            DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/eMarket");
            Connection conn = ds.getConnection();
            Statement sttm = conn.createStatement();
            String sql = "select TOP " + number + "* from Product";
            ResultSet rs = sttm.executeQuery(sql);
            ArrayList<Product> prods = new ArrayList<>();
            while(rs.next()){
                Product p = new Product();
                p.setProductID(rs.getInt("product_id"));
                p.setPrice(rs.getFloat("price"));
                p.setDescription(rs.getString("description"));
                p.setImage(rs.getString("image"));
                p.setName(rs.getString("name"));
                p.setThumbImage(rs.getString("thumb_image"));
                p.setLastUpdate(rs.getDate("last_update"));
                p.setDescriptionDetail(rs.getString("description_detail"));
                prods.add(p);   
            }
            rs.close();
            conn.close();
            return prods;
        } catch(SQLException ex){
        } catch (NamingException ex) {
            Logger.getLogger(ProductBLL.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}