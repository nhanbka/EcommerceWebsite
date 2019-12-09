<script type="text/javascript">
    $(document).ready(function () {
        $('<link>').appendTo('head').attr({
                    type: 'text/css',
                    rel: 'stylesheet',
                    href: './css/login-style.css'
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
                            <h2>Login Quick</h2>
                        </div>
                        <form action="Login" method="post">
                            <div class="pom-agile">
                                <input placeholder="E-mail" name="email" class="user" type="email" required="">
                                <span class="icon1"><i class="fa fa-user" aria-hidden="true"></i></span>
                            </div>
                            <div class="pom-agile">
                                <input  placeholder="Password" name="password" class="pass" type="password" required="">
                                <span class="icon2"><i class="fa fa-unlock" aria-hidden="true"></i></span>
                            </div>
                            <div class="sub-w3l">
                                <h6><a href="#">Forgot Password?</a></h6>
                                <div class="right-w3l">
                                    <input type="submit" value="Login">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>