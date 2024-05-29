<%-- 
    Document   : slider
    Created on : May 28, 2024, 7:16:25 PM
    Author     : quant
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>


<html>
<head>
    <meta charset="UTF-8">
    <title>Sliders List</title>
</head>
<body>
    <h1>Sliders List</h1>

    <form action="SlidersList" method="get">
        <label for="searchText">Search:</label>
        <input type="text" id="searchText" name="searchText" value="${param.searchText}">

        <label for="statusIndex">Status:</label>
        <select id="statusIndex" name="statusIndex">
            <option value="0" ${param.statusIndex == 0 ? 'selected' : ''}>All</option>
            <option value="1" ${param.statusIndex == 1 ? 'selected' : ''}>Active</option>
            <option value="2" ${param.statusIndex == 2 ? 'selected' : ''}>Inactive</option>
        </select>

        <button type="submit">Search</button>
    </form>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Description</th>
                <th>Image</th>
                <th>Backlink</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${sliders}" var="slider">
                <tr>
                    <td>${slider.id}</td>
                    <td><a href="SliderDetails?id=${slider.id}">${slider.title}</a></td>
                    <td>${slider.description}</td>
                    <td><img src="${slider.image}" alt="${slider.title}"></td>
                    <td><a href="${slider.backlink}">${slider.backlink}</a></td>
                    <td>${slider.status == 1 ? 'Active' : 'Inactive'}</td>
                    <td>
                        <a href="SlidersList?action=hide&id=${slider.id}">Hide</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <c:if test="${not empty param.id}">
        <h1>Slider Details</h1>

        <img src="${slider.image}" alt="${slider.title}">
        <h2>${slider.title}</h2>
        <p>${slider.details}</p>
        <p>Backlink: <a href="${slider.backlink}">${slider.backlink}</a></p>
        <p>Status: ${slider.status == 1 ? 'Active' : 'Inactive'}</p>
    </c:if>
</body>
</html>