/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;
import java.sql.Timestamp;

/**
 *
 * @author phamn
 */
public class Token {

    private String tokenString;
    private int userID;
    private LocalDateTime expireDate;
    private int purpose; //0 for verification, 1 for password reset

    public Token() {
    }

    public Token(String token, int userID, LocalDateTime expireDate, int purpose) {
        this.tokenString = token;
        this.userID = userID;
        this.expireDate = expireDate;
        this.purpose = purpose;
    }

    public LocalDateTime getExpireDate() {
        return expireDate;
    }

    public Timestamp getExpireDateAsSqlTimestamp() {
        return Timestamp.valueOf(expireDate);
    }

    public void setExpireDate(LocalDateTime expireDate) {
        this.expireDate = expireDate;
    }

    public boolean isExpired() {
        return expireDate.isAfter(LocalDateTime.now());
    }

    public String getTokenString() {
        return tokenString;
    }

    public void setTokenString(String tokenString) {
        this.tokenString = tokenString;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getPurpose() {
        return purpose;
    }

    public void setPurpose(int purpose) {
        this.purpose = purpose;
    }

}
