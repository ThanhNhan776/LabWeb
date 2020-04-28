<%-- 
    Document   : search
    Created on : Apr 29, 2020, 12:27:13 AM
    Author     : NhanTT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Hotel</title>
    </head>
    <body>
        <h1>Search Hotel</h1>

        <form action="ProcessServlet" method="POST">
            <label>Hotel name: </label>
            <input type="text" name="hotel-name" value="" placeholder="Hotel name..."/>
            <br/>
            
            <label>Hotel location: </label>
            <input type="text" name="hotel-location" value="" placeholder="Hotel location..."/>
            <br/>
            
            <jsp:useBean id="now" class="java.util.Date"/>
            <fmt:formatDate var="currentDate" value="${now}" pattern="yyyy-MM-dd"/>
            <label>Checkin date: </label>
            <input type="date" name="checkin-date" value="${currentDate}"/>
            <br/>
            
            <label>Checkout date: </label>
            <input type="date" name="checkout-date" value="${currentDate}" />
            <br/>
            
            <label>Amount: </label>
            <input type="number" min="0" name="amount" value="1" />
            <br/>
            
            <input type="submit" value="Search hotel" name="btAction" />
            <br/>
            
            <c:if test="${not empty requestScope.HOTELS}">
                <c:set var="hotels" value="${requestScope.HOTELS}"/>
                <table border="1">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Name</th>
                            <th>Location</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="hotel" items="${hotels}" varStatus="counter">
                            <tr>
                                <td>${counter.count}</td>
                                <td>${hotel.name}</td>
                                <td>${hotel.location}</td>
                                <td>
                                    <input type="button" value="View details" onclick="showHotelDetail('hotel-detail-${hotel.id}')"/>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                
                <c:forEach var="hotel" items="${hotels}">
                    <div id="hotel-detail-${hotel.id}" class="hotel-detail" style="display: none;"> 
                        <p>Hotel ${hotel.name}</p>
                        <c:forEach var="room" items="${hotel.tblRoomCollection}" varStatus="counter">
                            <p>Room ${room.id}, available ${room.amount} rooms, 
                                room type: ${room.typeId.name}, unit price ${room.typeId.price} vnd
                                <input type="submit" value="Book room" name="btAction" />
                            </p>
                        </c:forEach>
                    </div>
                </c:forEach>

            </c:if>
            <c:if test="${empty requestScope.HOTELS}">
                <h2>Sorry, there are no hotel available at the moment. Please come back later.</h2>
            </c:if>
        </form>
            
            <script>
                function showHotelDetail(id) {
                    let details = document.getElementsByClassName('hotel-detail');
                    for (detail of details) {
                        detail.style.display = 'none';
                    }
                    document.getElementById(id).style.display = 'block';
                }
            </script>
    </body>
</html>
