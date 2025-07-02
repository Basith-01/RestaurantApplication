<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.project.model.Menu" %>

<%
    Map<Menu, Integer> cart = (Map<Menu, Integer>) session.getAttribute("cartItems");
    if (cart == null) {
        cart = new LinkedHashMap<>();
        session.setAttribute("cartItems", cart);
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Cart</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #fafafa;
        }
        .cart-container {
            width: 90%;
            max-width: 800px;
            margin: auto;
        }
        .cart-item {
            display: flex;
            align-items: center;
            background: #fff;
            padding: 15px;
            border-radius: 12px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            margin-bottom: 15px;
        }
        .cart-item img {
            width: 100px;
            height: 80px;
            object-fit: cover;
            border-radius: 10px;
            margin-right: 20px;
        }
        .item-details {
            flex: 1;
        }
        .item-name {
            font-size: 18px;
            font-weight: bold;
        }
        .item-price {
            color: green;
            font-size: 16px;
            margin-top: 5px;
        }
        .quantity-controls {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-top: 10px;
        }
        .quantity-controls button {
            padding: 5px 12px;
            font-size: 18px;
            background: #ff6347;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }
        .quantity-controls span {
            font-size: 16px;
            width: 20px;
            text-align: center;
            display: inline-block;
        }
        .total {
            font-size: 20px;
            font-weight: bold;
            text-align: right;
            margin-top: 30px;
        }
        
        .action-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }
        .btn {
            padding: 12px 24px;
            font-size: 16px;
            text-decoration: none;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }
        .btn-add {
            background-color: #007bff;
            color: white;
        }
        .btn-checkout {
            background-color: #28a745;
            color: white;
        }
        .btn:hover {
            opacity: 0.9;
        }
    </style>
</head>
<body>
    <div class="cart-container">
        <h2>Your Cart</h2>

        <%
            if (cart.isEmpty()) {
        %>
            <p>No items in cart.</p>
        <%
            } else {
                double total = 0;
                for (Map.Entry<Menu, Integer> entry : cart.entrySet()) {
                    Menu item = entry.getKey();
                    int quantity = entry.getValue();
                    total += item.getPrice() * quantity;
        %>
        <div class="cart-item">
            <img src="<%= item.getImagePath() %>" alt="<%= item.getName() %>">
            <div class="item-details">
                <div class="item-name"><%= item.getName() %></div>
                <div class="item-price">₹<%= item.getPrice() %></div>
                <form action="cart" method="get" class="quantity-controls">
                    <input type="hidden" name="menuid" value="<%= item.getMenuId() %>">
                    <input type="hidden" name="action" value="update">
                    <button name="quantity" value="decrease">-</button>
                    <span><%= quantity %></span>
                    <button name="quantity" value="increase">+</button>
                </form>
            </div>
        </div>
        <% } %>
        <div class="total">Total: ₹<%= total %></div>

        <div class="action-buttons">
            <a href="menu" class="btn btn-add">← Add More Items</a>
            <a href="CheckOut.jsp" class="btn btn-checkout">Proceed to Checkout →</a>
        </div>
        <% } %>
        
        
        
        
        
        
        
        
    </div>
</body>
</html>
