/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author phamn
 */
public class VerificationToken {
    //TODO: CHANGE EXPIREDATE TO CREATEDATE AND MOVE EXPIRATION TO A CONFIG

    private static final int EXPIRATION = 60 * 24;
    private int tokenID;
    private String token;
    private int userID;
    private Date expireDate;

    public VerificationToken() {
    }

    public VerificationToken(int tokenID, String token, int userID) {
        this.tokenID = tokenID;
        this.token = token;
        this.userID = userID;
        this.expireDate = calculateExpiryDate(EXPIRATION);
    }

    private Date calculateExpiryDate(int expiryTimeInMinutes) {
        return new Date(System.currentTimeMillis() + (expiryTimeInMinutes * 60 * 1000));
    }

    public int getTokenID() {
        return tokenID;
    }

    public String getToken() {
        return token;
    }

    public int getUserID() {
        return userID;
    }

    public Date getExpireDate() {
        return expireDate;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }
}
