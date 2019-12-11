<%@page import="java.util.Iterator"%>
<%@page import="entity.Product"%>
<script type="text/javascript">
    $(document).ready(function () {
        $('a[href="index.jsp"]').addClass("active");
        $('<link>').appendTo('head').attr({
            type: 'text/css',
            rel: 'stylesheet',
            href: './css/index-style.css'
        });
    });
</script>
<div class="body">
    <div class="search_bg">
        <% if (session.getAttribute("name") == null) { %>
        <div class="login">
            <a href="register.jsp"><div class="login_element">Register</div></a>
            <a href="login.jsp"><div class="login_element">Login</div></a>
        </div>
        <% } else {%>
        <div class="login_done">
            <div class="welcome_element">
                Welcome, <a href="profile?id=${session.getAttribute("id")}"><%= session.getAttribute("name")%></a>
            </div>
            <a href="logout"><div class="login_element">Logout</div></a>
        </div>
        <% }%>
        <div class="search">
            <form id="form1" name="form1" method="post" action="#">
                <span>
                    <input name="q" type="text" class="keywords" id="textfield" maxlength="50" placeholder="Search..." />
                </span>
                <input name="b" type="image" src="images/search.png" class="button" />
            </form>
        </div>
        <div class="clr"></div>
    </div>
    <div class="body_resize">
        <div class="body_resize_top">
            <div class="body_resize_bottom">
                <% float x = 0; %>
                <c:if test="${case == 1}" >
                <c:forEach var="product" items="${newsProduct}">
                    <div class="blog">
                        <h2><a href="#">${product.getName()}</a></h2>
                        <img src="${initParam.imgProductPath}${product.getImage()}" alt="No image :(" width="274" height="170" />
                        <p><a href="#"><strong>${product.getPrice()} </strong></a></p>
                        <!--Handle Buy Product-->
                    </div>
                </c:forEach>
                </c:if>
                <c:if test="${case == 2}" >
                    <div class="blog">
                        <h2><a href="#">${product.getName()}</a></h2>
                        <img src="${initParam.imgProductPath}${product.getImage()}" alt="No image :(" width="274" height="170" />
                        <p><a href="#"><strong>${product.getPrice()} </strong></a></p>
                        <!--Handle Buy Product-->
                    </div>
                </c:if>
                <div class="clr"></div>
                <hr>
                <h2>Subtotal: ${subTotal}</h2>
                <form action="done.jsp">
                    <input type="submit" value="Proceed">
                </form>
            </div>
        </div>
    </div>
</div>
