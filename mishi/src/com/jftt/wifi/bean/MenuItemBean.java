package com.jftt.wifi.bean;

import java.io.Serializable;

public class MenuItemBean implements Serializable {

	/**  
	 * define a field serialVersionUID which type is long
	 */

	private static final long serialVersionUID = -180697851483475785L;
	private long uId;
	private long itemId;
	private String itemName;
	private String itemPic;
	private float itemPrice;
	public long getuId() {
		return uId;
	}
	public void setuId(long uId) {
		this.uId = uId;
	}
	public long getItemId() {
		return itemId;
	}
	public void setItemId(long itemId) {
		this.itemId = itemId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getItemPic() {
		return itemPic;
	}
	public void setItemPic(String itemPic) {
		this.itemPic = itemPic;
	}
	public float getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(float itemPrice) {
		this.itemPrice = itemPrice;
	}
	

}
