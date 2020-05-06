<%-- 
    Document   : viewCart
    Created on : May 6, 2020, 1:02:19 PM
    Author     : TiTi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart Page</title>
    </head>
    <body>
        <s:if test="#session.USER != null">
            <h3 style="color: orangered">Welcome, <s:property value="#session.USER.fullname"/>!</h3>
            <s:a href="logout">Logout</s:a>
        </s:if>
        <s:else>
            <s:a href="login.jsp" >Login</s:a>
        </s:else>

        <h1>View Cart</h1>

        <s:if test="#session.CART == null || #session.CART.isEmpty()">
            <h3>Your cart is empty.</h3>
        </s:if>
        <s:else>
            <s:set var="details" value="#session.CART.tblOrderDetailsCollection"/>
            <s:if test="#details == null || #details.isEmpty()">
                <h3>Your cart is empty.</h3>
            </s:if>  
            <s:else>
                <p>There are ${details.size()} items in your cart.</p>
            </s:else>
        </s:else>
    </body>
</html>
