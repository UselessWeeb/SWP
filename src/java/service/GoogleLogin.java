/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import model.User;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

/**
 *
 * @author M7510
 */
public class GoogleLogin {
        public static String getToken(String code) throws ClientProtocolException, IOException {
        String response = Request.Post(GConstrant.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(
                        Form.form()
       .add("client_id", GConstrant.GOOGLE_CLIENT_ID)
                        .add("client_secret", GConstrant.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", GConstrant.GOOGLE_REDIRECT_URI)
                        .add("code", code)
                        .add("grant_type", GConstrant.GOOGLE_GRANT_TYPE)
                        .build()
                )
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }
    
    public static User getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = GConstrant.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        User googlePojo = new Gson().fromJson(response, User.class);
        return googlePojo;
    }
}
