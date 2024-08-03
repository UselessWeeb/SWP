/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

/**
 *
 * @author M7510
 */
public class GConstrant {
    //this is the const serve as a way to auth user to Google Login
    public static final String GOOGLE_CLIENT_ID = "";
    public static final String GOOGLE_CLIENT_SECRET = "";
    public static final String GOOGLE_REDIRECT_URI = "http://localhost:9999/app-name/google_login";
    public static final String GOOGLE_GRANT_TYPE = "authorization_code";
    public static final String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
    public static final String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
}
