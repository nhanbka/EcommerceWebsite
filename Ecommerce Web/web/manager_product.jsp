

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />

    </head>
    <body>

        <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>

                <div id="rightContent">

                    <h3>PRODUCT MANAGEMENT</h3>
                    <div class="informasi">
                        Edit the data carefully!
                    </div>



                    <table class="data">
                        <tr class="data">

                            <th class="data">ProductID</th>
                            <th class="data">ProductName</th>
                            <th class="data">Price</th>
                            <th class="data">description</th>
                            <th class="data">image</th>
                            <th class="data">thumb_image</th>
                            <th class="data">last_update</th>
                            <th class="data">description_detail</th>

                        </tr>
                    <c:forEach var="product" items="${listProduct}">
                        <tr class="data">
                            <td class="data">${product.productId}</td>
                            <td class="data">${product.name}</td>
                            <td class="data">${product.price}</td>
                            <td class="data">${product.description}</td>
                            <td class="data">${product.image}</td>
                            <td class="data">${product.thumbImage}</td>
                            <td class="data">${product.lastUpdate}</td>
                            <td class="data">${product.descriptionDetail}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div class="clear"></div>


        </div>

    </body>
</html>
