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
                            <s:if test="#session.USER != null && #session.USER.isAdmin">
                            <th>Image Url</th>
                            </s:if>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Created Date</th>
                            <s:if test="#session.USER != null && #session.USER.isAdmin">
                            <th>Quantity</th>
                            </s:if>
                        <th>Category</th>
                            <s:if test="#session.USER != null && #session.USER.isAdmin">
                            <th>Status</th>
                            </s:if>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <s:iterator value="products" status="counter">
                        <s:form action="updateProduct" method="POST" theme="simple">
                            <tr>
                                <!-- No. -->
                                <td style="text-align: center">
                                    <s:property value="#counter.count + (pageNumber - 1) * pageSize"/>
                                </td>

                                <!--Name-->
                                <td style="width: 200px">
                                    <s:if test="#session.USER != null && #session.USER.isAdmin">
                                        <s:textfield name="name"/>
                                    </s:if>
                                    <s:else>
                                        <s:property value="name"/>
                                    </s:else>
                                </td>

                                <!--Image-->
                                <td>
                                    <img src="${image}" height="90px"/>
                                </td>

                                <!--Image Url - Admin only-->
                                <s:if test="#session.USER != null && #session.USER.isAdmin">
                                    <td>
                                        <s:textfield name="imageUrl" value="%{image}"/>
                                    </td>
                                </s:if>

                                <!--Description-->
                                <td style="width: 450px">
                                    <s:if test="#session.USER != null && #session.USER.isAdmin">
                                        <s:textarea name="description" rows="5" cssStyle="width: 100%"/>
                                    </s:if>
                                    <s:else>
                                        <s:property value="description"/>
                                    </s:else>
                                </td>

                                <!--Price-->
                                <td style="text-align: right">

                                    <s:if test="#session.USER != null && #session.USER.isAdmin">
                                        <s:textfield name="price" type="number" min="0" cssStyle="width: 100px; text-align: right; display: inline"/> vnd
                                    </s:if>
                                    <s:else>
                                        <s:number name="price" currency="vnd"/> vnd
                                    </s:else>
                                </td>

                                <!--Created date-->
                                <td style="text-align: center">
                                    <s:date name="createdDate" format="dd/MM/yyyy"/>
                                </td>
                                
                                <!--Quantity-->
                                <s:if test="#session.USER != null && #session.USER.isAdmin">
                                    <td>
                                        <s:textfield name="quantity" type="number" min="0" cssStyle="width: 70px; text-align: right; display: inline"/>
                                    </td>
                                </s:if>

                                <!--Category-->
                                <td>
                                    <s:if test="#session.USER != null && #session.USER.isAdmin">
                                        <s:if test="#session.CATEGORIES != null">
                                            <s:select 
                                                list="#session.CATEGORIES" 
                                                name="categoryId" 
                                                listKey="id"
                                                listValue="name"
                                                value="categoryId.id"
                                                theme="simple" />
                                        </s:if>
                                    </s:if>
                                    <s:else>
                                        <s:property value="categoryId.name"/>
                                    </s:else>
                                </td>

                                <!--Status - Admin only-->
                                <s:if test="#session.USER != null && #session.USER.isAdmin">
                                    <td>
                                        <s:if test="#session.STATUSES != null">
                                            <s:select 
                                                list="#session.STATUSES"
                                                name="status"
                                                theme="simple"/>
                                        </s:if>
                                    </td>
                                </s:if>

                                <!--Action-->
                                <td style="text-align: center">
                                    <button>Add to cart</button>
                                    <s:if test="#session.USER != null && #session.USER.isAdmin">
                                        <br/>
                                        <s:submit 
                                            name="btAction" 
                                            value="Update"
                                            cssStyle="margin-top: 5px; color: steelblue"/>
                                        <s:hidden name="productId" value="%{id}"/>
                                        <br/>
                                        <s:submit 
                                            name="btAction" 
                                            value="Delete"
                                            cssStyle="margin-top: 5px; color: salmon"
                                            onclick="return confirmIfDelete('%{name}')"/>
                                    </s:if>
                                </td>
                            </tr>
                        </s:form>
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

        <script>
            function confirmIfDelete(productName) {
                return confirm('You you want to delete ' + productName + '?');
            }
        </script>
    </body>
</html>
