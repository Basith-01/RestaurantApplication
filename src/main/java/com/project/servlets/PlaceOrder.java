package com.project.servlets;

import java.io.IOException;
import java.util.Map;

import com.project.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/placeOrder")
public class PlaceOrder extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        
        HttpSession session = req.getSession();
        Map<Menu, Integer> cart = (Map<Menu, Integer>) session.getAttribute("cartItems");

        if (cart == null || cart.isEmpty()) {
            resp.sendRedirect("cart.jsp");
            return;
        }

        // TODO: Save order to database here
        // Example loop:
        /*
        for (Map.Entry<Menu, Integer> entry : cart.entrySet()) {
            Menu item = entry.getKey();
            int quantity = entry.getValue();
            // insert into orders table
        }
        */

        // Clear the cart
        session.removeAttribute("cartItems");

        // Forward to confirmation page
        req.getRequestDispatcher("ordersuccess.jsp").forward(req, resp);
    }
}
