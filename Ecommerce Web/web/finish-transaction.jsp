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
        <div class="login_done">
            <div class="welcome_element">
                Welcome, <a href="profile?id=${session.getAttribute("id")}"><%= session.getAttribute("name")%></a>
            </div>
            <a href="logout"><div class="login_element">Logout</div></a>
        </div>
        <div class="clr"></div>
    </div>
    <div class="body_resize">
        <div class="body_resize_top">
            <div class="body_resize_bottom">
                <div class="left">
                    <h2>THANK FOR YOUR TRANSACTION, YOUR ORDER IS NOW UNDER PROCESSING</h2>
                    <a href="index.jsp">Return Home</a>
                    <p>&nbsp;</p>
                </div>
                <div class="clr"></div>
            </div>
        </div>
    </div>
</div>
<div class="clr"></div>