package com.project.servlets;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import com.project.DAOImpl.MenuDAOImpl;
import com.project.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession();

        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
            session.setAttribute("cart", cart);
        }

        int menuid = Integer.parseInt(req.getParameter("menuid"));
        String action = req.getParameter("action");
        String quantityParam = req.getParameter("quantity");

        if ("add".equals(action) || "increase".equals(quantityParam)) {
            cart.put(menuid, cart.getOrDefault(menuid, 0) + 1);
        } else if ("decrease".equals(quantityParam)) {
            int currentQty = cart.getOrDefault(menuid, 0);
            if (currentQty > 1) {
                cart.put(menuid, currentQty - 1);
            } else {
                cart.remove(menuid);
            }
        }

        MenuDAOImpl mdao = new MenuDAOImpl();
        Map<Menu, Integer> cartItems = new LinkedHashMap<>();
        for (int id : cart.keySet()) {
            Menu item = mdao.getMenuById(id);
            if (item != null) {
                cartItems.put(item, cart.get(id));
            }
        }

        session.setAttribute("cartItems", cartItems);
        req.getRequestDispatcher("cart.jsp").forward(req, res);
    }
}
