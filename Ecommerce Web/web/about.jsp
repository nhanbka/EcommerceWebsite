<script type="text/javascript">
    $(document).ready(function () {
        $('a[href="about.jsp"]').addClass("active");
        $('<link>').appendTo('head').attr({
            type: 'text/css',
            rel: 'stylesheet',
            href: './css/index-style.css'
        });
    });
</script>
<div class="header_blog">
    <div class="header_blog_resize">
        <h2>About</h2>
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
                <div class="left">
                    <h2>Some information of team</h2>
                    <p>We have 4 people joining this project: <br></p>
                    <ol>
                        <li>Le Trong Nhan - 20173292</li>
                        <li>Nguyen Duy Hoai Lam - 20173225</li>
                        <li>Dang Hong Thai - 20173358</li>
                        <li>Nguyen Ngoc Duc - 20173025</li>
                    </ol>
                    <p>&nbsp;</p>

                </div>
                <div class="clr"></div>
            </div>
        </div>
    </div>
</div>
<div class="clr"></div>