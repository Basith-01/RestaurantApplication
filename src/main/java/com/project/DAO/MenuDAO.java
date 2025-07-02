package com.project.DAO;

import java.util.List;

import com.project.model.Menu;

public interface MenuDAO {

		List<Menu> getAllMenuItems();
		Menu getMenuById(int menuId);
		void addMenuItem(Menu menu);
		void updateMenuItem(Menu menu);
		void deleteMenuItem(int menuId);

}

