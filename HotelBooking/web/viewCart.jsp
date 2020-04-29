<%-- 
    Document   : book-room
    Created on : Apr 29, 2020, 7:30:30 PM
    Author     : NhanTT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart Page</title>
    </head>
    <body>
        <h1>Your Cart</h1>

        <c:set var="cart" value="${CART}"/>

        <c:if test="${empty cart}">
            <h2>You have no items in the cart. Please add some.</h2>
        </c:if>

        <c:if test="${not empty cart}">
            <c:set var="details" value="${cart.tblBookingDetailsCollection}" />
            <p>There are ${details.size()} items in your cart.</p>

            <table border="1">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Hotel</th>
                        <th>Room type</th>
                        <th>Amount</th>
                        <th>Unit price</th>
                        <th>Total</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>

                    <c:forEach var="detail" items="${details}" varStatus="counter">
                        <tr>
                            <td>${counter.count}</td>
                            <td>${detail.roomId.hotelId.name}</td>
                            <td>${detail.roomId.typeId.name}</td>
                            <td>${detail.amount}</td>
                            <td>${detail.unitPrice}</td>
                            <td>${detail.amount * detail.unitPrice}</td>
                            <td><input type="submit" value="Update"/></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

        </c:if>

        <form action="ProcessServlet">
            <br/>
            <input type="submit" value="Home" name="btAction" />
        </form>
    </body>
</html>
