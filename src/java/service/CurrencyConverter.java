/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

/**
 *
 * @author M7510
 */
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.DecimalFormat;
import org.json.JSONObject;

public class CurrencyConverter {

    private static final String API_URL = "https://api.exchangerate-api.com/v4/latest/USD"; // Example API URL

    public static float getExchangeRate() throws Exception {
        URL url = new URL(API_URL);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("GET");

        int status = con.getResponseCode();
        if (status != 200) {
            throw new RuntimeException("Failed to get exchange rate");
        }

        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuilder content = new StringBuilder();
        while ((inputLine = in.readLine()) != null) {
            content.append(inputLine);
        }
        
        in.close();
        con.disconnect();

        JSONObject json = new JSONObject(content.toString());
        return json.getJSONObject("rates").getFloat("VND");
    }

    public static String convertUsdToVnd(float amountInUsd) throws Exception {
        float exchangeRate = getExchangeRate();
        float amountInVnd = amountInUsd * exchangeRate;
        DecimalFormat formatter = new DecimalFormat("#,###.00");
        return formatter.format(amountInVnd);
    }

    public float convertVndToUsd(float amountInVnd) throws Exception {
        float exchangeRate = getExchangeRate();
        return amountInVnd / exchangeRate;
    }
}