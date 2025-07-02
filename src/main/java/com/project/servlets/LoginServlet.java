package com.project.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.catalina.connector.Response;

import com.project.util.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	private String getQuery = "select * from user where username = ?";
	
	    @Override
	    protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

	        String name = req.getParameter("username");
	        String UPassword = req.getParameter("password");

	        try (Connection con = DBConnection.getConnection(); 
	             PreparedStatement ps = con.prepareStatement(getQuery)) {

	            ps.setString(1, name);
	            ResultSet result = ps.executeQuery();

	            if (result.next()) {
	                String dbPassword = result.getString("password");

	                if (UPassword.equals(dbPassword)) {
	                    System.out.println("Login Successful");
	                    res.sendRedirect("menu");
	                } else {
	                    System.out.println("Invalid Password");
	                    req.setAttribute("status", "invalid_password");
	                    req.getRequestDispatcher("login.jsp").forward(req, res);
	                }


	            } else {
	                System.out.println("User Not Found");
	                req.setAttribute("status", "failed");
	                req.getRequestDispatcher("login.jsp").forward(req, res);
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	            req.setAttribute("status", "error");
	            req.getRequestDispatcher("login.jsp").forward(req, res);
	        }
	    }
	}

