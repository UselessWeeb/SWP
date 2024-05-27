/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import jakarta.servlet.annotation.WebServlet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Set;
import java.util.logging.*;
import model.Role.*;
import model.User;
import org.reflections.Reflections;
import static service.URLfilter.minimizeUrl;

/**
 *
 * @author M7510
 */
public class RoleAuthorization {

    public static HashMap<String, List<Type>> currentMapping = new HashMap();

    public RoleAuthorization() {
        Reflections reflections = new Reflections();

        Set<Class<?>> servletClazzes = reflections.getTypesAnnotatedWith(WebServlet.class);

        for (Class<?> servletClazz : servletClazzes) {
            WebServlet webServlet = servletClazz.getAnnotation(WebServlet.class);
            AccessRole accessRole = servletClazz.getAnnotation(AccessRole.class);
            List<Type> roles = new ArrayList<>();
            if (accessRole != null) {
                roles = Arrays.asList(accessRole.roles());
            }
            for (String s : webServlet.urlPatterns()) {
                currentMapping.put(minimizeUrl(s), roles);
                for (Type role : roles) {
                    Logger.getLogger(this.getClass().getSimpleName()).info("Mapper: " + minimizeUrl(s) + " , " + role.name());
                }
            }
        }
    }
    
    //if no annotation, use this to registed manually
    public void register(String url, List<Type> roles) {
        Logger.getLogger(this.getClass().getSimpleName()).info("Register: " + url);
        currentMapping.put(url, roles);
    }

    public boolean isAllowAnyOneToAccess(String url) {
        List<Type> allowedType = currentMapping.get(minimizeUrl(url));
        if (allowedType == null || allowedType.isEmpty()) {

            if (url == null || url.isEmpty()) {
                return true;
            }

            //handle around GET method(with parameter)
            if (url.contains("?")) {
                url = url.substring(0, url.indexOf("?"));
            }

            Logger.getLogger(this.getClass().getSimpleName()).info("Checking: " + url + ": " + currentMapping.get(url));
            allowedType = currentMapping.get(url);
        }

        boolean result = allowedType == null || allowedType.equals("null") || allowedType.isEmpty();
        Logger.getLogger(this.getClass().getSimpleName()).info("Checking Url :" + url + " :" + result);
        return result;
    }

    public boolean isAllowToAccess(User user, String url) {
        List<Type> allowedType = currentMapping.get(minimizeUrl(url));
        
        // If the page doesn't have the @AccessRole annotation, return true
        if (allowedType == null || allowedType.isEmpty()) {
            return true;
        }

        // If the user is not null, check if their role is in the list of allowed roles
        if (user != null) {
            for (Type type : allowedType) {
                if (type == getRoleTypeById(user.getRole().getRole_id())) {
                    return true;
                }
            }
        }

        return false;
    }

    public Type getRoleTypeById(int roleId) {
        Type[] types = Type.values();
        if (roleId < 1 || roleId > types.length) {
            throw new RuntimeException("Invalid role id, roleId = " + roleId);
        }
        return types[roleId - 1];
    }
}
