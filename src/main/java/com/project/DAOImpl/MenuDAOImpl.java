package com.project.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.project.DAO.MenuDAO;
import com.project.model.Menu;
import com.project.util.DBConnection;

public class MenuDAOImpl implements MenuDAO{

	private String GET_MENU_BYID = "select * from menu where menuId = ?";
	private String GET_ALL_MENU_ITEMS = "select * from menu";

	
	@Override
	public List<Menu> getAllMenuItems() {
	    List<Menu> list = new ArrayList<>();
	    try (Connection conn = DBConnection.getConnection()) {
	        PreparedStatement ps = conn.prepareStatement(GET_ALL_MENU_ITEMS);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            Menu menu = new Menu();
	            menu.setMenuId(rs.getInt("menuid"));
	            menu.setName(rs.getString("name"));
	            menu.setPrice(rs.getInt("price"));
	            menu.setRating(rs.getDouble("rating"));
	            menu.setImagePath(rs.getString("imagepath"));
	            list.add(menu);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}



	
	
	
	@Override
	public Menu getMenuById(int menuId) {
		Menu menu = null;
		try(Connection connection = DBConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(GET_MENU_BYID )) {
			preparedStatement.setInt(1, menuId);
			ResultSet res = preparedStatement.executeQuery();
			while(res.next()) {
				int id = res.getInt("menuid");
				String name = res.getString("name");
				int price = res.getInt("price");
				double rating = res.getDouble("rating");
				String imagepath = res.getString("imagepath");
				menu = new Menu(id, name,  price, rating, imagepath);
			}
			int i = preparedStatement.executeUpdate();
			System.out.println(i);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return menu;
	}

	@Override
	public void addMenuItem(Menu menu) {

		
	}

	@Override
	public void updateMenuItem(Menu menu) {

		
	}

	@Override
	public void deleteMenuItem(int menuId) {

		
	}

}
