<%-- 
    Document   : searchProduct
    Created on : May 4, 2020, 11:44:28 PM
    Author     : TiTi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Product Page</title>
        <style>
            th, td {
                padding: 0 5px;
            }
        </style>
    </head>
    <body>
        <s:if test="#session.USER != null">
            <h3 style="color: orangered">Welcome, <s:property value="#session.USER.fullname"/>!</h3>
            <s:a href="logout">Logout</s:a>
        </s:if>
        <s:else>
            <s:a href="login.jsp" >Login</s:a>
        </s:else>

        <h1>Search Product</h1>

        <s:form action="searchProduct">
            <s:textfield name="productName" label="Product name" cssStyle="text-align: center"/>
            <s:textfield name="categoryName" label="Category name" cssStyle="text-align: center"/>
            <s:textfield name="minPrice" label="Min price (vnd)" cssStyle="text-align: right" type="number" min="0"/>
            <s:textfield name="maxPrice" label="Max price (vnd)" cssStyle="text-align: right" type="number" min="0"/>
            <s:submit value="Search"/>
        </s:form>

        <s:if test="products != null && !products.isEmpty()">
            <h4><em>Found ${productsCount} products</em></h4>
            <table border="1">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Name</th>
                        <th>Image</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Created Date</th>
                        <th>Category</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <s:iterator value="products" status="counter">
                        <tr>
                            <td style="text-align: center">
                                <s:property value="#counter.count + (pageNumber - 1) * pageSize"/>
                            </td>
                            <td>
                                <s:property value="name"/>
                            </td>
                            <td>
                                <img src="${image}" height="90px"/>
                            </td>
                            <td style="width: 500px">
                                <s:property value="description"/>
                            </td>
                            <td style="text-align: right">
                                <s:number name="price" currency="vnd"/> vnd
                            </td>
                            <td style="text-align: center">
                                <s:date name="createdDate" format="dd/MM/yyyy"/>
                            </td>
                            <td>
                                <s:property value="categoryId.name"/>
                            </td>
                            <td>
                                <button>Add to cart</button>
                            </td>
                        </tr>
                    </s:iterator>
                </tbody>
            </table>

            <!-- pagination -->
            <div id="pagination">
                <br/>
                Page: 
                <s:iterator begin="0" end="productsCount" step="20" status="counter">
                    <s:url var="url" action="searchProduct">
                        <s:param name="pageNumber" value="%{#counter.count}"/>
                        <s:param name="productName" value="%{productName}"/>
                        <s:param name="categoryName" value="%{categoryName}"/>
                        <s:param name="minPrice" value="%{minPrice}"/>
                        <s:param name="maxPrice" value="%{maxPrice}"/>
                    </s:url>
                    <s:a href="%{#url}" cssStyle="margin-right: 10px">${counter.count}</s:a>
                </s:iterator>
            </div>
        </s:if>
        <s:else>
            <h3><em>No products found!</em></h3>
        </s:else>

    </body>
</html>
