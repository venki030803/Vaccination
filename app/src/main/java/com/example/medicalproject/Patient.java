package com.example.medicalproject;
public class Patient {
    private String name,user;
    public Patient(String name,  String user) {
        this.name = name;
        this.user = user;
    }
    public String getName() {
        return name;
    }
    public String getuser() {
        return user;
    }
}