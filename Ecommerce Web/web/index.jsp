<script type="text/javascript">
    $(document).ready(function() {
        $('a[href="index.jsp"]').addClass("active");
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
                        <h2><a href="#">${product.getName()}</a></h2>
                        <img src="${initParam.imgProductPath}${product.getImage()}" alt="No image :(" width="274" height="170" />
                        <p><strong>${product.getDescription()} </strong><br /></p>
                        <p><a href="#"><strong>${product.getPrice()} </strong></a></p>
                        <p><a href="#">Buy Now</a></p>
                    </div>
                </c:forEach>

                <div class="clr"></div>
            </div>
        </div>
    </div>
</div>
<div class="clr"></div>