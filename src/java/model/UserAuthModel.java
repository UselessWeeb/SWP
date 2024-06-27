/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author M7510
 */
public class UserAuthModel {
    //this basically showing the user auth, duh
    int auth_id;
    String url;
    int role_id;

    public UserAuthModel() {
    }

    public UserAuthModel(int auth_id, String url, int role_id) {
        this.auth_id = auth_id;
        this.url = url;
        this.role_id = role_id;
    }

    public int getAuth_id() {
        return auth_id;
    }

    public void setAuth_id(int auth_id) {
        this.auth_id = auth_id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }
}
