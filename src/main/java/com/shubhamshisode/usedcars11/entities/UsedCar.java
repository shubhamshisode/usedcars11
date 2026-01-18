package com.shubhamshisode.usedcars11.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "usedcars")
public class UsedCar {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "carid")
    private int carid;

    @Column(name = "brand", nullable = false, length = 50)
    private String brand;

    @Column(name = "model", nullable = false, length = 50)
    private String model;

    @Column(name = "mfgyear", nullable = false)
    private int mfgyear;

    @Column(name = "kilometers", nullable = false)
    private int kilometers;

    @Column(name = "fueltype", nullable = false, length = 20)
    private String fueltype;

    @Column(name = "color", nullable = false, length = 20)
    private String color;

    @Column(name = "price", nullable = false)
    private float price;

    @Column(name = "ownername", nullable = false, length = 100)
    private String ownername;

    @Column(name = "mobile", nullable = false, length = 20)
    private String mobile;

    @Column(name = "status", nullable = true, length = 20)
    private String status = "AVAILABLE";

    // ===== GETTERS & SETTERS =====

    public int getCarid() {
        return carid;
    }

    public void setCarid(int carid) {
        this.carid = carid;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    // ✅ FIXED getter name
    public int getMfgyear() {
        return mfgyear;
    }

    public void setMfgyear(int mfgyear) {
        this.mfgyear = mfgyear;
    }

    public int getKilometers() {
        return kilometers;
    }

    public void setKilometers(int kilometers) {
        this.kilometers = kilometers;
    }

    public String getFueltype() {
        return fueltype;
    }

    public void setFueltype(String fueltype) {
        this.fueltype = fueltype;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getOwnername() {
        return ownername;
    }

    public void setOwnername(String ownername) {
        this.ownername = ownername;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}