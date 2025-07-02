<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.project.model.Menu" %>

<%
    Map<Menu, Integer> cart = (Map<Menu, Integer>) session.getAttribute("cartItems");
    if (cart == null || cart.isEmpty()) {
        response.sendRedirect("cart.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Checkout</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
        }
        .checkout-container {
            width: 90%;
            max-width: 800px;
            margin: auto;
            background: #fff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .checkout-item {
            display: flex;
            justify-content: space-between;
            padding: 12px 0;
            border-bottom: 1px solid #ddd;
        }
        .checkout-item:last-child {
            border-bottom: none;
        }
        .item-name {
            font-weight: bold;
        }
        .item-total {
            font-weight: bold;
            color: green;
        }
        .total {
            text-align: right;
            font-size: 20px;
            font-weight: bold;
            margin-top: 20px;
        }
        .place-order-btn {
            display: block;
            width: 100%;
            padding: 14px;
            font-size: 18px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            margin-top: 25px;
        }
        .place-order-btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<div class="checkout-container">
    <h2>Checkout Summary</h2>

    <%
        double total = 0;
        for (Map.Entry<Menu, Integer> entry : cart.entrySet()) {
            Menu item = entry.getKey();
            int qty = entry.getValue();
            double itemTotal = item.getPrice() * qty;
            total += itemTotal;
    %>
        <div class="checkout-item">
            <div><span class="item-name"><%= item.getName() %></span> x <%= qty %></div>
            <div class="item-total">₹<%= itemTotal %></div>
        </div>
    <%
        }
    %>

    <div class="total">Total Payable: ₹<%= total %></div>

    <form action="placeOrder" method="post">
        <button type="submit" class="place-order-btn">Place Order</button>
    </form>
</div>

</body>
</html>
