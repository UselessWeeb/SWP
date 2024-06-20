<!DOCTYPE html>
<html>
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
    <form id="filterForm" method="GET" class = "d-flex justify-content-center gap-1 pt-5 pb-2 ms-1 me-1">
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
                                callback: function(value, index, values) {
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
</html>
