<!DOCTYPE html>
<html>
    <head>
        <title>Sales Dashboard</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="format-detection" content="telephone=no">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="author" content="">
        <meta name="keywords" content="">
        <meta name="description" content="">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@100..900&display=swap" rel="stylesheet">
    </head>
    <%@ taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <style>
        .font-bold {
            font-weight: 400;
        }

        .btn{
            max-height: 50px;
            padding: 10px !important;
        }
    </style>
    <c:if test = "${not empty sessionScope.err}">
        <p> ${sessionScope.err}</p>
    </c:if>
    <%@include file = "view/header.jsp" %>
    <form id="filterForm" method="GET" class = "d-flex justify-content-center gap-1 pb-2 ms-1 me-1">
        <label class = "pt-3 font-bold">From:</label><input type="date" id="startDate" name="startDate" class= "form-control" value="${startDate}">
        <label class = "pt-3 font-bold">To:</label><input type="date" id="endDate" name="endDate" class= "form-control" value="${endDate}">
        <select class = "form-select" name = "userId">
            <option value = "">All</option>
            <c:forEach items = "${sales}" var = "sale">
                <option value = "${sale.userId}" ${(sale.userId == selectedUser) ? 'selected' : ''}>${sale.fullName}</option>
            </c:forEach>
        </select>
        <input type="submit" class = "btn btn-primary pt-1" value="Filter" />
    </form>
    <div class="d-flex gap-1 pb-4">
        <div style="width:50%;" class = "card ms-1">
            <canvas id="myChart"></canvas>
        </div>
        <div style="width:50%;" class = "card me-1">
            <canvas id="revenueChart"></canvas>
        </div>
    </div>
    <div class = "pb-5"></div>
    <script>
        var successData = JSON.parse('${requestScope.successOrders}');
        var totalData = JSON.parse('${requestScope.totalOrders}');
        var revenueData = JSON.parse('${requestScope.revenue}');
        console.log(successData);

        var startDateStr = '${requestScope.startDate}';
        var endDateStr = '${requestScope.endDate}';

        var startDate = new Date(startDateStr);
        var endDate = new Date(endDateStr);

        // Generate all dates between start and end dates
        var labels = [];
        var successValues = [];
        var totalValues = [];
        var revenueValues = [];

        for (var d = new Date(startDate); d <= endDate; d.setDate(d.getDate() + 1)) {
            var formattedDate = d.toISOString().split('T')[0]; // Format date to yyyy-MM-dd
            labels.push(formattedDate);

            successValues.push(successData[formattedDate] || 0);
            totalValues.push(totalData[formattedDate] || 0);
            revenueValues.push(revenueData[formattedDate] || 0);

            // Debugging: Log the formatted date and corresponding values
            console.log('Formatted Date:', formattedDate);
            console.log('Success Value:', successData[formattedDate] || 0);
            console.log('Total Value:', totalData[formattedDate] || 0);
            console.log('Revenue Value:', revenueData[formattedDate] || 0);
        }

        var ctx = document.getElementById('myChart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                        label: 'Success Orders',
                        data: successValues,
                        backgroundColor: 'rgba(75, 192, 192, 1)'
                    }, {
                        label: 'Total Orders',
                        data: totalValues,
                        backgroundColor: 'rgba(255, 99, 132, 1)'
                    }]
            },
            options: {
                scales: {
                    x: {
                        barPercentage: 1.0,
                        categoryPercentage: 1.0,
                        title: {
                            display: true,
                            text: 'Date'
                        }
                    },
                    y: {
                        beginAtZero: true,
                        ticks: {
                            stepSize: 0.5
                        }
                    },
                },
                plugins: {
                    title: {
                        display: true,
                        text: 'Sales Dashboard'
                    },
                    legend: {
                        position: 'bottom'
                    },
                }
            }
        });

        var ctx2 = document.getElementById('revenueChart').getContext('2d');
        var revenueChart = new Chart(ctx2, {
            type: 'line',
            data: {
                labels: labels,
                datasets: [{
                        label: 'Revenue',
                        data: revenueValues,
                        backgroundColor: 'rgba(153, 102, 255, 0.2)',
                        borderColor: 'rgba(153, 102, 255, 1)',
                        borderWidth: 1
                    }]
            },
            options: {
                scales: {
                    x: {
                        barPercentage: 1.0,
                        categoryPercentage: 1.0,
                        title: {
                            display: true,
                            text: 'Date'
                        }
                    },
                    y: {
                        beginAtZero: true,
                        ticks: {
                            callback: function (value, index, values) {
                                return '$' + value;
                            }
                        }
                    }
                },
                plugins: {
                    title: {
                        display: true,
                        text: 'Revenue Dashboard'
                    },
                    legend: {
                        position: 'bottom'
                    },
                }
            }
        });
    </script>
    <%@include file = "view/footer.jsp" %>

    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script type="text/javascript" src="js/script.js"></script>
</html>
