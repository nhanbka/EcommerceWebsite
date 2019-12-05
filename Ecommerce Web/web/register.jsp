<script type="text/javascript">
    $(document).ready(function () {
        $('<link>').appendTo('head').attr({
            type: 'text/css',
            rel: 'stylesheet',
            href: './css/register-style.css'
        });
    });
</script>

<div class="body">
    <div class="body_resize">
        <div class="body_resize_top">
            <div class="body_resize_bottom">
                <div class="main-content-agile">
                    <div class="sub-main-w3">	
                        <div class="wthree-pro">
                            <h2>Register</h2>
                        </div>
                        <form action="register" method="post">
                            <div class="alert-text">
                                <%  if (session.getAttribute("register") == null) {
                                    session.removeAttribute("register");
                                %>
                                <% } else if(session.getAttribute("register") == "1") {
                                    session.removeAttribute("register");
                                %>
                                    Your account has successfully registered  
                                <% } else if(session.getAttribute("register") == "0"){ 
                                    session.removeAttribute("register");
                                %>
                                    This id or email has already been registered.
                                <% } else { 
                                    session.removeAttribute("register");
                                %>
                                    Error, please try again.
                                <% }%>
                            </div>
                            <div class="pom-agile">
                                <div class="properties">User ID:</div>
                                <input placeholder="ID" name="user_id" class="user" type="text" required>
                                <span class="icon1"><i class="fa fa-user" aria-hidden="true"></i></span>
                            </div>
                            <div class="pom-agile">
                                <div class="properties">Email:</div>
                                <input placeholder="E-mail" name="email" class="user" type="email" required>
                                <span class="icon1"><i class="fa fa-user" aria-hidden="true"></i></span>
                            </div>

                            <div class="pom-agile">
                                <div class="properties">Gender:</div>
                                <select name="gender" class="user" style="width: 245px">
                                    <option value="male">Male</option>
                                    <option value="female">Female</option>
                                    <option value="unknown" selected>Unknown</option>
                                </select>
                                <span class="icon1"><i class="fa fa-user" aria-hidden="true"></i></span>
                            </div>
                            <div class="pom-agile">
                                <div class="properties">Name:</div>
                                <input placeholder="Name" name="name" class="user" type="text" required>
                                <span class="icon1"><i class="fa fa-user" aria-hidden="true"></i></span>
                            </div>
                            <div class="pom-agile">
                                <div class="properties">Password:</div>
                                <input  placeholder="Password" name="password" class="pass" type="password" required>
                                <span class="icon2"><i class="fa fa-unlock" aria-hidden="true"></i></span>
                            </div>
                            <input type="submit" value="Register"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>