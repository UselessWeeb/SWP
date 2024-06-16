<%-- 
    Document   : dashboard
    Created on : Jun 16, 2024, 9:13:37 PM
    Author     : M7510
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a>aaaaaaaaaaa</a>
        <canvas id="myChart"></canvas>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        // Assuming you have a variable 'data' that holds your HashMap data in the format {date1: integer1, date2: integer2, ...}
        // Convert the HashMap to two arrays: one for the dates (labels) and one for the integers (data)
        var labels = Object.keys("${requestScope.success}");
        var data = Object.values("${requestScope.success}");
    
        var ctx = document.getElementById('myChart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Success Orders',
                    data: data,
                    borderColor: 'rgba(75, 192, 192, 1)',
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
</html>
