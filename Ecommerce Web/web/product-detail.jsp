<script type="text/javascript">
    $(document).ready(function () {
        $('a[href="index.jsp"]').addClass("active");
        $('<link>').appendTo('head').attr({
            type: 'text/css',
            rel: 'stylesheet',
            href: './css/product-detail.css'
        });
        $('<link>').appendTo('head').attr({
            type: 'text/css',
            rel: 'stylesheet',
            href: './css/index-style.css'
        });
    });
</script>
<div class="header_blog">
    <div id="slider">
        <div class="text_item" style="width:450px;float:left;">
            <h2>${product.name}</h2>
            <p>${product.description}</p>
            <% if (session.getAttribute("name") != null) { %>
            <div class="button"><a href="BuyProduct?productID=${product.getProductId()}">Buy Now</a></div>
            <div class="button"><a href="BuyProduct?addToCart=true&&productID=${product.getProductId()}">Add To Cart</a></div>
            <% }%>
        </div>
        <!-- start slideshow -->
        <div id="slideshow" style="width: 450px; float:right;">
            <div class="slider-item">
                <a href="#"><img src="${initParam.imgProductDetailPath}${productDetail.getImage1()}" alt="" width="511" height="323" border="0" /></a>
            </div>
            <div class="slider-item">
                <a href="#"><img src="${initParam.imgProductDetailPath}${productDetail.getImage2()}" alt="" width="390" height="370" border="0" /></a>
            </div>
            <div class="slider-item">
                <a href="#"><img src="${initParam.imgProductDetailPath}${productDetail.getImage3()}" alt="" width="460" height="323" border="0" /></a>
            </div>
        </div>
        <!-- end #slideshow -->
        <div class="clr"></div>
    </div>
    <div class="clr"></div>
</div>
<div class="clr"></div>
<div class="body">
    <div class="search_bg">
        <% if (session.getAttribute("name") != null) { %>
        <div class="login_done">
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
                <h2>DESCIPTION</h2>
                <p>${product.descriptionDetail}</p>
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
