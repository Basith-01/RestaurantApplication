package com.project.model;

public class Menu {
	
	private int menuId;
	private String name;
	private int price;
	private double rating;
	private String imagePath;
	
	
	public Menu() {
		// TODO Auto-generated constructor stub
	}


	public Menu(int menuId, String name, int price, double rating, String imagePath) {
		super();
		this.menuId = menuId;
		this.name = name;
		this.price = price;
		this.rating = rating;
		this.imagePath = imagePath;
	}


	public int getMenuId() {
		return menuId;
	}


	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	

	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public double getRating() {
		return rating;
	}


	public void setRating(double rating) {
		this.rating = rating;
	}


	public String getImagePath() {
		return imagePath;
	}


	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	
	
	
	
	


}
