package com.map.VO;

public class MarkerVO {

	private int seq;
	private double x_coordinate;
	private double y_coordinate;
	private String category;
	private String title;
	private String contents;
	private String tel;
	private char use_yn;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public double getX_coordinate() {
		return x_coordinate;
	}
	public void setX_coordinate(double x_coordinate) {
		this.x_coordinate = x_coordinate;
	}
	public double getY_coordinate() {
		return y_coordinate;
	}
	public void setY_coordinate(double y_coordinate) {
		this.y_coordinate = y_coordinate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public char getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(char use_yn) {
		this.use_yn = use_yn;
	}
	
	

}