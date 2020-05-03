<%-- 
    Document   : userLlist
    Created on : May 2, 2020, 9:23:39 PM
    Author     : TiTi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User list Page</title>
        <style>
            th, td {
                padding-left: 5px;
                padding-right: 5px;
            }
            input {
                text-align: center;
                width: auto;
            }
        </style>
    </head>
    <body>
        <c:if test="${not empty USER}">
            <h3 style="color: orangered">Welcome, ${USER.username}!
                <span style="color: turquoise"><em>Group: ${USER.groupId.name}</em></span>
            </h3>
            <a href="LogoutServlet">Logout</a>
        </c:if>
        <h1>User List</h1>

        <c:if test="${USER.groupId.name eq 'Admin'}">
            <form action="UserListServlet">
                <input type="text" name="searchName" value="${param.searchName}" />
                <input type="submit" value="Search Name" />
            </form>
            <br/>
            <a href="newUser.jsp">Create new user</a>
            <br/>
            <br/>
        </c:if>

        <c:set var="groups" value="${GROUP_LIST}"/>
        <c:set var="users" value="${USER_LIST}"/>

        <c:if test="${empty users}">
            <h3>User list is empty!</h3>
        </c:if>
        <c:if test="${not empty users}">
            <button onclick="showTab('tab-all')">All (${users.size()})</button>
            <c:forEach var="group" items="${groups}" varStatus="counter">
                <button onclick="showTab('tab-${group.id}')">${group.name} (${group.tblUserCollection.size()})</button>
            </c:forEach>
            <br/>
            <br/>
            <div id="tab-all" class="tab">
                <table border="1">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Photo</th>
                            <th>Name</th>
                            <th>Username</th>
                            <th>Password</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Photo Url</th>
                            <th>Role</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${users}" varStatus="counter">
                        <form action="UpdateUserServlet" method="POST"> 
                            <tr>
                                <td>${counter.count}</td>
                                <td><img src="${user.photo}" height="50px"/></td>
                                <td>${user.name}</td>
                                <td>
                                    <input type="text" name="username" value="${user.username}" required/>
                                </td> 
                                <td>
                                    <input type="text" name="password" value="" placeholder="Enter new password..."/>
                                </td>
                                <td>
                                    <input type="email" name="email" value="${user.email}" />
                                </td>
                                <td>
                                    <input type="text" name="phone" value="${user.phone}" />
                                </td>
                                <td>
                                    <input type="text" name="photo" value="${user.photo}" />
                                </td>
                                <td>
                                    <select name="groupId">
                                        <c:forEach var="singleGroup" items="${ALL_GROUPS}">
                                            <option value="${singleGroup.id}" ${user.groupId.id eq singleGroup.id ? 'selected' : ''}>
                                                ${singleGroup.name}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td>
                                    <input type="submit" value="Update" name="btAction" />
                                    <br/>
                                    <input type="submit" value="Delete" name="btAction" style="margin-top: 5px; color: orangered"/>

                                    <input type="hidden" name="searchName" value="${param.searchName}" />
                                </td>
                            </tr>
                        </form>
                    </c:forEach>
                    </tbody>
                </table>

            </div>
        </c:if>

        <c:if test="${not empty groups}">
            <c:forEach var="group" items="${groups}" varStatus="counter">
                <div id="tab-${group.id}" class="tab" style="display: none">
                    <table border="1">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Photo</th>
                                <th>Username</th>
                                <th>Password</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Photo Url</th>
                                <th>Role</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${group.tblUserCollection}" varStatus="counter">
                                <tr>
                                    <td>${counter.count}</td>
                                    <td><img src="${user.photo}" height="50px"/></td>
                                    <td>${user.username}</td>
                                    <td>${user.password}</td>
                                    <td>${user.email}</td>
                                    <td>${user.phone}</td>
                                    <td>${user.photo}</td>
                                    <td>${user.groupId.name}</td>
                                    <td><button>Update</button></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                </div>
            </c:forEach>
        </c:if>


        <script>
            function showTab(tabId) {
                let tabs = document.getElementsByClassName('tab');
                for (let tab of tabs) {
                    tab.style.display = 'none';
                }

                let displayTab = document.querySelector('#' + tabId);
                displayTab.style.display = 'block';
            }
        </script>
    </body>
</html>
