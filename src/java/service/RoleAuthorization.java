/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import jakarta.servlet.annotation.WebServlet;
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

        Set<Class<?>> servletClazzes = reflections.getTypesAnnotatedWith(AccessRole.class);

        for (Class<?> servletClazz : servletClazzes) {
            WebServlet webServlet = servletClazz.getAnnotation(WebServlet.class);
            AccessRole accessRole = servletClazz.getAnnotation(AccessRole.class);
            if (webServlet == null) {
                throw new RuntimeException(String.format("AccessRole annotation can only use for servlet {%s}", servletClazz.getSimpleName()));
            }
            for (String s : webServlet.urlPatterns()) {
                currentMapping.put(minimizeUrl(s), Arrays.asList(accessRole.roles()));
                System.out.println(minimizeUrl(s) +" "+ Arrays.asList(accessRole.roles()));
                for (Type role : accessRole.roles()) {
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
        if (isAllowAnyOneToAccess(url)) {
            List<Type> allowedType = currentMapping.get(minimizeUrl(url));
            if (allowedType == null || allowedType.isEmpty()) {
                if (url == null || url.isEmpty()) {
                    return true;
                }
                Logger.getLogger(this.getClass().getSimpleName()).info("Checking: " + url);
                if (url.indexOf("?") >= 0) {
                    url = url.substring(0, url.indexOf("?"));
                }
                allowedType = currentMapping.get(url);
            }
        }
        List<Type> allowedType = currentMapping.get(minimizeUrl(url));
        if (!allowedType.isEmpty()) {
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
