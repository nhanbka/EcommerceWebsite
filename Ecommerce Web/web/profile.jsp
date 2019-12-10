<script type="text/javascript">
    $(document).ready(function () {
        $('<link>').appendTo('head').attr({
                    type: 'text/css',
                    rel: 'stylesheet',
                    href: './css/profile-style.css'
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
                Welcome, <a href="profile?id=${session.getAttribute("id")}"><%= session.getAttribute("name") %></a>
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
    </div>
</div>