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
                            <h2>Edit User Information</h2>
                        </div>
                        <form action="manager_user" method="post">
                            <div class="pom-agile">
                                <div class="properties">User ID:</div>
                                <input placeholder="ID" name="user_id" class="user" type="text" value="${user.emarketUserPK.id}" required>
                                <span class="icon1"><i class="fa fa-user" aria-hidden="true"></i></span>
                            </div>
                            <div class="pom-agile">
                                <div class="properties">Role:</div>
                                <input placeholder="Role" name="userRole" class="user" type="text" value="${user.userRole}" required>
                                <span class="icon1"><i class="fa fa-user" aria-hidden="true"></i></span>
                            </div>
                            <div class="pom-agile">
                                <div class="properties">Name:</div>
                                <input placeholder="Name" name="name" class="user" type="text" value="${user.name}" required>
                                <span class="icon1"><i class="fa fa-user" aria-hidden="true"></i></span>
                            </div>
                            <div class="pom-agile">
                                <div class="properties">Password:</div>
                                <input  placeholder="Password" name="password" class="pass" type="password" value='${user.userPassword}' required>
                                <span class="icon2"><i class="fa fa-unlock" aria-hidden="true"></i></span>
                            </div>
                            <input type="submit" value="Edit"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
