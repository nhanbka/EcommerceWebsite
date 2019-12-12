<%-- 
    Document   : manage_category
    Created on : 03-Mar-2017, 09:56:25
    Author     : NguyenDang
--%>


<%@page import="entity.EmarketUser"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>USER MANAGEMENT</title>
        <link href="${root}css/mos-style.css" rel='stylesheet' type='text/css' />

    </head>
    <body>
        <%

            EmarketUser emarketUser = new EmarketUser();

        %>

        <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>

                <div id="rightContent">

                    <h3>Hãy chỉnh sửa dữ liệu cẩn thận nhé ^^</h3>

                    <table class="data">
                        <tr class="data">

                            <th class="data">UserID</th>
                            <th class="data">UserName</th>
                            <th class="data">Email</th>
                            <th class="data">UserRole</th>

                        </tr>

                        <tr class="data">

                        <td class="data"><%=emarketUser.getId()%></td>
                        <td class="data"><%=emarketUser.getName()%></td>
                        <td class="data"><%=emarketUser.getEmail()%></td> 
                        <td class="data"><%=emarketUser.getUserRole()%></td>


                    </tr>
                </table>
            </div>
            <div class="clear"></div>

        </div>

    </body>
</html>
