package com.project.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.project.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/singin")
public class SignInServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String name = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String confirmpassword = req.getParameter("confirmPassword");

        if (!password.equals(confirmpassword)) {
            req.setAttribute("status", "password_mismatch");
            req.getRequestDispatcher("signin.jsp").forward(req, res);
            return;
        }

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement("INSERT INTO user(username, email, password, confirmpassword) VALUES (?, ?, ?, ?)")) {

            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, password);
            pstmt.setString(4, confirmpassword);

            int i = pstmt.executeUpdate();

            if (i == 1) {
//                res.sendRedirect("login");
            	System.out.println(i);
            } 

            req.getRequestDispatcher("login.jsp").forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("status", "error");
            req.getRequestDispatcher("signin.jsp").forward(req, res);
        }
    }
}
