<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import = "com.project.model.Menu, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Restaurant Menu</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <h1 class="title">Menu - Pizza Hut</h1>

  <div class="menu-container">
  
  	<%
    List<Menu> menuitems = (List<Menu>) request.getAttribute("menus");
    // out.println("Menu List: " + menuitems); // DEBUG LINE
    if (menuitems != null && !menuitems.isEmpty()) {
        for (Menu m : menuitems) {
%>
    <div class="menu-card">
        <img src="<%= m.getImagePath() %>" alt="Food Image" />
        <div class="menu-info">
            <h3><%= m.getName() %></h3>
            <p>₹<%= m.getPrice() %></p>

            <form action="cart" method="get">
                <input type="hidden" name="menuid" value="<%= m.getMenuId() %>">
                <input type="hidden" name="quantity" value="1">
                <input type="hidden" name="itemname" value="<%= m.getName() %>">
                <input type="hidden" name="price" value="<%= m.getPrice() %>">
                <input type="hidden" name="imagePath" value="<%= m.getImagePath() %>">
                <input type="hidden" name="action" value="add">
                <input type="submit" value="Add to Cart">
            </form>
        </div>
    </div>
<%
        }
    } else {
%>
    <p>No menu items found.</p>
<%
    }
%>

  </div>

</body>
</html>
