/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.sql.DataSource;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "emarket_user")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "EmarketUser.findAll", query = "SELECT e FROM EmarketUser e"),
    @NamedQuery(name = "EmarketUser.findById", query = "SELECT e FROM EmarketUser e WHERE e.emarketUserPK.id = :id"),
    @NamedQuery(name = "EmarketUser.findByUserPassword", query = "SELECT e FROM EmarketUser e WHERE e.userPassword = :userPassword"),
    @NamedQuery(name = "EmarketUser.findByUserRole", query = "SELECT e FROM EmarketUser e WHERE e.userRole = :userRole"),
    @NamedQuery(name = "EmarketUser.findByName", query = "SELECT e FROM EmarketUser e WHERE e.name = :name"),
    @NamedQuery(name = "EmarketUser.findByGender", query = "SELECT e FROM EmarketUser e WHERE e.gender = :gender"),
    @NamedQuery(name = "EmarketUser.findByBalance", query = "SELECT e FROM EmarketUser e WHERE e.balance = :balance"),
    @NamedQuery(name = "EmarketUser.findByEmail", query = "SELECT e FROM EmarketUser e WHERE e.emarketUserPK.email = :email")})
public class EmarketUser implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected EmarketUserPK emarketUserPK;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "user_password")
    private String userPassword;
    @Basic(optional = false)
    @NotNull
    @Column(name = "user_role")
    private int userRole;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "name")
    private String name;
    @Basic(optional = false)
    @NotNull
    @Column(name = "gender")
    private int gender;
    @Basic(optional = false)
    @NotNull
    @Column(name = "balance")
    private int balance;

    public EmarketUser() {
    }

    public EmarketUser(EmarketUserPK emarketUserPK) {
        this.emarketUserPK = emarketUserPK;
    }

    public EmarketUser(EmarketUserPK emarketUserPK, String userPassword, int userRole, String name, int gender, int balance) {
        this.emarketUserPK = emarketUserPK;
        this.userPassword = userPassword;
        this.userRole = userRole;
        this.name = name;
        this.gender = gender;
        this.balance = balance;
    }

    public EmarketUser(String id, String email) {
        this.emarketUserPK = new EmarketUserPK(id, email);
    }

    public EmarketUserPK getEmarketUserPK() {
        return emarketUserPK;
    }

    public void setEmarketUserPK(EmarketUserPK emarketUserPK) {
        this.emarketUserPK = emarketUserPK;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public int getUserRole() {
        return userRole;
    }

    public void setUserRole(int userRole) {
        this.userRole = userRole;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public int getBalance() {
        return balance;
    }

    public void setBalance(int balance) {
        this.balance = balance;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (emarketUserPK != null ? emarketUserPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EmarketUser)) {
            return false;
        }
        EmarketUser other = (EmarketUser) object;
        if ((this.emarketUserPK == null && other.emarketUserPK != null) || (this.emarketUserPK != null && !this.emarketUserPK.equals(other.emarketUserPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.EmarketUser[ emarketUserPK=" + emarketUserPK + " ]";
    }

    public static String getPassword(String email, DataSource ds) {
        if (isExistEmail(email, ds)) {
            String query = "SELECT user_password FROM emarket_user"
                    + " WHERE email='" + email + "'";
            Connection conn = null;
            String result = null;
            try {
                conn = ds.getConnection();
                Statement statement = conn.createStatement();
                ResultSet rs = statement.executeQuery(query);
                if (rs.next()) {
                    result = rs.getString("user_password");
                } else {
                    return "";
                }
            } catch (SQLException s) {
                System.err.println(s);
            } finally {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EmarketUser.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            return result;
        }
        return null;
    }

    public static String getUserName(String email) {
        String query = "SELECT name FROM emarket_user"
                + " WHERE email='" + email + "'";
        Connection conn = null;
        String UserNameByEmail = null;
        try {
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:comp/env");
            DataSource ds = (DataSource) envContext.lookup("jdbc/eMarket");
            try {
                conn = ds.getConnection();
                Statement statement = conn.createStatement();
                ResultSet rs = statement.executeQuery(query);
                if (rs.next()) {
                    UserNameByEmail = rs.getString("name");
                }
            } catch (SQLException s) {
                System.err.println(s);
            } finally {
                conn.close();
            }
        } catch (NamingException n) {
            System.err.print(n);
        } catch (SQLException s) {
            System.err.println(s);
        }
        return UserNameByEmail;
    }

    public static boolean isExistEmail(String email, DataSource ds) {
        String query = "SELECT email FROM emarket_user";
        Connection conn = null;
        ResultSet rs = null;
        try {
            conn = ds.getConnection();
            Statement statement = conn.createStatement();
            rs = statement.executeQuery(query);
            while (rs.next()) {
                if (rs.getString("email").equals(email)) {
                    return true;
                }
            }
            conn.close();
            rs.close();
        } catch (SQLException s) {
            System.err.print(s);
        }
        return false;
    }

    public static boolean isExistUserId(String user_id, DataSource ds) {
        String query = "SELECT username FROM emarket_user";
        Connection conn = null;
        ResultSet rs = null;
        try {
            conn = ds.getConnection();
            Statement statement = conn.createStatement();
            rs = statement.executeQuery(query);
            while (rs.next()) {
                if (rs.getString("id").equals(user_id)) {
                    return true;
                }
            }
            conn.close();
            rs.close();
        } catch (SQLException s) {
            System.err.print(s);
        }
        return false;
    }

    public static int registerNormalUser(String name, String user_id, String password, String gender, String email) {
        /* 
        -- return 1 if success   ------
        -- return 0 if duplicate ------
        -- return -1 if error    ------
         */

        String query = "INSERT INTO emarket_user (id, user_password, "
                + "user_role, name, gender, balance, email) VALUES (?, ?, ?, N'" + name + "', ?, ?, ?)";
        Connection conn = null;
        try {
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:comp/env");
            DataSource ds = (DataSource) envContext.lookup("jdbc/eMarket");
            if (!(isExistUserId(user_id, ds) && isExistEmail(email, ds))) {
                try {
                    conn = ds.getConnection();
                    PreparedStatement preparedStatement = conn.prepareStatement(query);
                    preparedStatement.setString(1, user_id);
                    preparedStatement.setString(2, password);
                    preparedStatement.setInt(3, 0);
                    if (gender.equals("male")) {
                        preparedStatement.setInt(4, 1);
                    } else {
                        preparedStatement.setInt(4, 0);
                    }
                    preparedStatement.setInt(5, 0);
                    preparedStatement.setString(6, email);
                    preparedStatement.execute();
                } catch (SQLException s) {
                    System.err.println(s);
                    return -1;
                } finally {
                    conn.close();
                }
            } else {
                return 0;
            }
        } catch (NamingException n) {
            System.err.print(n);
            return -1;
        } catch (SQLException s) {
            System.err.println(s);
            return -1;
        }
        return 1;
    }

}
