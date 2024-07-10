/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import java.util.regex.Pattern;

/**
 *
 * @author M7510
 */
public class Validation {
    public boolean intValidator(int value, int min, int max){
        return value >= min && value <= max;
    }

    public boolean dateValidator(String date){
        String dateRegex = "^(19|20)\\d\\d[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$";
        Pattern pattern = Pattern.compile(dateRegex);
        return pattern.matcher(date).matches();
    }

    public boolean phoneNumberValidator(String phoneNumber){
        String phoneNumberRegex = "^\\+?[1-9]\\d{1,14}$";
        Pattern pattern = Pattern.compile(phoneNumberRegex);
        return pattern.matcher(phoneNumber).matches();
    }

    public boolean emailValidator(String email){
        String emailRegex = "^[A-Za-z0-9+_.-]+@(.+)$";
        Pattern pattern = Pattern.compile(emailRegex);
        return pattern.matcher(email).matches();
    }
}
