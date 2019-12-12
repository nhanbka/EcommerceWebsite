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
<div class="header_blog">
    <div id="slider">
        <!-- start slideshow -->
        <div id="slideshow">
            <div class="slider-item">
                <div class="text_item">
                    <h2>Lightness strikes again..</h2>
                    <p>The most loved Mac is about to make you fall in love all over again. </p>
                    <a href="#"><img src="images/more_information.gif" alt="" width="141" height="33" border="0" /></a></div>
                <a href="#"><img src="images/MacbookAir2019.png" alt="" width="511" height="323" border="0" /></a></div>
            <div class="slider-item">
                <div class="text_item">
                    <h2>Power to the pro.. </h2>
                    <p>Pros love iMac. So we created one just for you. </p>
                    <a href="#"><img src="images/more_information.gif" alt="" width="141" height="33" border="0" /></a></div>
                <a href="#"><img src="images/iMacPro.png" alt="" width="390" height="370" border="0" /></a></div>
            <div class="slider-item">
                <div class="text_item">
                    <h2>More power.<br />
                        More performance.<br />
                        More pro.</h2>
                    <p>MacBook Pro elevates the notebook to a whole new level of performance and portability. </p>
                    <a href="#"><img src="images/more_information.gif" alt="" width="141" height="33" border="0" /></a></div>
                <a href="#"><img src="images/MacbookPro2019.png" alt="" width="460" height="323" border="0" /></a></div>
        </div>
        <!-- end #slideshow -->
        <div class="controls-center">
            <div id="slider_controls">
                <h2>Very pleased to welcome you</h2>
                <ul id="slider_nav">
                    <li><a href="#"></a></li>
                    <!-- Slide 1 -->
                    <li><a href="#"></a></li>
                    <!-- Slide 2 -->
                    <li><a href="#"></a></li>
                    <!-- Slide 3 -->
                </ul>
            </div>
        </div>
        <div class="clr"></div>
    </div>
    <div class="clr"></div>
</div>
<div class="clr"></div>
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
            <% if (session.getAttribute("admin") != null) { %>
            <a href="admin.jsp"><div class="login_element">ADMIN</div></a>
            <% } %>
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
                <c:forEach var="product" items="${newProducts}">
                    <div class="blog">
                        <h2><a href="ViewProduct?productID=${product.getProductId()}">${product.getName()}</a></h2>
                        <a href="ViewProduct?productID=${product.getProductId()}">
                            <img src="${initParam.imgProductPath}${product.getImage()}" 
                                 alt="No image :(" width="274" height="170" />
                        </a>
                        <p><strong>${product.getDescription()} </strong><br /></p>
                        <p><a href="ViewProduct?productID=${product.getProductId()}"><strong>${product.getPrice()} </strong></a></p>
                        <!--Handle Buy Product-->
                        <% if (session.getAttribute("name") != null) { %>
                        <p><a href="BuyProduct?productID=${product.getProductId()}">Buy Now</a></p>
                        <p><a href="BuyProduct?addToCart=true&&productID=${product.getProductId()}">Add To Cart</a></p>
                        <% }%>
                    </div>
                </c:forEach>
                <div class="clr"></div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('#slideshow').cycle({
            fx: 'fade',
            speed: 'slow',
            timeout: 5000,
            pager: '#slider_nav',
            pagerAnchorBuilder: function (idx, slide) {
                // return sel string for existing anchor
                return '#slider_nav li:eq(' + (idx) + ') a';
            }
        });
    });
</script>