<%@page import="entity.Category" %>
<%@page import="java.util.List" %>
<%@page import="entity.Product" %>
<script type="text/javascript">
    $(document).ready(function () {
        $('a[href="index.jsp"]').addClass("active");
        $('<link>').appendTo('head').attr({
            type: 'text/css',
            rel: 'stylesheet',
            href: './css/category-page-style.css'
        });
    });
</script>

<%
    session.setAttribute("view", "/category");
%>

<div class="body_resize">
    <div class="body_resize_top" id="category_top">
        <div class="body_resize_bottom">

            <h2><a href="#">${selectedCategory.getName()}</a></h2>
                <c:forEach var="p" items="${categoryProducts}">
                <div class="blog">
                    <h2><a href="#">${p.getName()}</a></h2>
                    <img src="${initParam.imgProductPath}${p.getImage()}" alt="No image :(" width="274" height="170" />
                    <p><strong>${p.getDescription()} </strong><br /></p>
                    <p><a href="#"><strong>${p.getPrice()} </strong></a></p>
                    <p><a href="#">Buy Now</a></p>
                </div>
            </c:forEach>
            <div class="clr"></div>
        </div>
    </div>
</div>

