<script type="text/javascript">
    $(document).ready(function () {
        $('a[href="contact.jsp"]').addClass("active");
    });
</script>
<div class="header_blog">
    <div class="header_blog_resize">
        <h2>Contact</h2>
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
        <div class="clr"></div>
    </div>
        
    <div class="body_resize">
        <div class="body_resize_top">
            <div class="body_resize_bottom">
                <div class="left">
                    <h2>Contact us via this form</h2>
                    <p>&nbsp;</p>
                    <form action="#" method="post" id="contactform">
                        <ol>
                            <li>
                                <label for="name">First Name <span class="red">*</span></label>
                                <input id="name" name="name" class="text" />
                            </li>
                            <li>
                                <label for="email">Your email <span class="red">*</span></label>
                                <input id="email" name="email" class="text" />
                            </li>
                            <li>
                                <label for="company">Company</label>
                                <input id="company" name="company" class="text" />
                            </li>
                            <li>
                                <label for="subject">Subject</label>
                                <input id="subject" name="subject" class="text" />
                            </li>
                            <li>
                                <label for="message">Message <span class="red">*</span></label>
                                <textarea id="message" name="message" rows="6" cols="50" style="resize:none"></textarea>
                            </li>
                            <li class="buttons">
                                <input type="image" name="imageField" id="imageField" src="images/send.gif" class="send" />
                                <div class="clr"></div>
                            </li>
                        </ol>
                    </form>
                </div>
                <div class="right">
                    <h2>Contact Details</h2>
                    <p>Need help? We will be happy to hear from you. <br />
                        For contacting us please use our contact page or the email and phone info below.</p>
                    <p><strong>Office email</strong> : nhan.lt173292@sis.hust.edu.vn<br />
                        <strong>Email</strong> : email@yourdomain.com</p>
                </div>
                <div class="clr"></div>
            </div>
        </div>
    </div>
</div>
<div class="clr"></div>