<script type="text/javascript">
    $(document).ready(function () {
        $('<link>').appendTo('head').attr({
            type: 'text/css',
            rel: 'stylesheet',
            href: '${pageContext.request.contextPath}/css/mos-style.css'
        });
    });
</script>

<%@page import="java.util.ArrayList"%>
<%@page import="entity.EmarketUser"%>


<div id="wrapper">

    <div id="rightContent">

        <div class="informasi">
            Edit the data carefully!
        </div>

        <table class="data">
            <tr class="data">
               
                <th class="data">userID</th>
                <th class="data">userName</th>
                <th class="data">Email</th>
                <th class="data">Role</th>
                <th class="data"></th>

            </tr>
            <c:forEach var="user" items="${listUser}">
                <tr class="data">
                    <td class="data">${user.emarketUserPK.id}</td>
                    <td class="data">${user.name}</td>
                    <td class="data">${user.emarketUserPK.email}</td>
                    <td class="data">${user.userRole}</td>
                    <td class="data"><a href="manager_user?Edit=${user.emarketUserPK.id}"> Edit</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="clear"></div>

</div>
