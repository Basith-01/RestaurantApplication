package com.project.servlets;

import java.io.IOException;
import java.util.List;

import com.project.DAOImpl.MenuDAOImpl;
import com.project.model.Menu;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		MenuDAOImpl mdao = new MenuDAOImpl();

		List<Menu> menuList = mdao.getAllMenuItems(); 
		req.setAttribute("menus", menuList);

		RequestDispatcher rd = req.getRequestDispatcher("Menu.jsp");
		rd.forward(req, res);
	}
}
