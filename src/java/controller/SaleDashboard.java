/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Order;


/**
 *
 * @author quant
 */
public class SaleDashboard {
    private List<Order> orders;
    private LocalDate startDate;
    private LocalDate endDate;

    public SaleDashboard() {
        // Initialize sample data
        orders = new ArrayList<>();
        orders.add(new Order(1, convertToDate(LocalDate.of(2023, 5, 20)), "Order 1", 100.0f, 1, 1, 1, 1, 1));
        orders.add(new Order(2, convertToDate(LocalDate.of(2023, 5, 21)), "Order 2", 50.0f, 1, 1, 2, 2, 2));
        orders.add(new Order(3, convertToDate(LocalDate.of(2023, 5, 22)), "Order 3", 75.0f, 0, 1, 1, 3, 3));
        orders.add(new Order(4, convertToDate(LocalDate.of(2023, 5, 23)), "Order 4", 200.0f, 1, 1, 3, 4, 4));
        orders.add(new Order(5, convertToDate(LocalDate.of(2023, 5, 24)), "Order 5", 80.0f, 1, 1, 1, 5, 5));
        orders.add(new Order(6, convertToDate(LocalDate.of(2023, 5, 25)), "Order 6", 120.0f, 0, 1, 2, 6, 6));
        orders.add(new Order(7, convertToDate(LocalDate.of(2023, 5, 26)), "Order 7", 90.0f, 1, 1, 1, 7, 7));

        startDate = LocalDate.now().minusDays(6);
        endDate = LocalDate.now();
    }

    private Date convertToDate(LocalDate localDate) {
        return Date.from(localDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
    }

    public void setDateRange(LocalDate startDate, LocalDate endDate) {
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public List<Integer> getSuccessOrdersCounts() {
        // Calculate the success orders count for each day in the date range
        List<Integer> successOrdersCounts = new ArrayList<>();
        for (int i = 0; i < 7; i++) {
            LocalDate date = startDate.plusDays(i);
            int count = (int) orders.stream()
                    .filter(o -> o.getOrder_date().toInstant().atZone(ZoneId.systemDefault()).toLocalDate().equals(date))
                    .filter(o -> o.getStatus() == 1)
                    .count();
            successOrdersCounts.add(count);
        }
        return successOrdersCounts;
    }

    public List<Integer> getTotalOrdersCounts() {
        // Calculate the total orders count for each day in the date range
        List<Integer> totalOrdersCounts = new ArrayList<>();
        for (int i = 0; i < 7; i++) {
            LocalDate date = startDate.plusDays(i);
            int count = (int) orders.stream()
                    .filter(o -> o.getOrder_date().toInstant().atZone(ZoneId.systemDefault()).toLocalDate().equals(date))
                    .count();
            totalOrdersCounts.add(count);
        }
        return totalOrdersCounts;
    }


    public List<Double> getRevenueTrends() {
        // Calculate the revenue trends for each day in the date range
        List<Double> revenueTrends = new ArrayList<>();
        for (int i = 0; i < 7; i++) {
            LocalDate date = startDate.plusDays(i);
            double revenue = orders.stream()
                    .filter(o -> o.getOrder_date().toInstant().atZone(ZoneId.systemDefault()).toLocalDate().equals(date))
                    .mapToDouble(Order::getTotal_price)
                    .sum();
            revenueTrends.add(revenue);
        }
        return revenueTrends;
    }
}
