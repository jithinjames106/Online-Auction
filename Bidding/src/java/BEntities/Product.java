/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BEntities;

/**
 *
 * @author User
 */
public class Product {

    private int item_id;
    private String pname;
    private int price;
    private Category catObj;
    private String date;
    private String time;
    private String img;
private float maxamount;

    public float getMaxamount() {
        return maxamount;
    }

    public void setMaxamount(float maxamount) {
        this.maxamount = maxamount;
    }

    public int getItem_id() {
        return item_id;
    }

    public void setItem_id(int item_id) {
        this.item_id = item_id;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public Category getCatObj() {
        return catObj;
    }

    public void setCatObj(Category catObj) {
        this.catObj = catObj;
        
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    
}
